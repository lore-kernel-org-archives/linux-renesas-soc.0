Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33175 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbeK0EBY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 23:01:24 -0500
Received: by mail-lj1-f195.google.com with SMTP id v1-v6so17347566ljd.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Nov 2018 09:06:40 -0800 (PST)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Mon, 26 Nov 2018 18:06:30 +0100
To: Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dma-mapping: fix return type of dma_set_max_seg_size()
Message-ID: <20181126170630.GA24837@bigcity.dyn.berto.se>
References: <20180829212921.10665-1-niklas.soderlund+renesas@ragnatech.se>
 <20181102102254.GF22306@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181102102254.GF22306@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-11-02 11:22:54 +0100, Niklas S�derlund wrote:
> Hi,
> 
> A gentle ping on this patch.

A slightly harder ping :-)

> 
> On 2018-08-29 23:29:21 +0200, Niklas S�derlund wrote:
> > The function dma_set_max_seg_size() can return either 0 on success or
> > -EIO on error. Change its return type from unsigned int to int to
> > capture this.
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  include/linux/dma-mapping.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> > index 1db6a6b46d0d3dbd..669cde2fa8723ac5 100644
> > --- a/include/linux/dma-mapping.h
> > +++ b/include/linux/dma-mapping.h
> > @@ -674,8 +674,7 @@ static inline unsigned int dma_get_max_seg_size(struct device *dev)
> >  	return SZ_64K;
> >  }
> >  
> > -static inline unsigned int dma_set_max_seg_size(struct device *dev,
> > -						unsigned int size)
> > +static inline int dma_set_max_seg_size(struct device *dev, unsigned int size)
> >  {
> >  	if (dev->dma_parms) {
> >  		dev->dma_parms->max_segment_size = size;
> > -- 
> > 2.18.0
> > 
> 
> -- 
> Regards,
> Niklas S�derlund

-- 
Regards,
Niklas S�derlund
