Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	vinod.koul@intel.com, linus.walleij@linaro.org,
	geert+renesas@glider.be, dan.j.williams@intel.com,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/5] dma-mapping: add dma_{map,unmap}_page_attrs
Date: Sun, 24 Jan 2016 22:43:57 +0200
Message-ID: <1989275.WS6Og0GPnT@avalon>
In-Reply-To: <1453384895-20395-2-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1453384895-20395-1-git-send-email-niklas.soderlund+renesas@ragnatech.se> <1453384895-20395-2-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

(CC'ing LKML, linux-arch and Arnd Bergmann)

Thank you for the patch.

On Thursday 21 January 2016 15:01:31 Niklas S�derlund wrote:
> Add a version of dmap_{map,unmap}_page that can pass on attributes to
> the underlaying map_page. This already exists for dma_{map,unmap}_single
> and dmap_{map,unmap}_sg versions.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/asm-generic/dma-mapping-common.h | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/include/asm-generic/dma-mapping-common.h
> b/include/asm-generic/dma-mapping-common.h index b1bc954..bb08302 100644
> --- a/include/asm-generic/dma-mapping-common.h
> +++ b/include/asm-generic/dma-mapping-common.h
> @@ -74,29 +74,33 @@ static inline void dma_unmap_sg_attrs(struct device
> *dev, struct scatterlist *sg ops->unmap_sg(dev, sg, nents, dir, attrs);
>  }
> 
> -static inline dma_addr_t dma_map_page(struct device *dev, struct page
> *page, -				      size_t offset, size_t size,
> -				      enum dma_data_direction dir)
> +static inline dma_addr_t dma_map_page_attrs(struct device *dev,
> +					    struct page *page,
> +					    size_t offset, size_t size,
> +					    enum dma_data_direction dir,
> +					    struct dma_attrs *attrs)
>  {
>  	struct dma_map_ops *ops = get_dma_ops(dev);
>  	dma_addr_t addr;
> 
>  	kmemcheck_mark_initialized(page_address(page) + offset, size);
>  	BUG_ON(!valid_dma_direction(dir));
> -	addr = ops->map_page(dev, page, offset, size, dir, NULL);
> +	addr = ops->map_page(dev, page, offset, size, dir, attrs);
>  	debug_dma_map_page(dev, page, offset, size, dir, addr, false);
> 
>  	return addr;
>  }
> 
> -static inline void dma_unmap_page(struct device *dev, dma_addr_t addr,
> -				  size_t size, enum dma_data_direction dir)
> +static inline void dma_unmap_page_attrs(struct device *dev, dma_addr_t
> addr, +					size_t size,
> +					enum dma_data_direction dir,
> +					struct dma_attrs *attrs)
>  {
>  	struct dma_map_ops *ops = get_dma_ops(dev);
> 
>  	BUG_ON(!valid_dma_direction(dir));
>  	if (ops->unmap_page)
> -		ops->unmap_page(dev, addr, size, dir, NULL);
> +		ops->unmap_page(dev, addr, size, dir, attrs);
>  	debug_dma_unmap_page(dev, addr, size, dir, false);
>  }
> 
> @@ -181,6 +185,8 @@ dma_sync_sg_for_device(struct device *dev, struct
> scatterlist *sg, #define dma_unmap_single(d, a, s, r)
> dma_unmap_single_attrs(d, a, s, r, NULL) #define dma_map_sg(d, s, n, r)
> dma_map_sg_attrs(d, s, n, r, NULL) #define dma_unmap_sg(d, s, n, r)
> dma_unmap_sg_attrs(d, s, n, r, NULL) +#define dma_map_page(d, p, o, s, r)
> dma_map_page_attrs(d, p, o, s, r, NULL) +#define dma_unmap_page(d, a, s, r)
> dma_unmap_page_attrs(d, a, s, r, NULL)
> 
>  extern int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
>  			   void *cpu_addr, dma_addr_t dma_addr, size_t size);

-- 
Regards,

Laurent Pinchart
