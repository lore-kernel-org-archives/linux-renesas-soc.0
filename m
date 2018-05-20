Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:32990 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751347AbeETIV7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 May 2018 04:21:59 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: Re: [PATCH 1/5] drm: rcar-du: Add r8a77995 device support
Date: Sun, 20 May 2018 11:22:21 +0300
Message-ID: <3388861.61vxE1Ocq2@avalon>
In-Reply-To: <1526386840-15368-2-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1526386840-15368-2-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

Thank you for the patch.

On Tuesday, 15 May 2018 15:20:36 EEST Ulrich Hecht wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> Add support for the R-Car D3 (R8A77995) SoC to the R-Car DU driver.
> 
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 05745e8..ba82842 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -266,6 +266,31 @@ static const struct rcar_du_device_info
> rcar_du_r8a77970_info = { .num_lvds = 1,
>  };
> 
> +static const struct rcar_du_device_info rcar_du_r8a77995_info = {
> +	.gen = 3,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> +		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE,
> +	.num_crtcs = 2,
> +	.routes = {
> +		/* R8A77995 has two LVDS output and one RGB output.
> +		 */

This comment holds on a single line.

Apart from that the patch looks good to me, but it conflicts with

commit 5361cc7f8e9146f393cfcb76890d8c80a4e73086
Author: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Date:   Fri Apr 27 23:21:52 2018 +0100

    drm: rcar-du: Split CRTC handling to support hardware indexing

that has been queued in Dave's DRM tree for v4.18. The num_crtcs field has 
been replaced with a channels_mask field. I can fix when applying but I can't 
test the result as I don't have a D3 board, so I'd prefer if you could submit 
a v2 rebased on top of Dave's drm-next branch.

I'm also wondering whether we also need

commit 6f3850955384cff722f02530f570806897b02a87
Author: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Date:   Wed Dec 6 20:30:24 2017 +0900

    drm: rcar-du: Fix digital RGB routing for R8A77995

from the BSP. What's your opinion ?

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
> +};
> +
>  static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
>  	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
> @@ -278,6 +303,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7795", .data = &rcar_du_r8a7795_info },
>  	{ .compatible = "renesas,du-r8a7796", .data = &rcar_du_r8a7796_info },
>  	{ .compatible = "renesas,du-r8a77970", .data = &rcar_du_r8a77970_info },
> +	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a77995_info },
>  	{ }
>  };

-- 
Regards,

Laurent Pinchart
