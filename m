Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:52224 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727262AbeJQOpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 10:45:51 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v2 3/5] drm: rcar-du: Add r8a77470 support
Date: Wed, 17 Oct 2018 09:51:45 +0300
Message-ID: <2608669.V0TntACJSi@avalon>
In-Reply-To: <1539709139-20342-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1539709139-20342-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

Thank you for the patch.

On Tuesday, 16 October 2018 19:58:59 EEST Fabrizio Castro wrote:
> Add RZ/G1C (a.k.a. r8a77470) support to the R-Car DU driver.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ---
> v1->v2:
> * Added flags RCAR_DU_FEATURE_INTERLACED and RCAR_DU_FEATURE_TVM_SYNC
> * Reworked comment

This looks all good, applied to my tree.

>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 084f58d..d8a02c4 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -77,6 +77,33 @@ static const struct rcar_du_device_info
> rzg1_du_r8a7745_info = { },
>  };
> 
> +static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
> +	.gen = 2,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> +		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
> +		  | RCAR_DU_FEATURE_INTERLACED
> +		  | RCAR_DU_FEATURE_TVM_SYNC,
> +	.channels_mask = BIT(1) | BIT(0),
> +	.routes = {
> +		/*
> +		 * R8A77470 has two RGB outputs, one LVDS output, and
> +		 * one (currently unsupported) analog video output
> +		 */
> +		[RCAR_DU_OUTPUT_DPAD0] = {
> +			.possible_crtcs = BIT(0),
> +			.port = 0,
> +		},
> +		[RCAR_DU_OUTPUT_DPAD1] = {
> +			.possible_crtcs = BIT(1),
> +			.port = 1,
> +		},
> +		[RCAR_DU_OUTPUT_LVDS0] = {
> +			.possible_crtcs = BIT(0) | BIT(1),
> +			.port = 2,
> +		},
> +	},
> +};
> +
>  static const struct rcar_du_device_info rcar_du_r8a7779_info = {
>  	.gen = 2,
>  	.features = RCAR_DU_FEATURE_INTERLACED
> @@ -342,6 +369,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7799x_info = { static const struct of_device_id
> rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
>  	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
> +	{ .compatible = "renesas,du-r8a77470", .data = &rzg1_du_r8a77470_info },
>  	{ .compatible = "renesas,du-r8a7779", .data = &rcar_du_r8a7779_info },
>  	{ .compatible = "renesas,du-r8a7790", .data = &rcar_du_r8a7790_info },
>  	{ .compatible = "renesas,du-r8a7791", .data = &rcar_du_r8a7791_info },


-- 
Regards,

Laurent Pinchart
