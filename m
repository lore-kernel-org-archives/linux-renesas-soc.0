Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:42971 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753353AbdEVMYH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 08:24:07 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: kieran.bingham@ideasonboard.com
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm: rcar-du: Map memory through the VSP device
Date: Mon, 22 May 2017 15:24:22 +0300
Message-ID: <9845041.8ItKJssoTO@avalon>
In-Reply-To: <b21c3600-ae8e-f384-08f7-cb4229064259@ideasonboard.com>
References: <20170516232007.20980-1-laurent.pinchart+renesas@ideasonboard.com> <20170516232007.20980-6-laurent.pinchart+renesas@ideasonboard.com> <b21c3600-ae8e-f384-08f7-cb4229064259@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Monday 22 May 2017 13:16:11 Kieran Bingham wrote:
> On 17/05/17 00:20, Laurent Pinchart wrote:
> > For planes handled by a VSP instance, map the framebuffer memory through
> > the VSP to ensure proper IOMMU handling.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Looks good except for a small unsigned int comparison causing an infinite
> loop on fail case.
> 
> With the loop fixed:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > ---
> > 
> >  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 74 +++++++++++++++++++++++++++---
> >  drivers/gpu/drm/rcar-du/rcar_du_vsp.h |  2 +
> >  2 files changed, 70 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c index b0ff304ce3dc..1b874cfd40f3
> > 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c

[snip]


> > @@ -187,6 +186,67 @@ static void rcar_du_vsp_plane_setup(struct
> > rcar_du_vsp_plane *plane)
> >  	vsp1_du_atomic_update(plane->vsp->vsp, plane->index, &cfg);
> >  }
> > 
> > +static int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
> > +					struct drm_plane_state *state)
> > +{
> > +	struct rcar_du_vsp_plane_state *rstate = 
to_rcar_vsp_plane_state(state);
> > +	struct rcar_du_vsp *vsp = to_rcar_vsp_plane(plane)->vsp;
> > +	struct rcar_du_device *rcdu = vsp->dev;
> > +	unsigned int i;
> 
> Unsigned here..
> 
> > +	int ret;
> > +
> > +	if (!state->fb)
> > +		return 0;
> > +
> > +	for (i = 0; i < rstate->format->planes; ++i) {
> > +		struct drm_gem_cma_object *gem =
> > +			drm_fb_cma_get_gem_obj(state->fb, i);
> > +		struct sg_table *sgt = &rstate->sg_tables[i];
> > +
> > +		ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr, gem->paddr,
> > +				      gem->base.size);
> > +		if (ret)
> > +			goto fail;
> > +
> > +		ret = vsp1_du_map_sg(vsp->vsp, sgt);
> > +		if (!ret) {
> > +			sg_free_table(sgt);
> > +			ret = -ENOMEM;
> > +			goto fail;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +fail:
> > +	for (i--; i >= 0; i--) {
> 
> Means that this loop will never exit; i will always be >= 0;
> 
> I'd propose just making signed for this usage.
> 
> I've checked the i values for the breakouts - so they are good, and we need
> to use i == 0 to unmap the last table.
> 
> > +		struct sg_table *sgt = &rstate->sg_tables[i];

How about keep i unsigned and using

	for (; i > 0; i--) {
		struct sg_table *sgt = &rstate->sg_tables[i-1];
		...
	}

If you want to fix while applying, you can pick your favourite version.

> > +
> > +		vsp1_du_unmap_sg(vsp->vsp, sgt);
> > +		sg_free_table(sgt);
> > +	}
> > +
> > +	return ret;
> > +}

-- 
Regards,

Laurent Pinchart
