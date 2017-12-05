Return-Path: <linux-i2c-owner@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx: use proper GPIO directions for recovery
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Clemens Gruber <clemens.gruber@pqgruber.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20171204123154.3233-1-wsa+renesas@sang-engineering.com>
From: Phil Reid <preid@electromag.com.au>
Message-ID: <11e60647-81b2-3c53-51d9-6d8548b6d38a@electromag.com.au>
Date: Tue, 5 Dec 2017 08:28:10 +0800
MIME-Version: 1.0
In-Reply-To: <20171204123154.3233-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 4/12/2017 20:31, Wolfram Sang wrote:
> When converting to GPIOD, the GPIO directions of SCL/SDA have been
> swapped. Fix it!
Sorry about that.

Reviewed-by: Phil Reid <preid@electromag.com.au>


> 
> Fixes: ad36a27959cabb ("i2c: imx: switch to using gpiod for bus recovery gpios")
> Cc: Clemens Gruber <clemens.gruber@pqgruber.com>
> Cc: Phil Reid <preid@electromag.com.au>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/i2c/busses/i2c-imx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index c4cf26571b6612..6c0d59ddf5b6fd 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1006,8 +1006,8 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
>   			PINCTRL_STATE_DEFAULT);
>   	i2c_imx->pinctrl_pins_gpio = pinctrl_lookup_state(i2c_imx->pinctrl,
>   			"gpio");
> -	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda", GPIOD_OUT_HIGH);
> -	rinfo->scl_gpiod = devm_gpiod_get(&pdev->dev, "scl", GPIOD_IN);
> +	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
> +	rinfo->scl_gpiod = devm_gpiod_get(&pdev->dev, "scl", GPIOD_OUT_HIGH);
>   
>   	if (PTR_ERR(rinfo->sda_gpiod) == -EPROBE_DEFER ||
>   	    PTR_ERR(rinfo->scl_gpiod) == -EPROBE_DEFER) {
> 


-- 
Regards
Phil Reid
