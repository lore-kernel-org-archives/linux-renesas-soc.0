Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34831 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754255AbcESLV0 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 19 May 2016 07:21:26 -0400
Received: by mail-lf0-f51.google.com with SMTP id e126so9254457lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 May 2016 04:21:25 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Thu, 19 May 2016 13:21:22 +0200
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: vinod.koul@intel.com, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, iommu@lists.linux-foundation.org,
	hch@infradead.org, linux-arch@vger.kernel.org,
	geert+renesas@glider.be, arnd@arndb.de, linus.walleij@linaro.org,
	laurent.pinchart@ideasonboard.com, dan.j.williams@intel.com
Subject: Re: [PATCHv6 2/8] dma-debug: add support for resource mappings
Message-ID: <20160519112122.GN29375@bigcity.dyn.berto.se>
References: <1462812247-3414-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
 <1462812247-3414-3-git-send-email-niklas.soderlund+renesas@ragnatech.se>
 <20160517145002.GD4074@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160517145002.GD4074@char.us.oracle.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Konrad,

Thanks for your feedback.

On 2016-05-17 10:50:02 -0400, Konrad Rzeszutek Wilk wrote:
> > +void debug_dma_map_resource(struct device *dev, phys_addr_t addr, size_t size,
> > +			    int direction, dma_addr_t dma_addr)
> > +{
> > +	struct dma_debug_entry *entry;
> > +
> > +	if (unlikely(dma_debug_disabled()))
> > +		return;
> > +
> > +	entry = dma_entry_alloc();
> > +	if (!entry)
> > +		return;
> > +
> > +	entry->type		= dma_debug_resource;
> > +	entry->dev		= dev;
> > +	entry->pfn		= __phys_to_pfn(addr);
> > +	entry->offset		= addr - PHYS_PFN(entry->pfn);
> 
> Is that right? 

You are correct that should be:

   entry->offset = addr - PFN_PHYS(entry->pfn);

Or even better:

   entry->offset = addr - __pfn_to_phys(entry->pfn);

I will address this and resend late next week, still hoping for some 
more feedback.

> 
> __phys_to_pfn(addr) is PHYS_PFN(addr), so what you get here is
> 
> addr - PHYS_PFN(PHYS_PFN(addr)) ?
> 
> 
> > +	entry->size		= size;
> > +	entry->dev_addr		= dma_addr;
> > +	entry->direction	= direction;
> > +	entry->map_err_type	= MAP_ERR_NOT_CHECKED;
> > +
> > +	add_dma_entry(entry);
> > +}
> > +EXPORT_SYMBOL(debug_dma_map_resource);
> > +

-- 
Regards,
Niklas S�derlund
