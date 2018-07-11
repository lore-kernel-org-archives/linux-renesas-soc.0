Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr70132.outbound.protection.outlook.com ([40.107.7.132]:60288
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726146AbeGKGKt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 02:10:49 -0400
Subject: Re: [PATCH 1/2] i2c: recovery: add get_bus_free callback
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20180710222423.7792-1-wsa+renesas@sang-engineering.com>
 <20180710222423.7792-2-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <e87cb471-e26b-5f57-c1f7-4d403c476a9d@axentia.se>
Date: Wed, 11 Jul 2018 08:08:02 +0200
MIME-Version: 1.0
In-Reply-To: <20180710222423.7792-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-07-11 00:24, Wolfram Sang wrote:
> Some IP cores have an internal 'bus free' logic which may be more
> advanced than just checking if SDA is high. Add a separate callback to
> get this status. Filling it is optional.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 27 +++++++++++++++++++++++----
>  include/linux/i2c.h         |  3 +++
>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index c7995efd58ea..59f8dfc5be36 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -158,6 +158,22 @@ static void set_sda_gpio_value(struct i2c_adapter *adap, int val)
>  	gpiod_set_value_cansleep(adap->bus_recovery_info->sda_gpiod, val);
>  }
>  
> +static int i2c_generic_bus_free(struct i2c_adapter *adap)
> +{
> +	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
> +	int ret = -EOPNOTSUPP;
> +
> +	if (bri->get_bus_free)
> +		ret = bri->get_bus_free(adap);
> +	else if (bri->get_sda)
> +		ret = bri->get_sda(adap);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return ret ? 0 : -EBUSY;
> +}

Hmmm, the name i2c_generic_bus_free suggests that scl should also be checked,
because the *bus* isn't really free unless both lines are high? No? Or, maybe
just rename to i2c_generic_sda_free (or something)?

But that's of course just a nit...

More importantly, isn't a ->get_bus_free implementation a sufficient requirement
for recovery? I.e. even if both ->get_sda and ->set_sda are missing?

Cheers,
Peter

> +
>  /*
>   * We are generating clock pulses. ndelay() determines durating of clk pulses.
>   * We will generate clock with rate 100 KHz and so duration of both clock levels
> @@ -169,7 +185,7 @@ static void set_sda_gpio_value(struct i2c_adapter *adap, int val)
>  int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>  {
>  	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
> -	int i = 0, val = 1, ret = 0;
> +	int i = 0, val = 1, ret;
>  
>  	if (bri->prepare_recovery)
>  		bri->prepare_recovery(adap);
> @@ -207,14 +223,17 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>  			bri->set_sda(adap, val);
>  		ndelay(RECOVERY_NDELAY / 2);
>  
> -		/* Break if SDA is high */
> -		if (val && bri->get_sda) {
> -			ret = bri->get_sda(adap) ? 0 : -EBUSY;
> +		if (val) {
> +			ret = i2c_generic_bus_free(adap);
>  			if (ret == 0)
>  				break;
>  		}
>  	}
>  
> +	/* If we can't check bus status, assume recovery worked */
> +	if (ret == -EOPNOTSUPP)
> +		ret = 0;
> +
>  	if (bri->unprepare_recovery)
>  		bri->unprepare_recovery(adap);
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 9d1818c56775..60e224428a85 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -587,6 +587,8 @@ struct i2c_timings {
>   * @set_sda: This sets/clears the SDA line. This or get_sda() is mandatory for
>   *	generic SCL recovery. Populated internally, if sda_gpio is a valid GPIO,
>   *	for generic GPIO recovery.
> + * @get_bus_free: Returns the bus free state as seen from the IP core in case it
> + *	has a more complex internal logic than just reading SDA. Optional.
>   * @prepare_recovery: This will be called before starting recovery. Platform may
>   *	configure padmux here for SDA/SCL line or something else they want.
>   * @unprepare_recovery: This will be called after completing recovery. Platform
> @@ -601,6 +603,7 @@ struct i2c_bus_recovery_info {
>  	void (*set_scl)(struct i2c_adapter *adap, int val);
>  	int (*get_sda)(struct i2c_adapter *adap);
>  	void (*set_sda)(struct i2c_adapter *adap, int val);
> +	int (*get_bus_free)(struct i2c_adapter *adap);
>  
>  	void (*prepare_recovery)(struct i2c_adapter *adap);
>  	void (*unprepare_recovery)(struct i2c_adapter *adap);
> 
