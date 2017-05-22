Subject: Re: [PATCH v2 4/5] v4l: vsp1: Add API to map and unmap DRM buffers
 through the VSP
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20170516232007.20980-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170516232007.20980-5-laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham@ideasonboard.com
Message-ID: <4235cf14-60ac-6de0-2202-7893f8656edb@ideasonboard.com>
Date: Mon, 22 May 2017 12:52:37 +0100
MIME-Version: 1.0
In-Reply-To: <20170516232007.20980-5-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 17/05/17 00:20, Laurent Pinchart wrote:
> The display buffers must be mapped for DMA through the device that
> performs memory access. Expose an API to map and unmap memory through
> the VSP device to be used by the DU.
> 
> As all the buffers allocated by the DU driver are coherent, we can skip
> cache handling when mapping and unmapping them. This will need to be
> revisited when support for non-coherent buffers will be added to the DU
> driver.

Thankyou for the patch

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

With the small nitpick fixed:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/media/platform/vsp1/vsp1_drm.c | 25 +++++++++++++++++++++++++
>  include/media/vsp1.h                   |  3 +++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
> index 9d235e830f5a..c809c2aadca0 100644
> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> @@ -12,9 +12,11 @@
>   */
>  
>  #include <linux/device.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/slab.h>
>  
>  #include <media/media-entity.h>
> +#include <media/rcar-fcp.h>

This header isn't used here.
(Presumably it was before you cached the fcp dev as the vsp1->bus_master).

I'll fix this while applying locally. No need to resend.

>  #include <media/v4l2-subdev.h>
>  #include <media/vsp1.h>
>  
> @@ -524,6 +526,29 @@ void vsp1_du_atomic_flush(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(vsp1_du_atomic_flush);
>  
> +int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt)
> +{
> +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> +
> +	/*
> +	 * As all the buffers allocated by the DU driver are coherent, we can
> +	 * skip cache sync. This will need to be revisited when support for
> +	 * non-coherent buffers will be added to the DU driver.
> +	 */
> +	return dma_map_sg_attrs(vsp1->bus_master, sgt->sgl, sgt->nents,
> +				DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
> +}
> +EXPORT_SYMBOL_GPL(vsp1_du_map_sg);
> +
> +void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt)
> +{
> +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> +
> +	dma_unmap_sg_attrs(vsp1->bus_master, sgt->sgl, sgt->nents,
> +			   DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
> +}
> +EXPORT_SYMBOL_GPL(vsp1_du_unmap_sg);
> +
>  /* -----------------------------------------------------------------------------
>   * Initialization
>   */
> diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> index 38aac554dbba..6aa630c9f7af 100644
> --- a/include/media/vsp1.h
> +++ b/include/media/vsp1.h
> @@ -13,6 +13,7 @@
>  #ifndef __MEDIA_VSP1_H__
>  #define __MEDIA_VSP1_H__
>  
> +#include <linux/scatterlist.h>
>  #include <linux/types.h>
>  #include <linux/videodev2.h>
>  
> @@ -46,5 +47,7 @@ void vsp1_du_atomic_begin(struct device *dev);
>  int vsp1_du_atomic_update(struct device *dev, unsigned int rpf,
>  			  const struct vsp1_du_atomic_config *cfg);
>  void vsp1_du_atomic_flush(struct device *dev);
> +int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt);
> +void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt);
>  
>  #endif /* __MEDIA_VSP1_H__ */
> 
