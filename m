Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:48216 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967921AbeBOMi3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 07:38:29 -0500
Subject: Re: [PATCH 4/4] pinctrl: sh-pfc: r8a77995: Add DU pins, groups and
 function
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: laurent.pinchart@ideasonboard.com
References: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1518696091-23561-5-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <d1ccc505-8ca2-f396-77f8-eed3f9fbd3ee@ideasonboard.com>
Date: Thu, 15 Feb 2018 12:38:24 +0000
MIME-Version: 1.0
In-Reply-To: <1518696091-23561-5-git-send-email-ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

Thankyou for your patch,

On 15/02/18 12:01, Ulrich Hecht wrote:
> This patch adds DU pins, groups and function for the R8A77995 (D3) SoC.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

All of your pin values check out.
(And it highlights that I may have left a copy/paste/fail-to-update on the
du_disp in my version)

Generic question below regarding DOTCLK naming, but it's not a blocker to this
patch, so:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 101 ++++++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> index f11edf1..27b9417 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> @@ -1114,6 +1114,87 @@ static const unsigned int canfd1_data_mux[] = {
>  	CANFD1_TX_MARK, CANFD1_RX_MARK,
>  };
>  
> +/* - DU --------------------------------------------------------------------- */
> +static const unsigned int du_rgb666_pins[] = {
> +	/* R[7:2], G[7:2], B[7:2] */
> +	RCAR_GP_PIN(1, 23), RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 21),
> +	RCAR_GP_PIN(1, 20), RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 18),
> +	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
> +	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 11), RCAR_GP_PIN(1, 10),
> +	RCAR_GP_PIN(1, 7),  RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 2),
> +};
> +static const unsigned int du_rgb666_mux[] = {
> +	DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK, DU_DR4_MARK,
> +	DU_DR3_MARK, DU_DR2_MARK,
> +	DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK, DU_DG4_MARK,
> +	DU_DG3_MARK, DU_DG2_MARK,
> +	DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK, DU_DB4_MARK,
> +	DU_DB3_MARK, DU_DB2_MARK,
> +};
> +static const unsigned int du_rgb888_pins[] = {
> +	/* R[7:0], G[7:0], B[7:0] */
> +	RCAR_GP_PIN(1, 23), RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 21),
> +	RCAR_GP_PIN(1, 20), RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 18),
> +	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 16),
> +	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
> +	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 11), RCAR_GP_PIN(1, 10),
> +	RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 8),
> +	RCAR_GP_PIN(1, 7),  RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 2),
> +	RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 0),
> +};
> +static const unsigned int du_rgb888_mux[] = {
> +	DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK, DU_DR4_MARK,
> +	DU_DR3_MARK, DU_DR2_MARK, DU_DR1_MARK, DU_DR0_MARK,
> +	DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK, DU_DG4_MARK,
> +	DU_DG3_MARK, DU_DG2_MARK, DU_DG1_MARK, DU_DG0_MARK,
> +	DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK, DU_DB4_MARK,
> +	DU_DB3_MARK, DU_DB2_MARK, DU_DB1_MARK, DU_DB0_MARK,
> +};
> +static const unsigned int du_clk_in_1_pins[] = {
> +	/* CLKIN */
> +	RCAR_GP_PIN(1, 28),
> +};
> +static const unsigned int du_clk_in_1_mux[] = {
> +	DU_DOTCLKIN1_MARK
> +};
> +static const unsigned int du_clk_out_0_pins[] = {
> +	/* CLKOUT */
> +	RCAR_GP_PIN(1, 24),
> +};
> +static const unsigned int du_clk_out_0_mux[] = {
> +	DU_DOTCLKOUT0_MARK
> +};

Why do the DOTCLKOUT and DOTCLKIN pins get named clk_out_ and clk_in_ ?

All of the other pins seem to entirely follow the pin name as per the datasheet,
except for these.

(This is a general comment across all du_clk_{in,out} instantiations - and not a
comment against this patch)


> +static const unsigned int du_sync_pins[] = {
> +	/* VSYNC, HSYNC */
> +	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
> +};
> +static const unsigned int du_sync_mux[] = {
> +	DU_VSYNC_MARK, DU_HSYNC_MARK
> +};
> +static const unsigned int du_disp_cde_pins[] = {
> +	/* DISP_CDE */
> +	RCAR_GP_PIN(1, 28),
> +};
> +static const unsigned int du_disp_cde_mux[] = {
> +	DU_DISP_CDE_MARK,
> +};
> +static const unsigned int du_cde_pins[] = {
> +	/* CDE */
> +	RCAR_GP_PIN(1, 29),
> +};
> +static const unsigned int du_cde_mux[] = {
> +	DU_CDE_MARK,
> +};
> +static const unsigned int du_disp_pins[] = {
> +	/* DISP */
> +	RCAR_GP_PIN(1, 27),
> +};
> +static const unsigned int du_disp_mux[] = {
> +	DU_DISP_MARK,
> +};
> +
>  /* - I2C -------------------------------------------------------------------- */
>  static const unsigned int i2c0_pins[] = {
>  	/* SCL, SDA */
> @@ -1734,6 +1815,14 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>  	SH_PFC_PIN_GROUP(can_clk),
>  	SH_PFC_PIN_GROUP(canfd0_data),
>  	SH_PFC_PIN_GROUP(canfd1_data),
> +	SH_PFC_PIN_GROUP(du_rgb666),
> +	SH_PFC_PIN_GROUP(du_rgb888),
> +	SH_PFC_PIN_GROUP(du_clk_in_1),
> +	SH_PFC_PIN_GROUP(du_clk_out_0),
> +	SH_PFC_PIN_GROUP(du_sync),
> +	SH_PFC_PIN_GROUP(du_disp_cde),
> +	SH_PFC_PIN_GROUP(du_cde),
> +	SH_PFC_PIN_GROUP(du_disp),
>  	SH_PFC_PIN_GROUP(i2c0),
>  	SH_PFC_PIN_GROUP(i2c1),
>  	SH_PFC_PIN_GROUP(i2c2_a),
> @@ -1841,6 +1930,17 @@ static const char * const canfd1_groups[] = {
>  	"canfd1_data",
>  };
>  
> +static const char * const du_groups[] = {
> +	"du_rgb666",
> +	"du_rgb888",
> +	"du_clk_in_1",
> +	"du_clk_out_0",
> +	"du_sync",
> +	"du_disp_cde",
> +	"du_cde",
> +	"du_disp",
> +};
> +
>  static const char * const i2c0_groups[] = {
>  	"i2c0",
>  };
> @@ -1970,6 +2070,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
>  	SH_PFC_FUNCTION(can_clk),
>  	SH_PFC_FUNCTION(canfd0),
>  	SH_PFC_FUNCTION(canfd1),
> +	SH_PFC_FUNCTION(du),
>  	SH_PFC_FUNCTION(i2c0),
>  	SH_PFC_FUNCTION(i2c1),
>  	SH_PFC_FUNCTION(i2c2),
> 

Regards
--

Kieran
