Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34686 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751139AbcHWPg6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2016 11:36:58 -0400
Received: by mail-lf0-f53.google.com with SMTP id l89so103686334lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2016 08:36:57 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Tue, 23 Aug 2016 17:31:36 +0200
To: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux@armlinux.org.uk
Cc: hch@infradead.org, dan.j.williams@intel.com, vinod.koul@intel.com,
        robin.murphy@arm.com, laurent.pinchart@ideasonboard.com,
        linus.walleij@linaro.org, arnd@arndb.de
Subject: Re: [PATCHv9 4/6] arm: dma-mapping: add {map,unmap}_resource for
 iommu ops
Message-ID: <20160823153136.GH2951@bigcity.dyn.berto.se>
References: <20160810112219.17964-1-niklas.soderlund+renesas@ragnatech.se>
 <20160810112219.17964-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160810112219.17964-5-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Russell,

If you have the time can you please have a look at this patch? This 
series have been out for some time now and Vinod is willing to take it 
through the dmaengine tree but a ACK is needed on this patch from you 
first.

On 2016-08-10 13:22:17 +0200, Niklas S�derlund wrote:
> Add methods to map/unmap device resources addresses for dma_map_ops that
> are IOMMU aware. This is needed to map a device MMIO register from a
> physical address.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/mm/dma-mapping.c | 63 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index c6834c0..746eb29 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -2014,6 +2014,63 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
>  	__free_iova(mapping, iova, len);
>  }
>  
> +/**
> + * arm_iommu_map_resource - map a device resource for DMA
> + * @dev: valid struct device pointer
> + * @phys_addr: physical address of resource
> + * @size: size of resource to map
> + * @dir: DMA transfer direction
> + */
> +static dma_addr_t arm_iommu_map_resource(struct device *dev,
> +		phys_addr_t phys_addr, size_t size,
> +		enum dma_data_direction dir, unsigned long attrs)
> +{
> +	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
> +	dma_addr_t dma_addr;
> +	int ret, prot;
> +	phys_addr_t addr = phys_addr & PAGE_MASK;
> +	unsigned int offset = phys_addr & ~PAGE_MASK;
> +	size_t len = PAGE_ALIGN(size + offset);
> +
> +	dma_addr = __alloc_iova(mapping, len);
> +	if (dma_addr == DMA_ERROR_CODE)
> +		return dma_addr;
> +
> +	prot = __dma_direction_to_prot(dir) | IOMMU_MMIO;
> +
> +	ret = iommu_map(mapping->domain, dma_addr, addr, len, prot);
> +	if (ret < 0)
> +		goto fail;
> +
> +	return dma_addr + offset;
> +fail:
> +	__free_iova(mapping, dma_addr, len);
> +	return DMA_ERROR_CODE;
> +}
> +
> +/**
> + * arm_iommu_unmap_resource - unmap a device DMA resource
> + * @dev: valid struct device pointer
> + * @dma_handle: DMA address to resource
> + * @size: size of resource to map
> + * @dir: DMA transfer direction
> + */
> +static void arm_iommu_unmap_resource(struct device *dev, dma_addr_t dma_handle,
> +		size_t size, enum dma_data_direction dir,
> +		unsigned long attrs)
> +{
> +	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
> +	dma_addr_t iova = dma_handle & PAGE_MASK;
> +	unsigned int offset = dma_handle & ~PAGE_MASK;
> +	size_t len = PAGE_ALIGN(size + offset);
> +
> +	if (!iova)
> +		return;
> +
> +	iommu_unmap(mapping->domain, iova, len);
> +	__free_iova(mapping, iova, len);
> +}
> +
>  static void arm_iommu_sync_single_for_cpu(struct device *dev,
>  		dma_addr_t handle, size_t size, enum dma_data_direction dir)
>  {
> @@ -2057,6 +2114,9 @@ struct dma_map_ops iommu_ops = {
>  	.unmap_sg		= arm_iommu_unmap_sg,
>  	.sync_sg_for_cpu	= arm_iommu_sync_sg_for_cpu,
>  	.sync_sg_for_device	= arm_iommu_sync_sg_for_device,
> +
> +	.map_resource		= arm_iommu_map_resource,
> +	.unmap_resource		= arm_iommu_unmap_resource,
>  };
>  
>  struct dma_map_ops iommu_coherent_ops = {
> @@ -2070,6 +2130,9 @@ struct dma_map_ops iommu_coherent_ops = {
>  
>  	.map_sg		= arm_coherent_iommu_map_sg,
>  	.unmap_sg	= arm_coherent_iommu_unmap_sg,
> +
> +	.map_resource	= arm_iommu_map_resource,
> +	.unmap_resource	= arm_iommu_unmap_resource,
>  };
>  
>  /**
> -- 
> 2.9.2
> 

-- 
Regards,
Niklas S�derlund
