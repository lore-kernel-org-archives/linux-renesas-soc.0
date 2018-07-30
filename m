Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:39319 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbeG3LiI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 07:38:08 -0400
MIME-Version: 1.0
References: <1532685089-35645-1-git-send-email-biju.das@bp.renesas.com> <1532685089-35645-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1532685089-35645-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jul 2018 12:03:41 +0200
Message-ID: <CAMuHMdVqSbeGCN-Oq0R2CY5fOoG3ncdc_MtAp6M5+SoW4xXQZw@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: rcar: Enhance gpio-ranges support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Fri, Jul 27, 2018 at 11:57 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Enhance gpio-ranges to support more than one gpio-range.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

However, I'm wondering if this works as intended, as the discontinuity is
not in the pins, but in the GPIO bits.

> ---
> cat /sys/kernel/debug/pinctrl/e6060000.pin-controller-sh-pfc/gpio-
> GPIO ranges handled:
> 0: e6050000.gpio GPIOS [1001 - 1023] PINS [0 - 22]
> 0: e6051000.gpio GPIOS [978 - 1000] PINS [32 - 54]
> 0: e6052000.gpio GPIOS [946 - 977] PINS [64 - 95]
> 0: e6053000.gpio GPIOS [926 - 942] PINS [96 - 112]
> 17: e6053000.gpio GPIOS [943 - 945] PINS [123 - 125]

The above two lines are the result of:

+                       gpio-ranges = <&pfc 0 96 17>, <&pfc 17 123 3>;

> 0: e6054000.gpio GPIOS [900 - 925] PINS [128 - 153]
> 0: e6055000.gpio GPIOS [868 - 899] PINS [160 - 191]
> ---
>  drivers/gpio/gpio-rcar.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index 350390c..a7bbe78 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -399,13 +399,22 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
>         struct device_node *np = p->pdev->dev.of_node;
>         const struct gpio_rcar_info *info;
>         struct of_phandle_args args;
> -       int ret;
> +       int index = 0, ret;
>
>         info = of_device_get_match_data(&p->pdev->dev);
>
> -       ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args);
> -       *npins = ret == 0 ? args.args[2] : RCAR_MAX_GPIO_PER_BANK;
>         p->has_both_edge_trigger = info->has_both_edge_trigger;
> +       *npins = 0;
> +       for (;; index++) {
> +               ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> +                                                       index, &args);
> +               if (ret) {
> +                       if (index == 0)
> +                               *npins = RCAR_MAX_GPIO_PER_BANK;
> +                       break;
> +               }
> +               *npins += args.args[2];
> +       }

So after this, *npins will be the total number of GPIOs present in this bank
(17 + 3 = 20), which will be used as gpio_chip.ngpio.

All GPIO operations will use the passed offset as the bit number.
gpio_rcar_resume() will resume bits 0..ngpio - 1 of each register.
gpio_rcar_set_multiple() uses GENMASK(chip->ngpio - 1, 0) as the bank mask,
and uses it to mask of bits in the registers.

Hence all of the above assumes the register bits for the GPIOs are 0..19.
However, according to the datasheet, the GPIOs in bank 3 are 0..16 and
27..29. So accessing GPIOs 17..19 in the bank will write to bits 17..19,
not to 27..29!

A simple way to work around this is to set ngpios to the highest bit number
in use + 1. But you still need a mechanism to avoid accessing the unused
bits in the gap between 16 and 27.

>
>         if (*npins == 0 || *npins > RCAR_MAX_GPIO_PER_BANK) {
>                 dev_warn(&p->pdev->dev,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
