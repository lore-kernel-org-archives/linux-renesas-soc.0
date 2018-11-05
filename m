Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f194.google.com ([209.85.221.194]:42138 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbeKETVZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 14:21:25 -0500
MIME-Version: 1.0
References: <1540583850-30825-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1540583850-30825-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 11:02:17 +0100
Message-ID: <CAMuHMdXZyAvNApzWHgCkO1t_fNGL2J_PMd1R=wcusCZ=QKkB=g@mail.gmail.com>
Subject: Re: [RFC] gpio: rcar: Request GPIO before enabling interrupt
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

On Fri, Oct 26, 2018 at 9:57 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> There are cases when the bootloader configures a pin to work
> as a function rather than GPIO, and other cases when the pin
> is configured as a function at POR.
> This commit makes sure the pin is configured as a GPIO the
> moment we need it to work as an interrupt.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>
> Dear All,
>
> we have got some issues while trying to bring up the interrupt
> line of the HDMI transmitter on the iwg23s, as GP2_29 is configured
> as a function when the kernel starts, and therefore setting up the
> interrupt from the driver won't have the desired effect.
> This patch makes sure the pinctrl driver sets GP2[29] to GP-2-29
> before enabling the interrupt, but it doesn't addresses the
> "direction problem", as in the pin will be a GPIO after calling
> gc->request, but the direction would be whatever was previously
> configured. There could be the option of moving the additional
> code added by this patch to the bottom of function
> gpio_rcar_irq_set_type, but is that going to behave properly on
> every SoC this driver is supporting?
> Is configuring every gpio with direction input while probing
> something that should be looked into to reduce concerns over
> switching from function to GPIO?

Configuring everything to input may cause issues where a GPIO is connected
to the reset line of an external device, and where the bootloader configured the
line to deassert the reset.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
