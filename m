Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42116 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbeHHOwP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Aug 2018 10:52:15 -0400
Received: by mail-lf1-f67.google.com with SMTP id u202-v6so1435103lff.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Aug 2018 05:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <TYAPR01MB20648212DBBF5ECA75BD3FBCDA260@TYAPR01MB2064.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB20648212DBBF5ECA75BD3FBCDA260@TYAPR01MB2064.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Aug 2018 14:32:29 +0200
Message-ID: <CAMuHMdWxYfrdMVCYT3UmnRDLSmDn7RnCnJjLxhc9EDa5NErK5g@mail.gmail.com>
Subject: Re: Fix RCAR-V3H SoC wrong IPSR9/10 registers
To: adnan.ali@bp.renesas.com
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        dmitry.shifrin@cogentembedded.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Adnan,

On Wed, Aug 8, 2018 at 1:39 PM Adnan Ali <adnan.ali@bp.renesas.com> wrote:
> Please review this patch.

Thanks for your patch!

But please don't send patches as attachments. It makes review more difficult.

> From 468b28ae35eb0b64db13e3d7d013abaf3734ae32 Mon Sep 17 00:00:00 2001
> From: Adnan Ali <adnan.ali@bp.renesas.com>
> Date: Wed, 8 Aug 2018 13:14:47 +0200
> Subject: [PATCH] sh-pfc/pfc-r8a7798.c Fix RCAR-V3H condor wrong IPSR9/10 reg
>  settings
>
> Signed-off-by: Adnan Ali <adnan.ali@bp.renesas.com>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7798.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7798.c b/drivers/pinctrl/sh-pfc/pfc-r8a7798.c
> index f6f159e..48584e0 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7798.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7798.c

This file is called drivers/pinctrl/sh-pfc/pfc-r8a77980.c in upstream Linux.

> @@ -3122,24 +3122,24 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
>               IP8_3_0 }
>       },
>       { PINMUX_CFG_REG("IPSR9", 0xe6060224, 32, 4) {
> -             IP8_31_28
> -             IP8_27_24
> -             IP8_23_20
> -             IP8_19_16
> -             IP8_15_12
> -             IP8_11_8
> -             IP8_7_4
> -             IP8_3_0 }
> +             IP9_31_28
> +             IP9_27_24
> +             IP9_23_20
> +             IP9_19_16
> +             IP9_15_12
> +             IP9_11_8
> +             IP9_7_4
> +             IP9_3_0 }

This bug is not present in the upstream version:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/sh-pfc/pfc-r8a77980.c#n2728

>       },
>       { PINMUX_CFG_REG("IPSR10", 0xe6060228, 32, 4) {
> -             IP8_31_28
> -             IP8_27_24
> -             IP8_23_20
> -             IP8_19_16
> -             IP8_15_12
> -             IP8_11_8
> -             IP8_7_4
> -             IP8_3_0 }
> +             IP9_31_28
> +             IP9_27_24
> +             IP9_23_20
> +             IP9_19_16
> +             IP9_15_12
> +             IP9_11_8
> +             IP9_7_4
> +             IP9_3_0 }

Should't that be IP10_...?

Also not present in the upstream version.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
