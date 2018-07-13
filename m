Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45526 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731443AbeGMIOx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 04:14:53 -0400
Date: Fri, 13 Jul 2018 10:01:20 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpiolib: use better errno if get_direction is not
 available
Message-ID: <20180713080120.o3jidaciav24jptf@verge.net.au>
References: <20180711163319.28004-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180711163319.28004-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 11, 2018 at 06:33:19PM +0200, Wolfram Sang wrote:
> EINVAL is very generic, use ENOTSUPP in case the gpiochip does not
> provide this function. While removing the assignment from the 'status'
> variable, use better indentation in the declaration block.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
> I got puzzled by the EINVAL until I found out that gpio-rcar simply does not
> implement it.
> 
> @Geert: any reason gpio-rcar is missing it? I would need it for the
> i2c-gpio-fault-injector.
> 
>  drivers/gpio/gpiolib.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e11a3bb03820..18719f64e80b 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -210,15 +210,15 @@ static int gpiochip_find_base(int ngpio)
>   */
>  int gpiod_get_direction(struct gpio_desc *desc)
>  {
> -	struct gpio_chip	*chip;
> -	unsigned		offset;
> -	int			status = -EINVAL;
> +	struct gpio_chip *chip;
> +	unsigned offset;
> +	int status;
>  
>  	chip = gpiod_to_chip(desc);
>  	offset = gpio_chip_hwgpio(desc);
>  
>  	if (!chip->get_direction)
> -		return status;
> +		return -ENOTSUPP;
>  
>  	status = chip->get_direction(chip, offset);
>  	if (status > 0) {
> -- 
> 2.11.0
> 
