Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:34886 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161050AbcFBM6K (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 2 Jun 2016 08:58:10 -0400
Received: by mail-lf0-f50.google.com with SMTP id w16so33338937lfd.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jun 2016 05:58:09 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Thu, 2 Jun 2016 14:58:07 +0200
To: Vinod Koul <vinod.koul@intel.com>
Cc: hch@infradead.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	iommu@lists.linux-foundation.org, dan.j.williams@intel.com,
	robin.murphy@arm.com, laurent.pinchart@ideasonboard.com,
	linus.walleij@linaro.org, arnd@arndb.de
Subject: Re: [PATCHv7 0/6] dmaengine: rcar-dmac: add iommu support for slave
 transfers
Message-ID: <20160602125807.GN8307@bigcity.dyn.berto.se>
References: <1464794549-6601-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
 <20160601180610.GV16910@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160601180610.GV16910@localhost>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vinod,

On 2016-06-01 23:36:11 +0530, Vinod Koul wrote:
> On Wed, Jun 01, 2016 at 05:22:23PM +0200, Niklas S�derlund wrote:
> > Hi,
> > 
> > [In this v7 series I have tried to address the questions raised by Christoph 
> > Hellwig and I hope it can awnser your concernes regarding dma-debug.]
> > 
> > This series tries to solve the problem with DMA with device registers
> > (MMIO registers) that are behind an IOMMU for the rcar-dmac driver. A
> > recent patch '9575632 (dmaengine: make slave address physical)'
> > clarifies that DMA slave address provided by clients is the physical
> > address. This puts the task of mapping the DMA slave address from a
> > phys_addr_t to a dma_addr_t on the DMA engine.
> > 
> > Without an IOMMU this is easy since the phys_addr_t and dma_addr_t are
> > the same and no special care is needed. However if you have a IOMMU you
> > need to map the DMA slave phys_addr_t to a dma_addr_t using something
> > like this.
> > 
> > This series is based on top of v4.7-rc1.
> 
> The dmanegine bits looks okay to me. Btw how is the merge planned for this?
> Do you wnat this to be merged thru dmaengine tree or something else?

Yes, since the arm specific patch are depending on other parts of the 
series I was hoping to be able to get Russells Ack on it and then try to 
get it all in through the dmaengine tree.

If you see a better way I'm happy to do it that way, let me know what 
you think. I hold off v8 that adresses the issues Russell brought up a 
few days untill I know what you think is best.

-- 
Regards,
Niklas S�derlund
