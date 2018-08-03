Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:46091 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727682AbeHCKJ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Aug 2018 06:09:29 -0400
MIME-Version: 1.0
References: <1533219087-33695-1-git-send-email-biju.das@bp.renesas.com> <1533219087-33695-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533219087-33695-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Aug 2018 10:14:05 +0200
Message-ID: <CAMuHMdW7rY9Vho4qpo=K9qoqR1bfn=6Xqb9h=T0CGfb+v=X11Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpio: rcar: Add GPIO hole support
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

On Thu, Aug 2, 2018 at 4:17 PM Biju Das <biju.das@bp.renesas.com> wrote:
> GPIO hole is present in RZ/G1C SoC. Valid GPIO pins on bank3 are in the
> range GP3_0 to GP3_16 and GP3_27 to GP3_29. The GPIO pins between GP3_17
> to GP3_26 are unused. Add support for handling unused GPIO's.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
> V1-->V2
>     * Added gpio-reserved-ranges support for handling
>       unused gpios.

Thanks for the update!

> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -38,6 +38,7 @@ struct gpio_rcar_bank_info {
>         u32 edglevel;
>         u32 bothedge;
>         u32 intmsk;
> +       u32 gpiomsk;

I think you can do without adding this variable (see below).

>  };
>
>  struct gpio_rcar_priv {
> @@ -252,6 +253,9 @@ static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
>         struct gpio_rcar_priv *p = gpiochip_get_data(chip);
>         int error;
>
> +       if (!gpiochip_line_is_valid(chip, offset))
> +               return -EINVAL;
> +

Perhaps this check should be added to gpiod_request_commit(), so not all
drivers (currently drivers/pinctrl/qcom/pinctrl-msm.c) have to check it
themselves?

>         error = pm_runtime_get_sync(&p->pdev->dev);
>         if (error < 0)
>                 return error;
> @@ -313,6 +317,9 @@ static void gpio_rcar_set_multiple(struct gpio_chip *chip, unsigned long *mask,
>         unsigned long flags;
>         u32 val, bankmask;
>
> +       if (chip->valid_mask && (mask[0] & p->bank_info.gpiomsk))
> +               return;
> +

You can use chip->valid_mask[0] instead of p->bank_info.gpiomsk.
However,  instead of returning, I would just ignore any invalid bits set.
Bits > chip->ngpio are already ignored below...

>         bankmask = mask[0] & GENMASK(chip->ngpio - 1, 0);

... so just add:

    if (chip->valid_mask)
            bankmask &= chip->valid_mask[0];

However, if you force gpiochip->need_valid_mask = true, you can just use

    bankmask = mask[0] & chip->valid_mask[0];

unconditionally.

>         if (!bankmask)
>                 return;
> @@ -399,7 +406,8 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
>         struct device_node *np = p->pdev->dev.of_node;
>         const struct gpio_rcar_info *info;
>         struct of_phandle_args args;
> -       int ret;
> +       int ret, len, i;
> +       u32 start, count;
>
>         info = of_device_get_match_data(&p->pdev->dev);
>
> @@ -414,6 +422,22 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
>                 *npins = RCAR_MAX_GPIO_PER_BANK;
>         }
>
> +       p->bank_info.gpiomsk = 0;
> +       len = of_property_count_u32_elems(np,  "gpio-reserved-ranges");
> +       if (len < 0 || len % 2 != 0)
> +               return 0;
> +
> +       for (i = 0; i < len; i += 2) {
> +               of_property_read_u32_index(np, "gpio-reserved-ranges",
> +                                          i, &start);
> +               of_property_read_u32_index(np, "gpio-reserved-ranges",
> +                                          i + 1, &count);
> +               if (start >= *npins || start + count >= *npins)
> +                       continue;
> +
> +               p->bank_info.gpiomsk = GENMASK(start + count - 1, start);
> +       }

of_gpiochip_init_valid_mask() already does the same, for chip->valid_mask.

> +
>         return 0;
>  }
>
> @@ -471,6 +495,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
>         gpio_chip->owner = THIS_MODULE;
>         gpio_chip->base = -1;
>         gpio_chip->ngpio = npins;
> +       gpio_chip->need_valid_mask = p->bank_info.gpiomsk ? true : false;

gpiochip_init_valid_mask() already sets gpio_chip->need_valid_mask to true
if "gpio-reserved-ranges" is detected.
However, setting it to true unconditionally allow to simplify
gpio_rcar_set_multiple()
and gpio_rcar_resume().

>
>         irq_chip = &p->irq_chip;
>         irq_chip->name = name;
> @@ -551,6 +576,9 @@ static int gpio_rcar_resume(struct device *dev)
>
>         for (offset = 0; offset < p->gpio_chip.ngpio; offset++) {
>                 mask = BIT(offset);
> +               if (p->gpio_chip.valid_mask && (mask & p->bank_info.gpiomsk))
> +                       continue;
> +

Just do "if (!gpiochip_line_is_valid(chip, offset)) continue;" at the
top of the loop?

However, if you force gpiochip->need_valid_mask = true, you can just replace
the  hand-coded for loop by for_each_set_bit().

>                 /* I/O pin */
>                 if (!(p->bank_info.iointsel & mask)) {
>                         if (p->bank_info.inoutsel & mask)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
