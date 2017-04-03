Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36595 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751509AbdDCHVg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 03:21:36 -0400
MIME-Version: 1.0
In-Reply-To: <20170331202941.678985389@cogentembedded.com>
References: <20170331202941.678985389@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Apr 2017 09:21:34 +0200
Message-ID: <CAMuHMdUbYBd4OobPguB599O8Chsghv01uOTJ=6uKkM2MpGJh4w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7791: fix IPSR comment typos
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergii,

On Fri, Mar 31, 2017 at 10:29 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The IPSR field names in the comments have been fat-fingered in a couple
> places --  fix those silly typos...

Thanks!

> Fixes: 508845196238 ("pinctrl: sh-pfc: r8a7791 PFC support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> This patch is against the 'fixes' branch of Linus Walleij's 'linux-pinctrl.git'
> repo plus  3 R8A7791 fixes posted in the last couple days...
>
>  drivers/pinctrl/sh-pfc/pfc-r8a7791.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> ===================================================================
> --- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> +++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> @@ -5711,7 +5711,7 @@ static const struct pinmux_cfg_reg pinmu
>         },
>         { PINMUX_CFG_REG_VAR("IPSR2", 0xE6060028, 32,
>                              2, 3, 2, 2, 2, 2, 3, 3, 3, 3, 2, 2, 3) {
> -               /* IP2_31_20 [2] */
> +               /* IP2_31_30 [2] */
>                 0, 0, 0, 0,
>                 /* IP2_29_27 [3] */
>                 FN_EX_CS3_N, FN_ATADIR0_N, FN_MSIOF2_TXD,

There's another one a few lines below:

-                  /* IP2_12_0 [3] */
+                 /* IP2_12_10 [3] */

I'll fix that up when applying...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
