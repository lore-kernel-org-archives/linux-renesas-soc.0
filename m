Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f178.google.com ([209.85.217.178]:42116 "EHLO
        mail-ua0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753651AbeDPJ2A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Apr 2018 05:28:00 -0400
MIME-Version: 1.0
In-Reply-To: <1522855377-48527-2-git-send-email-biju.das@bp.renesas.com>
References: <1522855377-48527-1-git-send-email-biju.das@bp.renesas.com> <1522855377-48527-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Apr 2018 11:27:58 +0200
Message-ID: <CAMuHMdX9YC+QT_dbKSqtQUHJkoA=3=gmgPYNFdXBOrsTT9rCRw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: sh-pfc: Add r8a77470 PFC support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Wed, Apr 4, 2018 at 5:22 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Add PFC support for the R8A77470 SoC including pin groups for
> some on-chip devices such as SCIF, AVB and MMC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> @@ -0,0 +1,2156 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * R8A77470 processor support - PFC hardware block.
> + *
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + */
> +
> +#include <linux/kernel.h>
> +
> +#include "sh_pfc.h"
> +
> +#define CPU_ALL_PORT(fn, sfx)                                          \
> +       PORT_GP_23(0, fn, sfx),                                         \
> +       PORT_GP_23(1, fn, sfx),                                         \
> +       PORT_GP_32(2, fn, sfx),                                         \
> +       PORT_GP_17(3, fn, sfx),                                         \
> +       PORT_GP_1(3, 27, fn, sfx),                                      \
> +       PORT_GP_1(3, 28, fn, sfx),                                      \
> +       PORT_GP_1(3, 29, fn, sfx),                                      \

(Oh, they have a hole in the GPIO range...)

> +       PORT_GP_26(4, fn, sfx),                                         \
> +       PORT_GP_32(5, fn, sfx)

> +/* - AVB -------------------------------------------------------------------- */
> +static const unsigned int avb_link_pins[] = {
> +       RCAR_GP_PIN(5, 14),
> +};
> +static const unsigned int avb_link_mux[] = {
> +       AVB_LINK_MARK,
> +};
> +static const unsigned int avb_magic_pins[] = {
> +       RCAR_GP_PIN(5, 15),
> +};
> +static const unsigned int avb_magic_mux[] = {
> +       AVB_MAGIC_MARK,
> +};
> +static const unsigned int avb_phy_int_pins[] = {
> +       RCAR_GP_PIN(5, 16),
> +};
> +static const unsigned int avb_phy_int_mux[] = {
> +       AVB_PHY_INT_MARK,
> +};
> +static const unsigned int avb_mdio_pins[] = {
> +       RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 13),
> +};
> +static const unsigned int avb_mdio_mux[] = {
> +       AVB_MDC_MARK, AVB_MDIO_MARK,
> +};
> +static const unsigned int avb_mii_pins[] = {
> +       RCAR_GP_PIN(3, 14), RCAR_GP_PIN(3, 15), RCAR_GP_PIN(3, 16),
> +       RCAR_GP_PIN(3, 27),
> +
> +       RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 4),
> +       RCAR_GP_PIN(3, 5),
> +
> +       RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
> +       RCAR_GP_PIN(5, 17), RCAR_GP_PIN(3, 13), RCAR_GP_PIN(5, 23),
> +       RCAR_GP_PIN(3, 12),
> +};
> +static const unsigned int avb_mii_mux[] = {
> +       AVB_TXD0_MARK, AVB_TXD1_MARK, AVB_TXD2_MARK,
> +       AVB_TXD3_MARK,
> +
> +       AVB_RXD0_MARK, AVB_RXD1_MARK, AVB_RXD2_MARK,
> +       AVB_RXD3_MARK,
> +
> +       AVB_RX_ER_MARK, AVB_RX_CLK_MARK, AVB_RX_DV_MARK,
> +       AVB_CRS_MARK, AVB_TX_EN_MARK, AVB_TX_ER_MARK,
> +       AVB_TX_CLK_MARK,

You forgot AVB_COL, which is GP5_18?

> +};
> +static const unsigned int avb_gmii_pins[] = {
> +       RCAR_GP_PIN(3, 14), RCAR_GP_PIN(3, 15), RCAR_GP_PIN(3, 16),
> +       RCAR_GP_PIN(3, 27), RCAR_GP_PIN(3, 28), RCAR_GP_PIN(3, 29),
> +       RCAR_GP_PIN(4, 0), RCAR_GP_PIN(5, 22),
> +
> +       RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 4),
> +       RCAR_GP_PIN(3, 5), RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
> +       RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
> +
> +       RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
> +       RCAR_GP_PIN(5, 17), RCAR_GP_PIN(4, 1), RCAR_GP_PIN(3, 11),
> +       RCAR_GP_PIN(3, 13), RCAR_GP_PIN(5, 23), RCAR_GP_PIN(3, 12),
> +};
> +static const unsigned int avb_gmii_mux[] = {
> +       AVB_TXD0_MARK, AVB_TXD1_MARK, AVB_TXD2_MARK,
> +       AVB_TXD3_MARK, AVB_TXD4_MARK, AVB_TXD5_MARK,
> +       AVB_TXD6_MARK, AVB_TXD7_MARK,
> +
> +       AVB_RXD0_MARK, AVB_RXD1_MARK, AVB_RXD2_MARK,
> +       AVB_RXD3_MARK, AVB_RXD4_MARK, AVB_RXD5_MARK,
> +       AVB_RXD6_MARK, AVB_RXD7_MARK,
> +
> +       AVB_RX_ER_MARK, AVB_RX_CLK_MARK, AVB_RX_DV_MARK,
> +       AVB_CRS_MARK, AVB_GTX_CLK_MARK, AVB_GTXREFCLK_MARK,
> +       AVB_TX_EN_MARK, AVB_TX_ER_MARK, AVB_TX_CLK_MARK,

You forgot AVB_COL, which is GP5_18?

> +};

Any specific reason you haven't added the avb_avtp_capture and
avb_avtp_match pins?

> +/* - SCIF1 ------------------------------------------------------------------ */
> +static const unsigned int scif1_data_b_pins[] = {
> +       /* RX, TX */
> +       RCAR_GP_PIN(5, 19), RCAR_GP_PIN(5, 20),
> +};
> +static const unsigned int scif1_data_b_mux[] = {
> +       RX1_B_MARK, TX1_B_MARK,
> +};
> +/* - SCIF2 ------------------------------------------------------------------ */
> +static const unsigned int scif2_data_b_pins[] = {
> +       /* RX, TX */
> +       RCAR_GP_PIN(5, 25), RCAR_GP_PIN(5, 26),
> +};
> +static const unsigned int scif2_data_b_mux[] = {
> +       RX2_B_MARK, TX2_B_MARK,
> +};
> +/* - SCIF4 ------------------------------------------------------------------ */
> +static const unsigned int scif4_data_b_pins[] = {
> +       /* RX, TX */
> +       RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
> +};
> +static const unsigned int scif4_data_b_mux[] = {
> +       RX4_B_MARK, TX4_B_MARK,
> +};
> +/* - SCIF5 ------------------------------------------------------------------ */
> +static const unsigned int scif5_data_b_pins[] = {
> +       /* RX, TX */
> +       RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
> +};
> +static const unsigned int scif5_data_b_mux[] = {
> +       RX5_B_MARK, TX5_B_MARK,
> +};

Please add all SCIF pin groups, not just a random subset.

> +       { PINMUX_CFG_REG_VAR("MOD_SEL", 0xE60600C0, 32,

"MOD_SEL0"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
