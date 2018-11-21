Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:50944 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387447AbeKVJVe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Nov 2018 04:21:34 -0500
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2] drm: rcar-du: Reject modes that fail CRTC timing
 requirements
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20181121222012.11801-1-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <25cce316-508f-0a7b-7d4a-de5427aa5259@ideasonboard.com>
Date: Wed, 21 Nov 2018 22:45:04 +0000
MIME-Version: 1.0
In-Reply-To: <20181121222012.11801-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thank you for the patch(es)

On 21/11/2018 22:20, Laurent Pinchart wrote:
> The hardware requires the HDSR and VDSR registers to be set to 1 or
> higher. This translates to a minimum combined horizontal sync and back
> porch of 20 pixels and a minimum vertical back porch of 3 lines. Reject
> modes that fail those requirements.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> Changes since v1:
> 
> - Don't use mode->crtc_v* as they are only set after calling .mode_valid()
> - Tested the patch on real hardware (which would have prevented the
>   buggy v1...)
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 79021d7aa3ce..90dacab67be5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -735,10 +735,22 @@ enum drm_mode_status rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
>  	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
>  	struct rcar_du_device *rcdu = rcrtc->group->dev;
>  	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
> +	unsigned int vbp;
>  
>  	if (interlaced && !rcar_du_has(rcdu, RCAR_DU_FEATURE_INTERLACED))
>  		return MODE_NO_INTERLACE;
>  
> +	/*
> +	 * The hardware requires a minimum combined horizontal sync and back
> +	 * porch of 20 pixels and a minimum vertical back porch of 3 lines.
> +	 */
> +	if (mode->htotal - mode->hsync_start < 20)
> +		return MODE_HBLANK_NARROW;
> +
> +	vbp = (mode->vtotal - mode->vsync_end) / (interlaced ? 2 : 1);

I can't see where the interlaced value was calculated before on patch
v1. Was it handled somewhere before/while being set in to crtc->vtotal?,

That said, I can see that it makes sense here, so it's not a problem.


> +	if (vbp < 3)
> +		return MODE_VBLANK_NARROW;
> +
>  	return MODE_OK;
>  }
>  
> 

-- 
Regards
--
Kieran
