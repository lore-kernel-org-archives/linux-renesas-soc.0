Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:50655 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754395AbeCGRSM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Mar 2018 12:18:12 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: rcar-du: add R8A77970 support
Date: Wed, 07 Mar 2018 19:19:07 +0200
Message-ID: <2541825.7YWZoi4xG1@avalon>
In-Reply-To: <20180118211027.375081728@cogentembedded.com>
References: <20180118211027.375081728@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thank you for the patch.

On Thursday, 18 January 2018 23:05:59 EET Sergei Shtylyov wrote:
> Add support for the R-Car V3M (R8A77970) SoC to the R-Car DU driver.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> ---
> Changes in version 2:
> - removed  the 'model' and 'dpll_ch' field initializers;
> - fixed up the DU port numbers;
> - split the DU bindings and the LVDS driver updates into a separate patches;
> - removed  the check before the DPTSR write (to be done in a separate
> patch).
> 
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c |   21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> ===================================================================
> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -249,6 +249,26 @@ static const struct rcar_du_device_info
>  	.dpll_ch =  BIT(1),
>  };
> 
> +static const struct rcar_du_device_info rcar_du_r8a77970_info = {
> +	.gen = 3,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> +		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE,
> +	.num_crtcs = 1,
> +	.routes = {
> +		/* R8A77970 has one RGB output and one LVDS output. */
> +		[RCAR_DU_OUTPUT_DPAD0] = {
> +			.possible_crtcs = BIT(0),
> +			.port = 0,
> +		},
> +		[RCAR_DU_OUTPUT_LVDS0] = {
> +			.possible_crtcs = BIT(0),
> +			.port = 1,
> +		},
> +	},
> +	.num_lvds = 1,
> +};
> +
>  static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
>  	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
> @@ -260,6 +280,7 @@ static const struct of_device_id rcar_du
>  	{ .compatible = "renesas,du-r8a7794", .data = &rcar_du_r8a7794_info },
>  	{ .compatible = "renesas,du-r8a7795", .data = &rcar_du_r8a7795_info },
>  	{ .compatible = "renesas,du-r8a7796", .data = &rcar_du_r8a7796_info },
> +	{ .compatible = "renesas,du-r8a77970", .data = &rcar_du_r8a77970_info },
>  	{ }
>  };


-- 
Regards,

Laurent Pinchart
