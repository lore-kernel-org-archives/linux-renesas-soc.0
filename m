Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46455 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbeKBT3h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 15:29:37 -0400
Received: by mail-lj1-f195.google.com with SMTP id x3-v6so1248350lji.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Nov 2018 03:22:57 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Fri, 2 Nov 2018 11:22:54 +0100
To: Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dma-mapping: fix return type of dma_set_max_seg_size()
Message-ID: <20181102102254.GF22306@bigcity.dyn.berto.se>
References: <20180829212921.10665-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180829212921.10665-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

A gentle ping on this patch.

On 2018-08-29 23:29:21 +0200, Niklas S�derlund wrote:
> The function dma_set_max_seg_size() can return either 0 on success or
> -EIO on error. Change its return type from unsigned int to int to
> capture this.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  include/linux/dma-mapping.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 1db6a6b46d0d3dbd..669cde2fa8723ac5 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -674,8 +674,7 @@ static inline unsigned int dma_get_max_seg_size(struct device *dev)
>  	return SZ_64K;
>  }
>  
> -static inline unsigned int dma_set_max_seg_size(struct device *dev,
> -						unsigned int size)
> +static inline int dma_set_max_seg_size(struct device *dev, unsigned int size)
>  {
>  	if (dev->dma_parms) {
>  		dev->dma_parms->max_segment_size = size;
> -- 
> 2.18.0
> 

-- 
Regards,
Niklas S�derlund
