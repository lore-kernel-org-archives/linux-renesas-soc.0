Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:49765 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731332AbeISVyd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 17:54:33 -0400
Date: Wed, 19 Sep 2018 19:15:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
        open list <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 1/2] drm/atomic: Initialise planes with opaque alpha
 values
Message-ID: <20180919161545.GH5565@intel.com>
References: <20180919155700.10342-1-kieran.bingham+renesas@ideasonboard.com>
 <20180919155700.10342-2-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180919155700.10342-2-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 19, 2018 at 04:56:58PM +0100, Kieran Bingham wrote:
> Planes without an alpha property, using __drm_atomic_helper_plane_reset
> will have their plane state alpha initialised as zero, which represents
> a transparent alpha.
> 
> If this value is then used for the plane, it may not be visible by
> default, and thus doesn't represent a good initialisation state.
> 
> Update the default state->alpha value to DRM_BLEND_ALPHA_OPAQUE
> unconditionally when the plane is reset.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 3cf1aa132778..e49b22381048 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3569,9 +3569,7 @@ void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
>  	state->plane = plane;
>  	state->rotation = DRM_MODE_ROTATE_0;
>  
> -	/* Reset the alpha value to fully opaque if it matters */
> -	if (plane->alpha_property)
> -		state->alpha = plane->alpha_property->values[1];
> +	state->alpha = DRM_BLEND_ALPHA_OPAQUE;

I can't come up with a solid excuse for not initializing it always.

Reviewed-by: Ville Syrj�l� <ville.syrjala@linux.intel.com>

>  	state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>  
>  	plane->state = state;
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrj�l�
Intel
