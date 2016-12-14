Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:44936 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753188AbcLNUy1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Dec 2016 15:54:27 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: enable VSPDs on R8A7791
Date: Wed, 14 Dec 2016 22:55:01 +0200
Message-ID: <1823239.KB8yzOkpmW@avalon>
In-Reply-To: <4947043.txDs5ZU4mH@wasted.cogentembedded.com>
References: <4947043.txDs5ZU4mH@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thank you for the patch.

On Wednesday 14 Dec 2016 23:37:08 Sergei Shtylyov wrote:
> We're going to use R8A7791 VSPDs to control DU, so set the corresponding
> flag.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

For the same reason I nacked the corresponding patch to the VSP1 driver, I 
have to nack this one as well. The Gen2 DU has native planes, this patch would 
prevent using them. I don't see a good reason to do so.

> ---
> The patch is against David Airlie's 'linux.git' repo's 'drm-next' branch.
> 
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> ===================================================================
> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -90,7 +90,8 @@ static const struct rcar_du_device_info
>  static const struct rcar_du_device_info rcar_du_r8a7791_info = {
>  	.gen = 2,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
> +		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE,
>  	.num_crtcs = 2,
>  	.routes = {
>  		/* R8A779[13] has one RGB output, one LVDS output and one

-- 
Regards,

Laurent Pinchart
