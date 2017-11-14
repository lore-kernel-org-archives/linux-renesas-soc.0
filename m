Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:47864 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750806AbdKNDeG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 22:34:06 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH/RFC 2/2] drm: rcar-du: Allow importing non-contiguous dma-buf with VSP
Date: Tue, 14 Nov 2017 05:34:14 +0200
Message-ID: <1687766.IjFbpRoOl0@avalon>
In-Reply-To: <20171113115314.GB26389@e110455-lin.cambridge.arm.com>
References: <20171113103228.23312-1-laurent.pinchart+renesas@ideasonboard.com> <20171113103228.23312-3-laurent.pinchart+renesas@ideasonboard.com> <20171113115314.GB26389@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Liviu,

On Monday, 13 November 2017 13:53:14 EET Liviu Dudau wrote:
> On Mon, Nov 13, 2017 at 12:32:28PM +0200, Laurent Pinchart wrote:
> > When the DU sources its frames from a VSP, it performs no memory access
> > and thus has no requirements on imported dma-buf memory types. In
> > particular the DU could import a physically non-contiguous buffer that
> > would later be mapped contiguously through the VSP IOMMU.
> > 
> > This use case isn't supported at the moment as the GEM CMA helpers will
> > reject any non-contiguous buffer, and the DU isn't connected to an IOMMU
> > that can make the buffer contiguous for DMA. Fix this by implementing a
> > custom .gem_prime_import_sg_table() operation that accepts all imported
> > dma-buf regardless of the number of scatterlist entries.
> 
> This patch raises the question of why use CMA at all if you can accept
> any kind of buffers.

Both the DU and VSP require DMA contiguous memory. On R-Car Gen2 the DU 
performs DMA, and thus uses the GEM CMA helpers. On Gen3 it delegates DMA to 
the external VSP composer, and still uses the GEM CMA helpers to ensure that 
memory will be DMA contiguous for the VSP. The problem arises when physically 
non-contiguous dma-buf buffers are imported, they can be mapped contiguously 
to the VSP (assuming an IOMMU is present) but not to the DU (as there's no 
IOMMU).

The situation is particularly messy due to the fact that I have one VSP 
instance per CRTC, each connected to its own IOMMU channel. The driver thus 
doesn't know when allocating GEM objects to which struct device they need to 
be mapped. The DRM helpers don't support delayed mapping of memory. I'd like 
to know whether that's something I should fix properly (which would likely 
involve major reworking of the helpers) or hack around it in the DU driver.

> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c |  2 +-
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 39 ++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.h |  7 +++++++
> >  3 files changed, 47 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 48c166f925a3..d999231f98c7
> > 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -289,7 +289,7 @@ static struct drm_driver rcar_du_driver = {
> >  	.gem_prime_import	= drm_gem_prime_import,
> >  	.gem_prime_export	= drm_gem_prime_export,
> >  	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
> > -	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> > +	.gem_prime_import_sg_table = rcar_du_gem_prime_import_sg_table,
> >  	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
> >  	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
> >  	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_kms.c index 566d1a948c8f..2dd0c2ba047d
> > 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c

[snip]

> > +struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct
> > drm_device *dev,
> > +				struct dma_buf_attachment *attach,
> > +				struct sg_table *sgt)
> > +{
> > +	struct rcar_du_device *rcdu = dev->dev_private;
> > +	struct drm_gem_cma_object *cma_obj;
> > +	struct drm_gem_object *gem_obj;
> > +	int ret;
> > +
> > +	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
> > +		return drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
> > +
> > +	/* Create a CMA GEM buffer. */
> > +	cma_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
> > +	if (!cma_obj)
> > +		return ERR_PTR(-ENOMEM);
> > +	gem_obj = &cma_obj->base;
> > +
> > +	ret = drm_gem_object_init(dev, gem_obj, attach->dmabuf->size);
> > +	if (ret)
> > +		goto error;
> > +
> > +	ret = drm_gem_create_mmap_offset(gem_obj);
> > +	if (ret) {
> > +		drm_gem_object_release(gem_obj);
> > +		goto error;
> > +	}
> > +
> > +	cma_obj->paddr = 0;
> 
> This is going to break drm_gem_cma_describe() if you are using it

As far as I can tell drm_gem_cma_describe() will just print paddr = 0, it 
won't crash.

> plus the rcar_du_plane_setup_scanout() unless I'm missing something besides
> familiarity with the RCAR driver code :)

rcar_du_plane_setup_scanout() is only called when !rcar_du_has(rcdu, 
RCAR_DU_FEATURE_VSP1_SOURCE) (that is on Gen3 hardware, or on Gen2 when I 
artificially disable all DMA from the DU and use external composers to emulate 
Gen3 behaviour for testing purpose), in which case this function calls 
drm_gem_cma_prime_import_sg_table().

> This function looks very similar to what I tried to do for mali-dp to
> allow the import of contiguous DMA buffers that have more than 1 sgt
> entries. In the end I gave up as I kept finding issues and went for the
> drm_gem_cma_prime_import_sg_table() changes. Maybe you need to do a
> similar change in the function to bypass some requirements if the driver
> signals that it can accept relaxed requirements?

As explained above I've considered reworking the helpers (to do it properly I 
think I'll likely need to rework drm_prime.c too), but I'd first like to know 
whether there's an interest for that.

> > +	cma_obj->sgt = sgt;
> > +
> > +	return gem_obj;
> > +
> > +error:
> > +	kfree(cma_obj);
> > +	return ERR_PTR(ret);
> > +}

[snip]

-- 
Regards,

Laurent Pinchart
