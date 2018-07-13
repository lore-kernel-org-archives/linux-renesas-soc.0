Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45407 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729284AbeGMIKf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 04:10:35 -0400
Date: Fri, 13 Jul 2018 09:57:03 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gpio: rcar: Implement .get_direction() callback
Message-ID: <20180713075702.jnjmzhue35xqnkfg@verge.net.au>
References: <20180712091501.22344-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180712091501.22344-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 12, 2018 at 11:15:01AM +0200, Geert Uytterhoeven wrote:
> Allow gpiolib to read back the current I/O direction configuration by
> implementing the .get_direction() callback.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/gpio/gpio-rcar.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index 4d2cc6d32184f390..ec04752b6bd25fb6 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -278,6 +278,13 @@ static void gpio_rcar_free(struct gpio_chip *chip, unsigned offset)
>  	pm_runtime_put(&p->pdev->dev);
>  }
>  
> +static int gpio_rcar_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
> +
> +	return !(gpio_rcar_read(p, INOUTSEL) & BIT(offset));
> +}
> +
>  static int gpio_rcar_direction_input(struct gpio_chip *chip, unsigned offset)
>  {
>  	gpio_rcar_config_general_input_output_mode(chip, offset, false);
> @@ -461,6 +468,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
>  	gpio_chip = &p->gpio_chip;
>  	gpio_chip->request = gpio_rcar_request;
>  	gpio_chip->free = gpio_rcar_free;
> +	gpio_chip->get_direction = gpio_rcar_get_direction;
>  	gpio_chip->direction_input = gpio_rcar_direction_input;
>  	gpio_chip->get = gpio_rcar_get;
>  	gpio_chip->direction_output = gpio_rcar_direction_output;
> -- 
> 2.17.1
> 
