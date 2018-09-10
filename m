Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:32894 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727269AbeIJRzU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 13:55:20 -0400
Date: Mon, 10 Sep 2018 15:01:15 +0200
From: Simon Horman <horms@verge.net.au>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/8] pinctrl: sh-pfc: r8a77990: Add VIN pins, groups
 and functions
Message-ID: <20180910130115.z6qwfzrimg3ceyup@verge.net.au>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-6-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536161385-25562-6-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 05, 2018 at 05:29:42PM +0200, Jacopo Mondi wrote:
> This patch adds VIN{4,5} pins, groups and functions to the R8A77990 SoC.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 250 ++++++++++++++++++++++++++++++++++
>  1 file changed, 250 insertions(+)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> index b81c807..0797940 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> @@ -1831,6 +1831,194 @@ static const unsigned int usb30_id_mux[] = {
>  	USB3HS0_ID_MARK,
>  };
>  
> +/* - VIN4 ------------------------------------------------------------------- */
> +static const union vin_data vin4_data_a_pins = {
> +	.data24 = {
> +		RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
> +		RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
> +		RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
> +		RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
> +		RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +		RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +		RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
> +		RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
> +		RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12),
> +		RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
> +		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
> +		RCAR_GP_PIN(1, 19), RCAR_GP_PIN(0, 1),
> +	},
> +};
> +
> +static const union vin_data vin4_data_a_mux = {
> +	.data24 = {
> +		VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
> +		VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
> +		VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
> +		VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
> +		VI4_DATA8_MARK,   VI4_DATA9_MARK,
> +		VI4_DATA10_MARK,  VI4_DATA11_MARK,
> +		VI4_DATA12_MARK,  VI4_DATA13_MARK,
> +		VI4_DATA14_MARK,  VI4_DATA15_MARK,
> +		VI4_DATA16_MARK,  VI4_DATA17_MARK,
> +		VI4_DATA18_MARK,  VI4_DATA19_MARK,
> +		VI4_DATA20_MARK,  VI4_DATA21_MARK,
> +		VI4_DATA22_MARK,  VI4_DATA23_MARK,
> +	},
> +};
> +
> +static const union vin_data vin4_data_b_pins = {
> +	.data24 = {
> +		RCAR_GP_PIN(1, 8),  RCAR_GP_PIN(1, 11),
> +		RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
> +		RCAR_GP_PIN(0, 5),  RCAR_GP_PIN(0, 6),
> +		RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),

I am curious to know why the data B pins below (8 - 23)
are duplicates of the corresponding data A pins in vin4_data_a_pins.

> +		RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +		RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +		RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
> +		RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
> +		RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12),
> +		RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 15),
> +		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
> +		RCAR_GP_PIN(1, 19), RCAR_GP_PIN(0, 1),
> +	},
> +};
> +
> +static const union vin_data vin4_data_b_mux = {
> +	.data24 = {
> +		VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
> +		VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
> +		VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
> +		VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
> +		VI4_DATA8_MARK,   VI4_DATA9_MARK,
> +		VI4_DATA10_MARK,  VI4_DATA11_MARK,
> +		VI4_DATA12_MARK,  VI4_DATA13_MARK,
> +		VI4_DATA14_MARK,  VI4_DATA15_MARK,
> +		VI4_DATA16_MARK,  VI4_DATA17_MARK,
> +		VI4_DATA18_MARK,  VI4_DATA19_MARK,
> +		VI4_DATA20_MARK,  VI4_DATA21_MARK,
> +		VI4_DATA22_MARK,  VI4_DATA23_MARK,
> +	},
> +};
> +
> +static const unsigned int vin4_sync_pins[] = {
> +	/* HSYNC, VSYNC */
> +	RCAR_GP_PIN(2, 25), RCAR_GP_PIN(2, 24),
> +};
> +
> +static const unsigned int vin4_sync_mux[] = {
> +	VI4_HSYNC_N_MARK, VI4_VSYNC_N_MARK,
> +};
> +
> +static const unsigned int vin4_field_pins[] = {
> +	RCAR_GP_PIN(2, 23),
> +};
> +
> +static const unsigned int vin4_field_mux[] = {
> +	VI4_FIELD_MARK,
> +};
> +
> +static const unsigned int vin4_clkenb_pins[] = {
> +	RCAR_GP_PIN(1, 2),
> +};
> +
> +static const unsigned int vin4_clkenb_mux[] = {
> +	VI4_CLKENB_MARK,
> +};
> +
> +static const unsigned int vin4_clk_pins[] = {
> +	RCAR_GP_PIN(2, 22),
> +};
> +
> +static const unsigned int vin4_clk_mux[] = {
> +	VI4_CLK_MARK,
> +};
> +
> +/* - VIN5 ------------------------------------------------------------------- */
> +static const union vin_data vin5_data_a_pins = {
> +	.data16 = {
> +		RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 2),
> +		RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 12),
> +		RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
> +		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
> +		RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
> +		RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 11),
> +		RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 10),
> +		RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
> +	},
> +};
> +
> +static const union vin_data vin5_data_a_mux = {
> +	.data16 = {
> +		VI5_DATA0_A_MARK,  VI5_DATA1_A_MARK,
> +		VI5_DATA2_A_MARK,  VI5_DATA3_A_MARK,
> +		VI5_DATA4_A_MARK,  VI5_DATA5_A_MARK,
> +		VI5_DATA6_A_MARK,  VI5_DATA7_A_MARK,
> +		VI5_DATA8_A_MARK,  VI5_DATA9_A_MARK,
> +		VI5_DATA10_A_MARK, VI5_DATA11_A_MARK,
> +		VI5_DATA12_A_MARK, VI5_DATA13_A_MARK,
> +		VI5_DATA14_A_MARK, VI5_DATA15_A_MARK,
> +	},
> +};
> +
> +static const union vin_data vin5_data_b_pins = {
> +	.data8 = {
> +		RCAR_GP_PIN(2, 23), RCAR_GP_PIN(0, 4),
> +		RCAR_GP_PIN(0, 7),  RCAR_GP_PIN(0, 12),
> +		RCAR_GP_PIN(0, 13), RCAR_GP_PIN(0, 14),
> +		RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
> +	},
> +};
> +
> +static const union vin_data vin5_data_b_mux = {
> +	.data8 = {
> +		VI5_DATA0_B_MARK,  VI5_DATA1_B_MARK,
> +		VI5_DATA2_B_MARK,  VI5_DATA3_B_MARK,
> +		VI5_DATA4_B_MARK,  VI5_DATA5_B_MARK,
> +		VI5_DATA6_B_MARK,  VI5_DATA7_B_MARK,
> +	},
> +};
> +
> +static const unsigned int vin5_sync_a_pins[] = {
> +	/* HSYNC_N, VSYNC_N */
> +	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 9),
> +};
> +
> +static const unsigned int vin5_sync_a_mux[] = {
> +	VI5_HSYNC_N_A_MARK, VI5_VSYNC_N_A_MARK,
> +};
> +
> +static const unsigned int vin5_field_a_pins[] = {
> +	RCAR_GP_PIN(1, 10),
> +};
> +
> +static const unsigned int vin5_field_a_mux[] = {
> +	VI5_FIELD_A_MARK,
> +};
> +
> +static const unsigned int vin5_clkenb_a_pins[] = {
> +	RCAR_GP_PIN(0, 1),
> +};
> +
> +static const unsigned int vin5_clkenb_a_mux[] = {
> +	VI5_CLKENB_A_MARK,
> +};
> +
> +static const unsigned int vin5_clk_a_pins[] = {
> +	RCAR_GP_PIN(1, 0),
> +};
> +
> +static const unsigned int vin5_clk_a_mux[] = {
> +	VI5_CLK_A_MARK,
> +};
> +
> +static const unsigned int vin5_clk_b_pins[] = {
> +	RCAR_GP_PIN(2, 22),
> +};
> +
> +static const unsigned int vin5_clk_b_mux[] = {
> +	VI5_CLK_B_MARK,
> +};
> +
>  static const struct sh_pfc_pin_group pinmux_groups[] = {
>  	SH_PFC_PIN_GROUP(avb_link),
>  	SH_PFC_PIN_GROUP(avb_magic),
> @@ -1889,6 +2077,32 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>  	SH_PFC_PIN_GROUP(usb0_id),
>  	SH_PFC_PIN_GROUP(usb30),
>  	SH_PFC_PIN_GROUP(usb30_id),
> +	VIN_DATA_PIN_GROUP(vin4_data_a, 8),
> +	VIN_DATA_PIN_GROUP(vin4_data_a, 10),
> +	VIN_DATA_PIN_GROUP(vin4_data_a, 12),
> +	VIN_DATA_PIN_GROUP(vin4_data_a, 16),
> +	VIN_DATA_PIN_GROUP(vin4_data_a, 20),
> +	VIN_DATA_PIN_GROUP(vin4_data_a, 24),
> +	VIN_DATA_PIN_GROUP(vin4_data_b, 8),
> +	VIN_DATA_PIN_GROUP(vin4_data_b, 10),
> +	VIN_DATA_PIN_GROUP(vin4_data_b, 12),
> +	VIN_DATA_PIN_GROUP(vin4_data_b, 16),
> +	VIN_DATA_PIN_GROUP(vin4_data_b, 20),
> +	VIN_DATA_PIN_GROUP(vin4_data_b, 24),
> +	SH_PFC_PIN_GROUP(vin4_sync),
> +	SH_PFC_PIN_GROUP(vin4_field),
> +	SH_PFC_PIN_GROUP(vin4_clkenb),
> +	SH_PFC_PIN_GROUP(vin4_clk),
> +	VIN_DATA_PIN_GROUP(vin5_data_a, 8),
> +	VIN_DATA_PIN_GROUP(vin5_data_a, 10),
> +	VIN_DATA_PIN_GROUP(vin5_data_a, 12),
> +	VIN_DATA_PIN_GROUP(vin5_data_a, 16),
> +	VIN_DATA_PIN_GROUP(vin5_data_b, 8),
> +	SH_PFC_PIN_GROUP(vin5_sync_a),
> +	SH_PFC_PIN_GROUP(vin5_field_a),
> +	SH_PFC_PIN_GROUP(vin5_clkenb_a),
> +	SH_PFC_PIN_GROUP(vin5_clk_a),
> +	SH_PFC_PIN_GROUP(vin5_clk_b),
>  };
>  
>  static const char * const avb_groups[] = {
> @@ -1996,6 +2210,40 @@ static const char * const usb30_groups[] = {
>  	"usb30_id",
>  };
>  
> +static const char * const vin4_groups[] = {
> +	"vin4_data8_a",
> +	"vin4_data10_a",
> +	"vin4_data12_a",
> +	"vin4_data16_a",
> +	"vin4_data20_a",
> +	"vin4_data24_a",
> +	"vin4_data8_b",
> +	"vin4_data10_b",
> +	"vin4_data12_b",
> +	"vin4_data16_b",
> +	"vin4_data20_b",
> +	"vin4_data24_b",
> +	"vin4_data8_sft8",
> +	"vin4_sync",
> +	"vin4_field",
> +	"vin4_clkenb",
> +	"vin4_clk",
> +};
> +
> +static const char * const vin5_groups[] = {
> +	"vin5_data8_a",
> +	"vin5_data8_sft8_a",
> +	"vin5_data10_a",
> +	"vin5_data12_a",
> +	"vin5_data16_a",
> +	"vin5_data8_b",
> +	"vin5_sync_a",
> +	"vin5_field_a",
> +	"vin5_clkenb_a",
> +	"vin5_clk_a",
> +	"vin5_clk_b",
> +};
> +
>  static const struct sh_pfc_function pinmux_functions[] = {
>  	SH_PFC_FUNCTION(avb),
>  	SH_PFC_FUNCTION(i2c1),
> @@ -2013,6 +2261,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
>  	SH_PFC_FUNCTION(scif_clk),
>  	SH_PFC_FUNCTION(usb0),
>  	SH_PFC_FUNCTION(usb30),
> +	SH_PFC_FUNCTION(vin4),
> +	SH_PFC_FUNCTION(vin5),
>  };
>  
>  static const struct pinmux_cfg_reg pinmux_config_regs[] = {
> -- 
> 2.7.4
> 
