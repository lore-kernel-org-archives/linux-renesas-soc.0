Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr20129.outbound.protection.outlook.com ([40.107.2.129]:19080
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727171AbeITXQA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 19:16:00 -0400
Subject: Re: [RFC PATCH 3/4] i2c: core: use I2C locking behaviour also for
 SMBUS
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        preid@electromag.com.au, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20180920161423.13990-1-wsa+renesas@sang-engineering.com>
 <20180920161423.13990-4-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <e31d69ed-d849-db98-00c2-27d489a2dac1@axentia.se>
Date: Thu, 20 Sep 2018 19:31:19 +0200
MIME-Version: 1.0
In-Reply-To: <20180920161423.13990-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-09-20 18:14, Wolfram Sang wrote:
> If I2C transfers are executed in atomic contexts, trylock is used
> instead of lock. This behaviour was missing for SMBUS, although a lot of
> transfers are of SMBUS type, either emulated or direct. So, factor out
> the locking routine into a helper and use it for I2C and SMBUS.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Is it ok with static analyzers to "hide" the locking in helpers like
this? Will it not be harder for them to "see" what's going on? But I
don't think we have any annotations anyway, so...

Acked-by: Peter Rosin <peda@axentia.se>


> ---
>  drivers/i2c/i2c-core-base.c  | 11 +++--------
>  drivers/i2c/i2c-core-smbus.c |  7 ++++++-
>  drivers/i2c/i2c-core.h       | 12 ++++++++++++
>  3 files changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 799776c6d421..904b4d2ebefa 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1943,14 +1943,9 @@ int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>  	 *    one (discarding status on the second message) or errno
>  	 *    (discarding status on the first one).
>  	 */
> -	if (in_atomic() || irqs_disabled()) {
> -		ret = i2c_trylock_bus(adap, I2C_LOCK_SEGMENT);
> -		if (!ret)
> -			/* I2C activity is ongoing. */
> -			return -EAGAIN;
> -	} else {
> -		i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
> -	}
> +	ret = __i2c_lock_bus_helper(adap);
> +	if (ret)
> +		return ret;
>  
>  	ret = __i2c_transfer(adap, msgs, num);
>  	i2c_unlock_bus(adap, I2C_LOCK_SEGMENT);
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> index 9cd66cabb84f..dbb46edb8e02 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -20,6 +20,8 @@
>  #include <linux/i2c-smbus.h>
>  #include <linux/slab.h>
>  
> +#include "i2c-core.h"
> +
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/smbus.h>
>  
> @@ -530,7 +532,10 @@ s32 i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
>  {
>  	s32 res;
>  
> -	i2c_lock_bus(adapter, I2C_LOCK_SEGMENT);
> +	res = __i2c_lock_bus_helper(adapter);
> +	if (res)
> +		return res;
> +
>  	res = __i2c_smbus_xfer(adapter, addr, flags, read_write,
>  			       command, protocol, data);
>  	i2c_unlock_bus(adapter, I2C_LOCK_SEGMENT);
> diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> index 37576f50fe20..6e98aa811980 100644
> --- a/drivers/i2c/i2c-core.h
> +++ b/drivers/i2c/i2c-core.h
> @@ -29,6 +29,18 @@ extern int		__i2c_first_dynamic_bus_num;
>  
>  int i2c_check_7bit_addr_validity_strict(unsigned short addr);
>  
> +static inline int __i2c_lock_bus_helper(struct i2c_adapter *adap)
> +{
> +	int ret = 0;
> +
> +	if (in_atomic() || irqs_disabled())
> +		ret = i2c_trylock_bus(adap, I2C_LOCK_SEGMENT) ? 0 : -EAGAIN;
> +	else
> +		i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
> +
> +	return ret;
> +}
> +
>  #ifdef CONFIG_ACPI
>  const struct acpi_device_id *
>  i2c_acpi_match_device(const struct acpi_device_id *matches,
> 
