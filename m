Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:32107 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbeIZWJP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 18:09:15 -0400
Date: Wed, 26 Sep 2018 17:55:38 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <77059748.327359.1537977338265@webmail.strato.com>
In-Reply-To: <20180914091046.483-10-laurent.pinchart+renesas@ideasonboard.com>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180914091046.483-10-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 09/16] drm: rcar-du: Cache DSYSR value to ensure
 known initial value
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> On September 14, 2018 at 11:10 AM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> 
> 
> DSYSR is a DU channel register that also contains group fields. It is
> thus written to by both the group and CRTC code, using read-update-write
> sequences. As the register isn't initialized explicitly at startup time,
> this can lead to invalid or otherwise unexpected values being written to
> some of the fields if they have been modified by the firmware or just
> not reset properly.
> 
> To fix this we can write a fully known value to the DSYSR register when
> turning a channel's functional clock on. However, the mix of group and
> channel fields complicate this. A simpler solution is to cache the
> register and initialize the cached value to the desired hardware
> defaults.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 16 ++++++++--------
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |  5 +++++
>  drivers/gpu/drm/rcar-du/rcar_du_group.c |  7 ++++---
>  3 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 2f8776c1ec8f..f827fccf6416 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -57,13 +57,12 @@ static void rcar_du_crtc_set(struct rcar_du_crtc *rcrtc, u32 reg, u32 set)
>  		      rcar_du_read(rcdu, rcrtc->mmio_offset + reg) | set);
>  }
>  
> -static void rcar_du_crtc_clr_set(struct rcar_du_crtc *rcrtc, u32 reg,
> -				 u32 clr, u32 set)
> +void rcar_du_crtc_dsysr_clr_set(struct rcar_du_crtc *rcrtc, u32 clr, u32 set)
>  {
>  	struct rcar_du_device *rcdu = rcrtc->group->dev;
> -	u32 value = rcar_du_read(rcdu, rcrtc->mmio_offset + reg);
>  
> -	rcar_du_write(rcdu, rcrtc->mmio_offset + reg, (value & ~clr) | set);
> +	rcrtc->dsysr = (rcrtc->dsysr & ~clr) | set;
> +	rcar_du_write(rcdu, rcrtc->mmio_offset + DSYSR, rcrtc->dsysr);
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -576,9 +575,9 @@ static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
>  	 * actively driven).
>  	 */
>  	interlaced = rcrtc->crtc.mode.flags & DRM_MODE_FLAG_INTERLACE;
> -	rcar_du_crtc_clr_set(rcrtc, DSYSR, DSYSR_TVM_MASK | DSYSR_SCM_MASK,
> -			     (interlaced ? DSYSR_SCM_INT_VIDEO : 0) |
> -			     DSYSR_TVM_MASTER);
> +	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_TVM_MASK | DSYSR_SCM_MASK,
> +				   (interlaced ? DSYSR_SCM_INT_VIDEO : 0) |
> +				   DSYSR_TVM_MASTER);
>  
>  	rcar_du_group_start_stop(rcrtc->group, true);
>  }
> @@ -645,7 +644,7 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
>  	 * Select switch sync mode. This stops display operation and configures
>  	 * the HSYNC and VSYNC signals as inputs.
>  	 */
> -	rcar_du_crtc_clr_set(rcrtc, DSYSR, DSYSR_TVM_MASK, DSYSR_TVM_SWITCH);
> +	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_TVM_MASK, DSYSR_TVM_SWITCH);
>  
>  	rcar_du_group_start_stop(rcrtc->group, false);
>  }
> @@ -1121,6 +1120,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
>  	rcrtc->group = rgrp;
>  	rcrtc->mmio_offset = mmio_offsets[hwindex];
>  	rcrtc->index = hwindex;
> +	rcrtc->dsysr = (rcrtc->index % 2 ? 0 : DSYSR_DRES) | DSYSR_TVM_TVSYNC;
>  
>  	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
>  		primary = &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> index 4990bbe9ba26..59ac6e7d22c9 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> @@ -30,6 +30,7 @@ struct rcar_du_vsp;
>   * @mmio_offset: offset of the CRTC registers in the DU MMIO block
>   * @index: CRTC software and hardware index
>   * @initialized: whether the CRTC has been initialized and clocks enabled
> + * @dsysr: cached value of the DSYSR register
>   * @vblank_enable: whether vblank events are enabled on this CRTC
>   * @event: event to post when the pending page flip completes
>   * @flip_wait: wait queue used to signal page flip completion
> @@ -50,6 +51,8 @@ struct rcar_du_crtc {
>  	unsigned int index;
>  	bool initialized;
>  
> +	u32 dsysr;
> +
>  	bool vblank_enable;
>  	struct drm_pending_vblank_event *event;
>  	wait_queue_head_t flip_wait;
> @@ -103,4 +106,6 @@ void rcar_du_crtc_route_output(struct drm_crtc *crtc,
>  			       enum rcar_du_output output);
>  void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc);
>  
> +void rcar_du_crtc_dsysr_clr_set(struct rcar_du_crtc *rcrtc, u32 clr, u32 set);
> +
>  #endif /* __RCAR_DU_CRTC_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index f38703e7a10d..d85f0a1c1581 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -202,9 +202,10 @@ void rcar_du_group_put(struct rcar_du_group *rgrp)
>  
>  static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
>  {
> -	rcar_du_group_write(rgrp, DSYSR,
> -		(rcar_du_group_read(rgrp, DSYSR) & ~(DSYSR_DRES | DSYSR_DEN)) |
> -		(start ? DSYSR_DEN : DSYSR_DRES));
> +	struct rcar_du_crtc *rcrtc = &rgrp->dev->crtcs[rgrp->index * 2];
> +
> +	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
> +				   start ? DSYSR_DEN : DSYSR_DRES);
>  }
>  
>  void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
> -- 

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
