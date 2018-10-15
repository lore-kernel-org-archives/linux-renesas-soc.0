Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:53338 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbeJPGJ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 02:09:27 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 3/5] drm: rcar-du: Add r8a77470 support
Date: Tue, 16 Oct 2018 01:22:21 +0300
Message-ID: <1733512.u0bX59egiB@avalon>
In-Reply-To: <1537553311-8831-4-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com> <1537553311-8831-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

Thank you for the patch.

On Friday, 21 September 2018 21:08:29 EEST Fabrizio Castro wrote:
> Add RZ/G1C (a.k.a. r8a77470) support to the R-Car DU driver.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 02aee6c..c07d3f1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -77,6 +77,31 @@ static const struct rcar_du_device_info
> rzg1_du_r8a7745_info = { },
>  };
> 
> +static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
> +	.gen = 2,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> +		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,

The DU driver has recently gained two new feature flags, 
RCAR_DU_FEATURE_INTERLACED and RCAR_DU_FEATURE_TVM_SYNC. I believe that both 
should be set here. Could you please confirm (and test) ?

> +	.channels_mask = BIT(1) | BIT(0),
> +	.routes = {
> +		/*
> +		 * R8A77470 has two RGB outputs, one LVDS output, and
> +		 * one analog video output (unsupported)

I'd write this "and one (currently unsupported) analog video output" to match 
the other device entries. With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
>  	.features = 0,
> @@ -297,6 +322,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a77970_info = { static const struct of_device_id
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
