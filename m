Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 10 Jan 2017 15:57:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Will Deacon <will.deacon@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        artemi.ivanov@cogentembedded.com, fkan@apm.com,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] arm64: do not set dma masks that device connection
        can't handle
Message-ID: <20170110145716.GD27156@lst.de>
References: <1483947002-16410-1-git-send-email-nikita.yoush@cogentembedded.com> <20170110115132.GD21598@arm.com> <07253eaa-5729-0f15-42b6-e8403f1f0412@cogentembedded.com> <11daacde-5399-039f-80a3-01d7bd13e9e8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11daacde-5399-039f-80a3-01d7bd13e9e8@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 10, 2017 at 01:25:12PM +0000, Robin Murphy wrote:
> We still need a way for drivers to communicate a device's probed
> addressing capability to SWIOTLB, so there's always going to have to be
> *some* sort of public interface. Personally, the change in semantics I'd
> like to see is to make dma_set_mask() only fail if DMA is entirely
> disallowed - in the normal case it would always succeed, but the DMA API
> implementation would be permitted to set a smaller mask than requested
> (this is effectively what the x86 IOMMU ops do already).

Yes, this sounds reasonable.

> The significant
> work that would require, though, is changing all the drivers currently
> using this sort of pattern:
> 
> 	if (!dma_set_mask(dev, DMA_BIT_MASK(64))
> 		/* put device into 64-bit mode */
> 	else if (!dma_set_mask(dev, DMA_BIT_MASK(32))
> 		/* put device into 32-bit mode */
> 	else
> 		/* error */

While we have this pattern in a lot of places it's already rather
pointless on most architectures as the first dma_set_mask call
won't ever fail for the most common dma_ops implementations.

> to something like this:
> 
> 	if (!dma_set_mask(dev, DMA_BIT_MASK(64))
> 		/* error */
> 	if (dma_get_mask(dev) > DMA_BIT_MASK(32))
> 		/* put device into 64-bit mode */
> 	else
> 		/* put device into 32-bit mode */
> 
> Which would be a pretty major job.

I don't think it's too bad.  Also for many modern devices there is no
need to put the device into a specific mode.  It's mostly a historic
issue from the PCI/PCI-X days with the less efficient DAC addressing
scheme.
