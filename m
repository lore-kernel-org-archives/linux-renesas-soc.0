Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:40851 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752159AbeDSNGq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Apr 2018 09:06:46 -0400
MIME-Version: 1.0
In-Reply-To: <ba26106b-8a22-6784-b8dc-056d7bd9be86@cogentembedded.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com> <ba26106b-8a22-6784-b8dc-056d7bd9be86@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Apr 2018 15:06:44 +0200
Message-ID: <CAMuHMdVgowxnn6puvXg92r-TVJwYPhkfe=DPtLAfJ1CnOQCk5Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a77970: fix pin I/O voltage control support
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

On Wed, Apr 18, 2018 at 10:26 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> I've included the pin I/O voltage control into the R8A77970 PFC driver but
> it was incomplete because:
> - SH_PFC_PIN_CFG_IO_VOLTAGE pin flags weren't set properly;
> - sh_pfc_soc_info::ioctrl_regs wasn't set at all...

Thanks for your patch!

> Fixes: b92ac66a1819 ("pinctrl: sh-pfc: Add R8A77970 PFC support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Minor nit below...

> --- renesas-drivers.orig/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> +++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c

> @@ -2382,18 +2384,33 @@ static const struct pinmux_cfg_reg pinmu
>         { },
>  };
>
> +enum ioctrl_regs {
> +       IOCTRL30,
> +       IOCTRL31,
> +       IOCTRL32,
> +       IOCTRL40,

Note for the future: unlike all other current pocctrl handling, IOCTRL32
is used to select between 2.5V and 3.3V (instead of 1.8V and 3.3V).
Handling that will require changes to the r8a77980_pin_to_pocctrl()
interface (add two output parameters returning supported voltages?).

> +       IOCTRL40,

That's TDSEL, and thus not related to I/O voltage.
But I agree it should be saved during suspend/resume. ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
