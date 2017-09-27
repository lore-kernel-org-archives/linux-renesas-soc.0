Subject: Re: [PATCH 3/3] drm: rcar-du: Clip planes to screen boundaries
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20170815230338.14913-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170815230338.14913-4-laurent.pinchart+renesas@ideasonboard.com>
Reply-To: kieran.bingham@ideasonboard.com
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <d06c0c6e-6f50-fe94-da31-e9aeef2ba25c@ideasonboard.com>
Date: Wed, 27 Sep 2017 19:58:44 +0100
MIME-Version: 1.0
In-Reply-To: <20170815230338.14913-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for the patch,

On 16/08/17 00:03, Laurent Pinchart wrote:
> Unlike the KMS API, the hardware doesn't support planes exceeding the
> screen boundaries. Clip plane coordinates to support the use case.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 66 +++++++++++++++++++++++++--------
>  drivers/gpu/drm/rcar-du/rcar_du_plane.h |  4 ++
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 21 +++++++----
>  3 files changed, 67 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index 714e02960635..7944790bac25 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -19,6 +19,7 @@
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_rect.h>
>  
>  #include "rcar_du_drv.h"
>  #include "rcar_du_group.h"
> @@ -329,11 +330,39 @@ static void rcar_du_plane_write(struct rcar_du_group *rgrp,
>  		      data);
>  }
>  
> +void rcar_du_plane_clip(const struct drm_plane_state *state,
> +			struct drm_rect *src, struct drm_rect *dst)
> +{
> +	const struct drm_display_mode *mode;
> +
> +	/*
> +	 * The hardware requires all planes to be fully contained in the output
> +	 * rectangle. Crop the destination rectangle to fit in the CRTC.
> +	 */
> +	mode = &state->crtc->state->adjusted_mode;
> +
> +	dst->x1 = max(0, state->crtc_x);
> +	dst->y1 = max(0, state->crtc_y);
> +	dst->x2 = min_t(unsigned int, mode->hdisplay,
> +			state->crtc_x + state->crtc_w);
> +	dst->y2 = min_t(unsigned int, mode->vdisplay,
> +			state->crtc_y + state->crtc_h);
> +
> +	/*
> +	 * Offset the left and top source coordinates by the same displacement
> +	 * we have applied to the destination rectangle. Copy the width and
> +	 * height as the hardware can't scale.
> +	 */
> +	src->x1 = (state->src_x >> 16) + (dst->x1 - state->crtc_x);
> +	src->y1 = (state->src_y >> 16) + (dst->y1 - state->crtc_y);

I had to look up why we do a >> 16 here. I guess this is for sub-pixel
positioning. That might be obvious to DRM developers, but was new to me.

Probably not worth a comment though - as I know what it is now :)
Do we have any macros to make this 16.16 -> int conversion more explicit?
(I think this comes under the same category as using BIT() to which we differ on
opinion anyway though)


> +	src->x2 = src->x1 + (dst->x2 - dst->x1);
> +	src->y2 = src->y1 + (dst->y2 - dst->y1);
> +}
> +
>  static void rcar_du_plane_setup_scanout(struct rcar_du_group *rgrp,
> -					const struct rcar_du_plane_state *state)
> +					const struct rcar_du_plane_state *state,
> +					const struct drm_rect *src)
>  {
> -	unsigned int src_x = state->state.src_x >> 16;
> -	unsigned int src_y = state->state.src_y >> 16;
>  	unsigned int index = state->hwindex;
>  	unsigned int pitch;
>  	bool interlaced;
> @@ -357,7 +386,7 @@ static void rcar_du_plane_setup_scanout(struct rcar_du_group *rgrp,
>  			dma[i] = gem->paddr + fb->offsets[i];
>  		}
>  	} else {
> -		pitch = state->state.src_w >> 16;
> +		pitch = drm_rect_width(&state->state.src);
>  		dma[0] = 0;
>  		dma[1] = 0;
>  	}
> @@ -383,8 +412,8 @@ static void rcar_du_plane_setup_scanout(struct rcar_du_group *rgrp,
>  	 * require a halved Y position value, in both progressive and interlaced
>  	 * modes.
>  	 */
> -	rcar_du_plane_write(rgrp, index, PnSPXR, src_x);
> -	rcar_du_plane_write(rgrp, index, PnSPYR, src_y *
> +	rcar_du_plane_write(rgrp, index, PnSPXR, src->x1);
> +	rcar_du_plane_write(rgrp, index, PnSPYR, src->y1 *
>  			    (!interlaced && state->format->bpp == 32 ? 2 : 1));
>  
>  	rcar_du_plane_write(rgrp, index, PnDSA0R, dma[0]);
> @@ -394,8 +423,8 @@ static void rcar_du_plane_setup_scanout(struct rcar_du_group *rgrp,
>  
>  		rcar_du_plane_write(rgrp, index, PnMWR, pitch);
>  
> -		rcar_du_plane_write(rgrp, index, PnSPXR, src_x);
> -		rcar_du_plane_write(rgrp, index, PnSPYR, src_y *
> +		rcar_du_plane_write(rgrp, index, PnSPXR, src->x1);
> +		rcar_du_plane_write(rgrp, index, PnSPYR, src->y1 *
>  				    (state->format->bpp == 16 ? 2 : 1) / 2);
>  
>  		rcar_du_plane_write(rgrp, index, PnDSA0R, dma[1]);
> @@ -518,7 +547,8 @@ static void rcar_du_plane_setup_format_gen3(struct rcar_du_group *rgrp,
>  
>  static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,
>  				       unsigned int index,
> -				       const struct rcar_du_plane_state *state)
> +				       const struct rcar_du_plane_state *state,
> +				       const struct drm_rect *dst)
>  {
>  	struct rcar_du_device *rcdu = rgrp->dev;
>  
> @@ -528,10 +558,10 @@ static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,
>  		rcar_du_plane_setup_format_gen3(rgrp, index, state);
>  
>  	/* Destination position and size */
> -	rcar_du_plane_write(rgrp, index, PnDSXR, state->state.crtc_w);
> -	rcar_du_plane_write(rgrp, index, PnDSYR, state->state.crtc_h);
> -	rcar_du_plane_write(rgrp, index, PnDPXR, state->state.crtc_x);
> -	rcar_du_plane_write(rgrp, index, PnDPYR, state->state.crtc_y);
> +	rcar_du_plane_write(rgrp, index, PnDSXR, drm_rect_width(dst));
> +	rcar_du_plane_write(rgrp, index, PnDSYR, drm_rect_height(dst));
> +	rcar_du_plane_write(rgrp, index, PnDPXR, dst->x1);
> +	rcar_du_plane_write(rgrp, index, PnDPYR, dst->y1);
>  
>  	if (rcdu->info->gen < 3) {
>  		/* Wrap-around and blinking, disabled */
> @@ -546,14 +576,18 @@ void __rcar_du_plane_setup(struct rcar_du_group *rgrp,
>  			   const struct rcar_du_plane_state *state)
>  {
>  	struct rcar_du_device *rcdu = rgrp->dev;
> +	struct drm_rect src;
> +	struct drm_rect dst;
> +
> +	rcar_du_plane_clip(&state->state, &src, &dst);
>  
> -	rcar_du_plane_setup_format(rgrp, state->hwindex, state);
> +	rcar_du_plane_setup_format(rgrp, state->hwindex, state, &dst);
>  	if (state->format->planes == 2)
>  		rcar_du_plane_setup_format(rgrp, (state->hwindex + 1) % 8,
> -					   state);
> +					   state, &dst);
>  
>  	if (rcdu->info->gen < 3)
> -		rcar_du_plane_setup_scanout(rgrp, state);
> +		rcar_du_plane_setup_scanout(rgrp, state, &src);
>  
>  	if (state->source == RCAR_DU_PLANE_VSPD1) {
>  		unsigned int vspd1_sink = rgrp->index ? 2 : 0;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
> index 890321b4665d..ec52a2af7cd4 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
> @@ -17,6 +17,7 @@
>  #include <drm/drmP.h>
>  #include <drm/drm_crtc.h>
>  
> +struct drm_rect;
>  struct rcar_du_format_info;
>  struct rcar_du_group;
>  
> @@ -79,6 +80,9 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
>  
>  int rcar_du_planes_init(struct rcar_du_group *rgrp);
>  
> +void rcar_du_plane_clip(const struct drm_plane_state *state,
> +			struct drm_rect *src, struct drm_rect *dst);
> +
>  void __rcar_du_plane_setup(struct rcar_du_group *rgrp,
>  			   const struct rcar_du_plane_state *state);
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index dd66dcb8da23..e62a8d7ee0c5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -18,6 +18,7 @@
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_rect.h>
>  
>  #include <linux/bitops.h>
>  #include <linux/dma-mapping.h>
> @@ -176,17 +177,21 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>  		.alpha = state->alpha,
>  		.zpos = state->state.zpos,
>  	};
> +	struct drm_rect src;
> +	struct drm_rect dst;
>  	unsigned int i;
>  
> -	cfg.src.left = state->state.src_x >> 16;
> -	cfg.src.top = state->state.src_y >> 16;
> -	cfg.src.width = state->state.src_w >> 16;
> -	cfg.src.height = state->state.src_h >> 16;
> +	rcar_du_plane_clip(&state->state, &src, &dst);
>  
> -	cfg.dst.left = state->state.crtc_x;
> -	cfg.dst.top = state->state.crtc_y;
> -	cfg.dst.width = state->state.crtc_w;
> -	cfg.dst.height = state->state.crtc_h;
> +	cfg.src.left = src.x1;
> +	cfg.src.top = src.y1;
> +	cfg.src.width = drm_rect_width(&src);
> +	cfg.src.height = drm_rect_height(&src);
> +
> +	cfg.dst.left = dst.x1;
> +	cfg.dst.top = dst.y1;
> +	cfg.dst.width = drm_rect_width(&dst);
> +	cfg.dst.height = drm_rect_height(&dst);
>  
>  	for (i = 0; i < state->format->planes; ++i)
>  		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
> 
