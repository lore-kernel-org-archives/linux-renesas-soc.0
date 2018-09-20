Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ve1eur01on0121.outbound.protection.outlook.com ([104.47.1.121]:49231
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387475AbeITXI2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 19:08:28 -0400
Subject: Re: [RFC PATCH 1/4] i2c: core: remove outdated DEBUG output
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
 <20180920161423.13990-2-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <8b2e7959-da7f-846f-ace4-9859d3290c04@axentia.se>
Date: Thu, 20 Sep 2018 19:23:44 +0200
MIME-Version: 1.0
In-Reply-To: <20180920161423.13990-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-09-20 18:14, Wolfram Sang wrote:
> The usefulness of this debug output is questionable. It covers only
> direct i2c_transfer calls and no SMBUS calls, neither direct nor
> emulated ones. And the latter one is largely used in the kernel, so a
> lot of stuff is missed. Also, we have a proper tracing mechanism for all
> these kinds of transfers in place for years now. Remove this old one.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

This old one fires before locking and even if locking fails for the
atomic/irq case. You might want to mention that in the commit message?
But I certainly agree with the usefulness statement...

Acked-by: Peter Rosin <peda@axentia.se>

> ---
>  drivers/i2c/i2c-core-base.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9ee9a15e7134..c2b352c46fae 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1940,16 +1940,6 @@ int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>  	 */
>  
>  	if (adap->algo->master_xfer) {
> -#ifdef DEBUG
> -		for (ret = 0; ret < num; ret++) {
> -			dev_dbg(&adap->dev,
> -				"master_xfer[%d] %c, addr=0x%02x, len=%d%s\n",
> -				ret, (msgs[ret].flags & I2C_M_RD) ? 'R' : 'W',
> -				msgs[ret].addr, msgs[ret].len,
> -				(msgs[ret].flags & I2C_M_RECV_LEN) ? "+" : "");
> -		}
> -#endif
> -
>  		if (in_atomic() || irqs_disabled()) {
>  			ret = i2c_trylock_bus(adap, I2C_LOCK_SEGMENT);
>  			if (!ret)
> 
