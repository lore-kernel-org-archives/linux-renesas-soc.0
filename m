Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45172 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbeIXRnc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Sep 2018 13:43:32 -0400
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 11/16] drm: rcar-du: Add r8a77990 and r8a77995 device
 support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, Ulrich Hecht <uli@fpond.eu>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180914091046.483-12-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <5d65e70b-5faf-f28d-51a0-6d6b96be2f82@ideasonboard.com>
Date: Mon, 24 Sep 2018 12:41:48 +0100
MIME-Version: 1.0
In-Reply-To: <20180914091046.483-12-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent, Uli,

On 14/09/18 10:10, Laurent Pinchart wrote:
> From: Ulrich Hecht <uli+renesas@fpond.eu>
> 
> Add support for the R-Car D3 (R8A77995) and E3 (R8A77990) SoCs to the
> R-Car DU driver. The two SoCs instantiate compatible DUs, so a single
> information structure is enough.
> 
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> [Add support for R8A77990]
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index fa0d381c2d0f..084f58df4a8c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -311,6 +311,34 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
>  	.num_lvds = 1,
>  };
>  
> +static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
> +	.gen = 3,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> +		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE,
> +	.channels_mask = BIT(1) | BIT(0),
> +	.routes = {
> +		/*
> +		 * R8A77990 and R8A77995 have one RGB output and two LVDS
> +		 * outputs.
> +		 */
> +		[RCAR_DU_OUTPUT_DPAD0] = {
> +			.possible_crtcs = BIT(0) | BIT(1),
> +			.port = 0,
> +		},
> +		[RCAR_DU_OUTPUT_LVDS0] = {
> +			.possible_crtcs = BIT(0),
> +			.port = 1,
> +		},
> +		[RCAR_DU_OUTPUT_LVDS1] = {
> +			.possible_crtcs = BIT(1),
> +			.port = 2,
> +		},
> +	},
> +	.num_lvds = 2,
> +	.lvds_clk_mask =  BIT(1) | BIT(0),
> +};
> +
>  static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
>  	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
> @@ -324,6 +352,8 @@ static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7796", .data = &rcar_du_r8a7796_info },
>  	{ .compatible = "renesas,du-r8a77965", .data = &rcar_du_r8a77965_info },
>  	{ .compatible = "renesas,du-r8a77970", .data = &rcar_du_r8a77970_info },
> +	{ .compatible = "renesas,du-r8a77990", .data = &rcar_du_r8a7799x_info },
> +	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
>  	{ }
>  };
>  
> 

-- 
Regards
--
Kieran
