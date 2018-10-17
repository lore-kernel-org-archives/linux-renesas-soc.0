Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43999 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbeJQQim (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 12:38:42 -0400
Date: Wed, 17 Oct 2018 10:43:58 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v4 2/6] pinctrl: sh-pfc: r8a77470: Add SDHI support
Message-ID: <20181017084358.zq5lnxvcba2kftkv@verge.net.au>
References: <1539686023-7487-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539686023-7487-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 16, 2018 at 11:33:43AM +0100, Fabrizio Castro wrote:
> Add SH_PFC_PIN_CFG_IO_VOLTAGE definition for the SDHI pins
> capable of switching voltage, also add pin groups and functions
> for SDHI0 and SDHI1. Please note that with the RZ/G1C only 1
> bit of the POC Control Register is used to control each interface.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> v3->v4:
> * Fixed voltage control of GP0_11 and GP0_12
> 
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
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77470.c | 162 +++++++++++++++++++++++++++++++++-
>  1 file changed, 160 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> index 5e29b95..4359aeb 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> @@ -10,14 +10,45 @@
>  #include "sh_pfc.h"
>  
>  #define CPU_ALL_PORT(fn, sfx)						\
> -	PORT_GP_23(0, fn, sfx),						\
> +	PORT_GP_4(0, fn, sfx),						\
> +	PORT_GP_1(0, 4, fn, sfx),					\
> +	PORT_GP_CFG_1(0,  5, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0,  6, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0,  7, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0,  8, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0,  9, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0, 10, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_1(0, 11, fn, sfx),					\
> +	PORT_GP_1(0, 12, fn, sfx),					\
> +	PORT_GP_CFG_1(0, 13, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0, 20, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0, 21, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(0, 22, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
>  	PORT_GP_23(1, fn, sfx),						\
>  	PORT_GP_32(2, fn, sfx),						\
>  	PORT_GP_17(3, fn, sfx),						\
>  	PORT_GP_1(3, 27, fn, sfx),					\
>  	PORT_GP_1(3, 28, fn, sfx),					\
>  	PORT_GP_1(3, 29, fn, sfx),					\
> -	PORT_GP_26(4, fn, sfx),						\
> +	PORT_GP_14(4, fn, sfx),						\
> +	PORT_GP_CFG_1(4, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(4, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(4, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(4, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(4, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_CFG_1(4, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
> +	PORT_GP_1(4, 20, fn, sfx),					\
> +	PORT_GP_1(4, 21, fn, sfx),					\
> +	PORT_GP_1(4, 22, fn, sfx),					\
> +	PORT_GP_1(4, 23, fn, sfx),					\
> +	PORT_GP_1(4, 24, fn, sfx),					\
> +	PORT_GP_1(4, 25, fn, sfx),					\
>  	PORT_GP_32(5, fn, sfx)
>  
>  enum {
> @@ -1865,6 +1896,81 @@ static const unsigned int scif_clk_b_pins[] = {
>  static const unsigned int scif_clk_b_mux[] = {
>  	SCIF_CLK_B_MARK,
>  };
> +/* - SDHI0 ------------------------------------------------------------------ */
> +static const unsigned int sdhi0_data1_pins[] = {
> +	/* D0 */
> +	RCAR_GP_PIN(0, 7),
> +};
> +static const unsigned int sdhi0_data1_mux[] = {
> +	SD0_DAT0_MARK,
> +};
> +static const unsigned int sdhi0_data4_pins[] = {
> +	/* D[0:3] */
> +	RCAR_GP_PIN(0, 7), RCAR_GP_PIN(0, 8),
> +	RCAR_GP_PIN(0, 9), RCAR_GP_PIN(0, 10),
> +};
> +static const unsigned int sdhi0_data4_mux[] = {
> +	SD0_DAT0_MARK, SD0_DAT1_MARK, SD0_DAT2_MARK, SD0_DAT3_MARK,
> +};
> +static const unsigned int sdhi0_ctrl_pins[] = {
> +	/* CLK, CMD */
> +	RCAR_GP_PIN(0, 5), RCAR_GP_PIN(0, 6),
> +};
> +static const unsigned int sdhi0_ctrl_mux[] = {
> +	SD0_CLK_MARK, SD0_CMD_MARK,
> +};
> +static const unsigned int sdhi0_cd_pins[] = {
> +	/* CD */
> +	RCAR_GP_PIN(0, 11),
> +};
> +static const unsigned int sdhi0_cd_mux[] = {
> +	SD0_CD_MARK,
> +};
> +static const unsigned int sdhi0_wp_pins[] = {
> +	/* WP */
> +	RCAR_GP_PIN(0, 12),
> +};
> +static const unsigned int sdhi0_wp_mux[] = {
> +	SD0_WP_MARK,
> +};
> +/* - SDHI1 ------------------------------------------------------------------ */
> +static const unsigned int sdhi1_data1_pins[] = {
> +	/* D0 */
> +	RCAR_GP_PIN(0, 15),
> +};
> +static const unsigned int sdhi1_data1_mux[] = {
> +	MMC0_D0_SDHI1_D0_MARK,
> +};
> +static const unsigned int sdhi1_data4_pins[] = {
> +	/* D[0:3] */
> +	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 16),
> +	RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 18),
> +};
> +static const unsigned int sdhi1_data4_mux[] = {
> +	MMC0_D0_SDHI1_D0_MARK, MMC0_D1_SDHI1_D1_MARK,
> +	MMC0_D2_SDHI1_D2_MARK, MMC0_D3_SDHI1_D3_MARK,
> +};
> +static const unsigned int sdhi1_ctrl_pins[] = {
> +	/* CLK, CMD */
> +	RCAR_GP_PIN(0, 13), RCAR_GP_PIN(0, 14),
> +};
> +static const unsigned int sdhi1_ctrl_mux[] = {
> +	MMC0_CLK_SDHI1_CLK_MARK, MMC0_CMD_SDHI1_CMD_MARK,
> +};
> +static const unsigned int sdhi1_cd_pins[] = {
> +	/* CD */
> +	RCAR_GP_PIN(0, 19),
> +};
> +static const unsigned int sdhi1_cd_mux[] = {
> +	SD1_CD_MARK,
> +};
> +static const unsigned int sdhi1_wp_pins[] = {
> +	/* WP */
> +	RCAR_GP_PIN(0, 20),
> +};
> +static const unsigned int sdhi1_wp_mux[] = {
> +	SD1_WP_MARK,
> +};
>  /* - SDHI2 ------------------------------------------------------------------ */
>  static const unsigned int sdhi2_data1_pins[] = {
>  	/* D0 */
> @@ -2160,6 +2266,16 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>  	SH_PFC_PIN_GROUP(scif5_data_f),
>  	SH_PFC_PIN_GROUP(scif_clk_a),
>  	SH_PFC_PIN_GROUP(scif_clk_b),
> +	SH_PFC_PIN_GROUP(sdhi0_data1),
> +	SH_PFC_PIN_GROUP(sdhi0_data4),
> +	SH_PFC_PIN_GROUP(sdhi0_ctrl),
> +	SH_PFC_PIN_GROUP(sdhi0_cd),
> +	SH_PFC_PIN_GROUP(sdhi0_wp),
> +	SH_PFC_PIN_GROUP(sdhi1_data1),
> +	SH_PFC_PIN_GROUP(sdhi1_data4),
> +	SH_PFC_PIN_GROUP(sdhi1_ctrl),
> +	SH_PFC_PIN_GROUP(sdhi1_cd),
> +	SH_PFC_PIN_GROUP(sdhi1_wp),
>  	SH_PFC_PIN_GROUP(sdhi2_data1),
>  	SH_PFC_PIN_GROUP(sdhi2_data4),
>  	SH_PFC_PIN_GROUP(sdhi2_ctrl),
> @@ -2339,6 +2455,22 @@ static const char * const scif_clk_groups[] = {
>  	"scif_clk_b",
>  };
>  
> +static const char * const sdhi0_groups[] = {
> +	"sdhi0_data1",
> +	"sdhi0_data4",
> +	"sdhi0_ctrl",
> +	"sdhi0_cd",
> +	"sdhi0_wp",
> +};
> +
> +static const char * const sdhi1_groups[] = {
> +	"sdhi1_data1",
> +	"sdhi1_data4",
> +	"sdhi1_ctrl",
> +	"sdhi1_cd",
> +	"sdhi1_wp",
> +};
> +
>  static const char * const sdhi2_groups[] = {
>  	"sdhi2_data1",
>  	"sdhi2_data4",
> @@ -2398,6 +2530,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
>  	SH_PFC_FUNCTION(scif4),
>  	SH_PFC_FUNCTION(scif5),
>  	SH_PFC_FUNCTION(scif_clk),
> +	SH_PFC_FUNCTION(sdhi0),
> +	SH_PFC_FUNCTION(sdhi1),
>  	SH_PFC_FUNCTION(sdhi2),
>  	SH_PFC_FUNCTION(usb0),
>  	SH_PFC_FUNCTION(usb1),
> @@ -3245,9 +3379,33 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
>  	{ },
>  };
>  
> +static int r8a77470_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
> +				   u32 *pocctrl)
> +{
> +	int bit = -EINVAL;
> +
> +	*pocctrl = 0xe60600b0;
> +
> +	if (pin >= RCAR_GP_PIN(0, 5) && pin <= RCAR_GP_PIN(0, 10))
> +		bit = 0;

Is it intentional that the range above excludes GP0_11 and 12?

> +
> +	if (pin >= RCAR_GP_PIN(0, 13) && pin <= RCAR_GP_PIN(0, 22))
> +		bit = 2;
> +
> +	if (pin >= RCAR_GP_PIN(4, 14) && pin <= RCAR_GP_PIN(4, 19))

And likewise GP4_20 and 21 here.

> +		bit = 1;
> +
> +	return bit;
> +}
> +
> +static const struct sh_pfc_soc_operations r8a77470_pinmux_ops = {
> +	.pin_to_pocctrl = r8a77470_pin_to_pocctrl,
> +};
> +
>  #ifdef CONFIG_PINCTRL_PFC_R8A77470
>  const struct sh_pfc_soc_info r8a77470_pinmux_info = {
>  	.name = "r8a77470_pfc",
> +	.ops = &r8a77470_pinmux_ops,
>  	.unlock_reg = 0xe6060000, /* PMMR */
>  
>  	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
> -- 
> 2.7.4
> 
