Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f193.google.com ([209.85.221.193]:39849 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbeKET3v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 14:29:51 -0500
MIME-Version: 1.0
References: <1541185843-32732-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1541185843-32732-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 11:10:41 +0100
Message-ID: <CAMuHMdV4gz8rZNFc_i-x5CsKEucG10Sin-_cyQvFN67X3qDS0g@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Request GPIO while enabling interrupt
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Fri, Nov 2, 2018 at 8:10 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> There are cases when the bootloader configures a pin to work
> as a function rather than GPIO, and other cases when the pin
> is configured as a function at POR.
> This commit makes sure the pin is configured as a GPIO the
> moment we need it to work as an interrupt.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
> RFC->PATCH:
> * Moved gc->request to the bottom of gpio_rcar_irq_set_type

Thanks for the update!

> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -147,6 +147,7 @@ static int gpio_rcar_irq_set_type(struct irq_data *d, unsigned int type)
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct gpio_rcar_priv *p = gpiochip_get_data(gc);
>         unsigned int hwirq = irqd_to_hwirq(d);
> +       int err;
>
>         dev_dbg(&p->pdev->dev, "sense irq = %d, type = %d\n", hwirq, type);
>
> @@ -176,6 +177,13 @@ static int gpio_rcar_irq_set_type(struct irq_data *d, unsigned int type)
>         default:
>                 return -EINVAL;
>         }
> +
> +       err = gc->request(gc, hwirq);

Call gpio_rcar_request() directly?

Where should the matching gpio_rcar_free() be called?

> +       if (err) {
> +               dev_err(&p->pdev->dev, "Can't request GPIO %d from %s\n", hwirq,

%u for unsigned int

> +                       gc->label);
> +               return err;
> +       }
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
