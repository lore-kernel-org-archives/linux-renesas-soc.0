Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34534 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754821AbcE0VdJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 27 May 2016 17:33:09 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] rcar-du: add R8A7794 TCON support
Date: Sat, 28 May 2016 00:33:10 +0300
Message-ID: <2917760.oKZGhZUS1H@avalon>
In-Reply-To: <3056907.Acy0t71QPW@wasted.cogentembedded.com>
References: <1787748.qAADjKK4gv@wasted.cogentembedded.com> <3056907.Acy0t71QPW@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thank you for the patch.

On Friday 29 Apr 2016 00:05:33 Sergei Shtylyov wrote:
> Now that we have the TCON encoder driver, we can start enabling TCON support
> for the  R-Car SoCs. We have only tested the code on R8A7794 so far, so 
> let it  be the first supported SoC...

Please also update the DT bindings.

> Based on a large patch by Andrey Gusakov.
> 
> Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c |   10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> Index: renesas/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> ===================================================================
> --- renesas.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ renesas/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -116,9 +116,7 @@ static const struct rcar_du_device_info
> 
>  		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
> 
>  	.num_crtcs = 2,
>  	.routes = {
> -		/* R8A7794 has two RGB outputs and one (currently unsupported)
> -		 * TCON output.
> -		 */
> +		/* R8A7794 has two RGB outputs and one TCON output. */
>  		[RCAR_DU_OUTPUT_DPAD0] = {
>  			.possible_crtcs = BIT(0),
>  			.encoder_type = DRM_MODE_ENCODER_NONE,
> @@ -129,8 +127,14 @@ static const struct rcar_du_device_info
>  			.encoder_type = DRM_MODE_ENCODER_NONE,
>  			.port = 1,
>  		},
> +		[RCAR_DU_OUTPUT_TCON] = {
> +			.possible_crtcs = BIT(0),

According to the datasheet TCON can be connected to both DU0 and DU1.

> +			.encoder_type = DRM_MODE_ENCODER_TCON,
> +			.port = 2,
> +		},
>  	},
>  	.num_lvds = 0,
> +	.num_tcon = 1,
>  };
> 
>  static const struct rcar_du_device_info rcar_du_r8a7795_info = {

-- 
Regards,

Laurent Pinchart
