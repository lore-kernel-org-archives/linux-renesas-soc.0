Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:44425 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751059AbeDPNCo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Apr 2018 09:02:44 -0400
MIME-Version: 1.0
In-Reply-To: <1c6cc202-5f20-4304-11ae-79ea0c559457@cogentembedded.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com> <1c6cc202-5f20-4304-11ae-79ea0c559457@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Apr 2018 15:02:43 +0200
Message-ID: <CAMuHMdVBxjMuB8A5tgEhhRsSzNH=ww3Wf2ednAiY4MDr6gmFLw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: add pin I/O voltage control
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thanks for your patch!

On Fri, Apr 13, 2018 at 8:29 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the pin I/O voltage level control to the R8A77980 PFC driver.

Subject says r8a77970?

> Loosely based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77980.c |   50 +++++++++++++++++++++++++++++++---
>  1 file changed, 47 insertions(+), 3 deletions(-)
>
> Index: renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
> ===================================================================
> --- renesas-drivers.orig/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
> +++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77980.c

Ah, pfc-r8a77980.c it is.

> @@ -2779,8 +2779,51 @@ static const struct pinmux_cfg_reg pinmu
>         { },
>  };
>
> +enum ioctrl_regs {
> +       IOCTRL30,
> +       IOCTRL31,
> +       IOCTRL32,
> +};
> +
> +static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
> +       [IOCTRL30] = { 0xe6060380, },
> +       [IOCTRL31] = { 0xe6060384, },
> +       [IOCTRL32] = { 0xe6060388, },
> +       { /* sentinel */ },

However, r8a77980 has 4 IOCTRL3x registers (r8a77970 has three)?

Something is wrong: which SoC source file is this patch for?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
