Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51393 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752736AbeEPIDq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 04:03:46 -0400
Date: Wed, 16 May 2018 10:03:42 +0200
From: Simon Horman <horms@verge.net.au>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: Re: [PATCH 1/5] drm: rcar-du: Add r8a77995 device support
Message-ID: <20180516080342.ltanqhcj5bhljp5t@verge.net.au>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526386840-15368-2-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526386840-15368-2-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 15, 2018 at 02:20:36PM +0200, Ulrich Hecht wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> Add support for the R-Car D3 (R8A77995) SoC to the R-Car DU driver.
> 
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 05745e8..ba82842 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -266,6 +266,31 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
>  	.num_lvds = 1,
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
>  
> -- 
> 2.7.4
> 
