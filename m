Return-Path: <kieranbingham@gmail.com>
Subject: Re: [PATCH v2 5/5] drm: rcar-du: Map memory through the VSP device
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20170516232007.20980-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170516232007.20980-6-laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
From: Kieran Bingham <kieranbingham@gmail.com>
Message-ID: <49a21f46-b183-d5a1-b9cd-d79482596395@gmail.com>
Date: Mon, 22 May 2017 13:15:37 +0100
MIME-Version: 1.0
In-Reply-To: <20170516232007.20980-6-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thankyou for the patch.

On 17/05/17 00:20, Laurent Pinchart wrote:
> For planes handled by a VSP instance, map the framebuffer memory through
> the VSP to ensure proper IOMMU handling.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Looks good except for a small unsigned int comparison causing an infinite loop
on fail case.

With the loop fixed:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 74 ++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.h |  2 +
>  2 files changed, 70 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index b0ff304ce3dc..1b874cfd40f3 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -19,7 +19,9 @@
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_plane_helper.h>
>  
> +#include <linux/dma-mapping.h>
>  #include <linux/of_platform.h>
> +#include <linux/scatterlist.h>
>  #include <linux/videodev2.h>
>  
>  #include <media/vsp1.h>
> @@ -170,12 +172,9 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>  	cfg.dst.width = state->state.crtc_w;
>  	cfg.dst.height = state->state.crtc_h;
>  
> -	for (i = 0; i < state->format->planes; ++i) {
> -		struct drm_gem_cma_object *gem;
> -
> -		gem = drm_fb_cma_get_gem_obj(fb, i);
> -		cfg.mem[i] = gem->paddr + fb->offsets[i];
> -	}
> +	for (i = 0; i < state->format->planes; ++i)
> +		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
> +			   + fb->offsets[i];
>  
>  	for (i = 0; i < ARRAY_SIZE(formats_kms); ++i) {
>  		if (formats_kms[i] == state->format->fourcc) {
> @@ -187,6 +186,67 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>  	vsp1_du_atomic_update(plane->vsp->vsp, plane->index, &cfg);
>  }
>  
> +static int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
> +					struct drm_plane_state *state)
> +{
> +	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(state);
> +	struct rcar_du_vsp *vsp = to_rcar_vsp_plane(plane)->vsp;
> +	struct rcar_du_device *rcdu = vsp->dev;
> +	unsigned int i;

Unsigned here..

> +	int ret;
> +
> +	if (!state->fb)
> +		return 0;
> +
> +	for (i = 0; i < rstate->format->planes; ++i) {
> +		struct drm_gem_cma_object *gem =
> +			drm_fb_cma_get_gem_obj(state->fb, i);
> +		struct sg_table *sgt = &rstate->sg_tables[i];
> +
> +		ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr, gem->paddr,
> +				      gem->base.size);
> +		if (ret)
> +			goto fail;
> +
> +		ret = vsp1_du_map_sg(vsp->vsp, sgt);
> +		if (!ret) {
> +			sg_free_table(sgt);
> +			ret = -ENOMEM;
> +			goto fail;
> +		}
> +	}
> +
> +	return 0;
> +
> +fail:
> +	for (i--; i >= 0; i--) {

Means that this loop will never exit; i will always be >= 0;

I'd propose just making signed for this usage.

I've checked the i values for the breakouts - so they are good, and we need to
use i == 0 to unmap the last table.

> +		struct sg_table *sgt = &rstate->sg_tables[i];
> +
> +		vsp1_du_unmap_sg(vsp->vsp, sgt);
> +		sg_free_table(sgt);
> +	}
> +
> +	return ret;
> +}
> +
> +static void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
> +					 struct drm_plane_state *state)
> +{
> +	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(state);
> +	struct rcar_du_vsp *vsp = to_rcar_vsp_plane(plane)->vsp;
> +	unsigned int i;
> +
> +	if (!state->fb)
> +		return;
> +
> +	for (i = 0; i < rstate->format->planes; ++i) {
> +		struct sg_table *sgt = &rstate->sg_tables[i];
> +
> +		vsp1_du_unmap_sg(vsp->vsp, sgt);
> +		sg_free_table(sgt);
> +	}
> +}
> +
>  static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
>  					  struct drm_plane_state *state)
>  {
> @@ -227,6 +287,8 @@ static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
>  }
>  
>  static const struct drm_plane_helper_funcs rcar_du_vsp_plane_helper_funcs = {
> +	.prepare_fb = rcar_du_vsp_plane_prepare_fb,
> +	.cleanup_fb = rcar_du_vsp_plane_cleanup_fb,
>  	.atomic_check = rcar_du_vsp_plane_atomic_check,
>  	.atomic_update = rcar_du_vsp_plane_atomic_update,
>  };
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> index f1d0f1824528..8861661590ff 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> @@ -43,6 +43,7 @@ static inline struct rcar_du_vsp_plane *to_rcar_vsp_plane(struct drm_plane *p)
>   * struct rcar_du_vsp_plane_state - Driver-specific plane state
>   * @state: base DRM plane state
>   * @format: information about the pixel format used by the plane
> + * @sg_tables: scatter-gather tables for the frame buffer memory
>   * @alpha: value of the plane alpha property
>   * @zpos: value of the plane zpos property
>   */
> @@ -50,6 +51,7 @@ struct rcar_du_vsp_plane_state {
>  	struct drm_plane_state state;
>  
>  	const struct rcar_du_format_info *format;
> +	struct sg_table sg_tables[3];
>  
>  	unsigned int alpha;
>  	unsigned int zpos;
> 
