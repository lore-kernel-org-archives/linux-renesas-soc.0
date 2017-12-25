Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:50575 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752516AbdLYIfp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Dec 2017 03:35:45 -0500
Subject: Re: [PATCH/RFT v2] gpio: gpio-rcar: Support S2RAM
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        <linux-gpio@vger.kernel.org>
References: <1514122643-28838-1-git-send-email-ykaneko0929@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        <linux-renesas-soc@vger.kernel.org>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <8e88fcd7-655d-fad6-7838-4e84cdfca7c9@mentor.com>
Date: Mon, 25 Dec 2017 10:35:38 +0200
MIME-Version: 1.0
In-Reply-To: <1514122643-28838-1-git-send-email-ykaneko0929@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/24/2017 03:37 PM, Yoshihiro Kaneko wrote:
> From: Hien Dang <hien.dang.eb@renesas.com>
> 
> This patch adds an implementation that saves and restores the state of
> GPIO configuration on suspend and resume.
> 
> Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [Modify structure of the bank info to simplify a saving registers]
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---

[snip]

> +static SIMPLE_DEV_PM_OPS(gpio_rcar_pm_ops,
> +		gpio_rcar_suspend, gpio_rcar_resume);
> +#define DEV_PM_OPS (&gpio_rcar_pm_ops)
> +#else
> +#define DEV_PM_OPS NULL
> +#endif /* CONFIG_PM_SLEEP*/
> +
>  static int gpio_rcar_probe(struct platform_device *pdev)
>  {
>  	struct gpio_rcar_priv *p;
> @@ -536,6 +604,7 @@ static int gpio_rcar_remove(struct platform_device *pdev)
>  	.remove		= gpio_rcar_remove,
>  	.driver		= {
>  		.name	= "gpio_rcar",
> +		.pm     = DEV_PM_OPS,
>  		.of_match_table = of_match_ptr(gpio_rcar_of_table),
>  	}
>  };
> 

You can safely follow the next simpler pattern (add pm functions after
gpio_rcar_remove() function and remove DEV_PM_OPS macro):

#ifdef CONFIG_PM_SLEEP
static int gpio_rcar_suspend(struct device *dev)
{
	...
}

static int gpio_rcar_resume(struct device *dev)
{
	...
}
#endif

static SIMPLE_DEV_PM_OPS(gpio_rcar_pm_ops, gpio_rcar_suspend, gpio_rcar_resume);

static struct platform_driver gpio_rcar_device_driver = {
        .probe          = gpio_rcar_probe,
	.remove		= gpio_rcar_remove,
	.driver		= {
		.name	= "gpio_rcar",
		.pm     = &gpio_rcar_pm_ops,
		.of_match_table = of_match_ptr(gpio_rcar_of_table),
	}
};

--
With best wishes,
Vladimir
