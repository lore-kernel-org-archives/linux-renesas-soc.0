Return-Path: <linux-i2c-owner@vger.kernel.org>
Date: Fri, 13 Jul 2018 09:57:52 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH] i2c: recovery: remove bogus check if SDA GPIO is set to
 output
Message-ID: <20180713075751.vkhwayskcmamdi3c@verge.net.au>
References: <20180712162854.8280-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180712162854.8280-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 12, 2018 at 06:28:54PM +0200, Wolfram Sang wrote:
> This check did not work as intended. I2C is open drain, so this function
> will likely always have presented the GPIO as input because
> gpiod_get_direction doesn't know about open drain states. Remove this
> check for now. We can add it again once we know how to get more precise
> information about the GPIO.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/i2c/i2c-core-base.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 57538d72f2e5..4debf921ab5c 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -269,9 +269,7 @@ static void i2c_init_recovery(struct i2c_adapter *adap)
>  		bri->set_scl = set_scl_gpio_value;
>  		if (bri->sda_gpiod) {
>  			bri->get_sda = get_sda_gpio_value;
> -			/* FIXME: add proper flag instead of '0' once available */
> -			if (gpiod_get_direction(bri->sda_gpiod) == 0)
> -				bri->set_sda = set_sda_gpio_value;
> +			bri->set_sda = set_sda_gpio_value;
>  		}
>  		return;
>  	}
> -- 
> 2.11.0
> 
