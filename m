Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F188C388F9
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 11 Nov 2020 12:07:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1F37206C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 11 Nov 2020 12:07:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgKKMH0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 11 Nov 2020 07:07:26 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42489 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgKKMHX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 07:07:23 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 74049E000B;
        Wed, 11 Nov 2020 12:07:19 +0000 (UTC)
Date:   Wed, 11 Nov 2020 13:07:20 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] pinctrl: renesas: r8a77965: Add vin{4,5}_g8 pins
Message-ID: <20201111120720.tsa6jwuk6dc4nwyv@uno.localdomain>
References: <20201110234752.52846-1-niklas.soderlund+renesas@ragnatech.se>
 <20201110234752.52846-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201110234752.52846-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Wed, Nov 11, 2020 at 12:47:52AM +0100, Niklas Söderlund wrote:
> This patch adds VIN{4,5}_g8 support to the R8A77965 SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Looks good!

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/pinctrl/renesas/pfc-r8a77965.c | 34 +++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
> index 7a50b9b69a7dc4e3..20198e3b50191665 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77965.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
> @@ -4285,6 +4285,20 @@ static const union vin_data vin4_data_b_mux = {
>  	},
>  };
>
> +static const unsigned int vin4_g8_pins[] = {
> +	RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
> +	RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
> +	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +};
> +
> +static const unsigned int vin4_g8_mux[] = {
> +	VI4_DATA8_MARK,  VI4_DATA9_MARK,
> +	VI4_DATA10_MARK, VI4_DATA11_MARK,
> +	VI4_DATA12_MARK, VI4_DATA13_MARK,
> +	VI4_DATA14_MARK, VI4_DATA15_MARK,
> +};
> +
>  static const unsigned int vin4_sync_pins[] = {
>  	/* VSYNC_N, HSYNC_N */
>  	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
> @@ -4345,6 +4359,20 @@ static const union vin_data16 vin5_data_mux = {
>  	},
>  };
>
> +static const unsigned int vin5_g8_pins[] = {
> +	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
> +	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
> +	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +};
> +
> +static const unsigned int vin5_g8_mux[] = {
> +	VI5_DATA8_MARK,  VI5_DATA9_MARK,
> +	VI5_DATA10_MARK, VI5_DATA11_MARK,
> +	VI5_DATA12_MARK, VI5_DATA13_MARK,
> +	VI5_DATA14_MARK, VI5_DATA15_MARK,
> +};
> +
>  static const unsigned int vin5_sync_pins[] = {
>  	/* VSYNC_N, HSYNC_N */
>  	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 10),
> @@ -4379,7 +4407,7 @@ static const unsigned int vin5_clk_mux[] = {
>  };
>
>  static const struct {
> -	struct sh_pfc_pin_group common[318];
> +	struct sh_pfc_pin_group common[320];
>  	struct sh_pfc_pin_group automotive[30];
>  } pinmux_groups = {
>  	.common = {
> @@ -4689,6 +4717,7 @@ static const struct {
>  		SH_PFC_PIN_GROUP(vin4_data18_b),
>  		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
>  		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
> +		SH_PFC_PIN_GROUP(vin4_g8),
>  		SH_PFC_PIN_GROUP(vin4_sync),
>  		SH_PFC_PIN_GROUP(vin4_field),
>  		SH_PFC_PIN_GROUP(vin4_clkenb),
> @@ -4697,6 +4726,7 @@ static const struct {
>  		VIN_DATA_PIN_GROUP(vin5_data, 10),
>  		VIN_DATA_PIN_GROUP(vin5_data, 12),
>  		VIN_DATA_PIN_GROUP(vin5_data, 16),
> +		SH_PFC_PIN_GROUP(vin5_g8),
>  		SH_PFC_PIN_GROUP(vin5_sync),
>  		SH_PFC_PIN_GROUP(vin5_field),
>  		SH_PFC_PIN_GROUP(vin5_clkenb),
> @@ -5231,6 +5261,7 @@ static const char * const vin4_groups[] = {
>  	"vin4_data18_b",
>  	"vin4_data20_b",
>  	"vin4_data24_b",
> +	"vin4_g8",
>  	"vin4_sync",
>  	"vin4_field",
>  	"vin4_clkenb",
> @@ -5242,6 +5273,7 @@ static const char * const vin5_groups[] = {
>  	"vin5_data10",
>  	"vin5_data12",
>  	"vin5_data16",
> +	"vin5_g8",
>  	"vin5_sync",
>  	"vin5_field",
>  	"vin5_clkenb",
> --
> 2.29.2
>
