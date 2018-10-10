Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:47014 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbeJJO5U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Oct 2018 10:57:20 -0400
MIME-Version: 1.0
References: <1538988712-17077-1-git-send-email-fabrizio.castro@bp.renesas.com> <1538988712-17077-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1538988712-17077-3-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Oct 2018 09:36:14 +0200
Message-ID: <CAMuHMdWVxs4jByfSr_BYo5ByB9xDs6EiSz9gX55O_94H-vd1cg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] pinctrl: sh-pfc: r8a77470: Add SDHI support
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Mon, Oct 8, 2018 at 10:52 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add SH_PFC_PIN_CFG_IO_VOLTAGE definition for the SDHI pins
> capable of switching voltage, also add pin groups and functions
> for SDHI0 and SDHI1. Please note that with the RZ/G1C only 1
> bit of the POC Control Register is used to control each interface.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
>
> ---
> v2->v3:
> * No change
>
> v1->v2:
> * Reworked implementation of r8a77470_pin_to_pocctrl as per Wolfram's
>   and Geert's comments
> * Added SDHI0 and SDHI1 pins and IO voltage control
> * Added SDHI0 and SDHI1 pin groups and functions
> * Reworked changelog and title
> * Please note that there is some overlapping between mmc pin groups
>   and sdhi1 pin groups

Thanks for the update!

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77470.c | 162 +++++++++++++++++++++++++++++++++-
>  1 file changed, 160 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> index 3d36e5f..fa0d42b 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> @@ -10,14 +10,45 @@
>  #include "sh_pfc.h"
>
>  #define CPU_ALL_PORT(fn, sfx)                                          \
> -       PORT_GP_23(0, fn, sfx),                                         \
> +       PORT_GP_4(0, fn, sfx),                                          \
> +       PORT_GP_1(0, 4, fn, sfx),                                       \
> +       PORT_GP_CFG_1(0,  5, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0,  6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0,  7, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0,  8, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0,  9, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0, 10, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0, 11, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0, 12, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \

GP0_11 and GP0_12 do not have I/O voltage controls.
Hence they're also not handled by r8a77470_pin_to_pocctrl() below.

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> +       PORT_GP_CFG_1(0, 13, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0, 20, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0, 21, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(0, 22, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
>         PORT_GP_23(1, fn, sfx),                                         \
>         PORT_GP_32(2, fn, sfx),                                         \
>         PORT_GP_17(3, fn, sfx),                                         \
>         PORT_GP_1(3, 27, fn, sfx),                                      \
>         PORT_GP_1(3, 28, fn, sfx),                                      \
>         PORT_GP_1(3, 29, fn, sfx),                                      \
> -       PORT_GP_26(4, fn, sfx),                                         \
> +       PORT_GP_14(4, fn, sfx),                                         \
> +       PORT_GP_CFG_1(4, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(4, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(4, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(4, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(4, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_CFG_1(4, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),       \
> +       PORT_GP_1(4, 20, fn, sfx),                                      \
> +       PORT_GP_1(4, 21, fn, sfx),                                      \
> +       PORT_GP_1(4, 22, fn, sfx),                                      \
> +       PORT_GP_1(4, 23, fn, sfx),                                      \
> +       PORT_GP_1(4, 24, fn, sfx),                                      \
> +       PORT_GP_1(4, 25, fn, sfx),                                      \
>         PORT_GP_32(5, fn, sfx)
>
>  enum {

> @@ -2729,9 +2863,33 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
>         { },
>  };
>
> +static int r8a77470_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
> +                                  u32 *pocctrl)
> +{
> +       int bit = -EINVAL;
> +
> +       *pocctrl = 0xe60600b0;
> +
> +       if (pin >= RCAR_GP_PIN(0, 5) && pin <= RCAR_GP_PIN(0, 10))
> +               bit = 0;
> +
> +       if (pin >= RCAR_GP_PIN(0, 13) && pin <= RCAR_GP_PIN(0, 22))
> +               bit = 2;
> +
> +       if (pin >= RCAR_GP_PIN(4, 14) && pin <= RCAR_GP_PIN(4, 19))
> +               bit = 1;
> +
> +       return bit;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
