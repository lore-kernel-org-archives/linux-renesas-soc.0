Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Arnd Bergmann <arnd@linaro.org>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>, linux-pci@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        artemi.ivanov@cogentembedded.com,
        Keith Busch <keith.busch@intel.com>, Jens Axboe <axboe@fb.com>,
        linux-nvme@lists.infradead.org
Subject: Re: NVMe vs DMA addressing limitations
Date: Thu, 12 Jan 2017 12:56:07 +0100
Message-ID: <3306663.hKmLLq1hhl@wuerfel>
In-Reply-To: <80676b35-121b-0462-23fc-ed5608e1e671@grimberg.me>
References: <1483044304-2085-1-git-send-email-nikita.yoush@cogentembedded.com> <20170110144839.GB27156@lst.de> <80676b35-121b-0462-23fc-ed5608e1e671@grimberg.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thursday, January 12, 2017 12:09:11 PM CET Sagi Grimberg wrote:
> >> Another workaround me might need is to limit amount of concurrent DMA
> >> in the NVMe driver based on some platform quirk. The way that NVMe works,
> >> it can have very large amounts of data that is concurrently mapped into
> >> the device.
> >
> > That's not really just NVMe - other storage and network controllers also
> > can DMA map giant amounts of memory.  There are a couple aspects to it:
> >
> >  - dma coherent memoery - right now NVMe doesn't use too much of it,
> >    but upcoming low-end NVMe controllers will soon start to require
> >    fairl large amounts of it for the host memory buffer feature that
> >    allows for DRAM-less controller designs.  As an interesting quirk
> >    that is memory only used by the PCIe devices, and never accessed
> >    by the Linux host at all.
> 
> Would it make sense to convert the nvme driver to use normal allocations
> and use the DMA streaming APIs (dma_sync_single_for_[cpu|device]) for
> both queues and future HMB?

That is an interesting question: We actually have the
"DMA_ATTR_NO_KERNEL_MAPPING" for this case, and ARM implements
it in the coherent interface, so that might be a good fit.

Implementing it in the streaming API makes no sense since we
already have a kernel mapping here, but using a normal allocation
(possibly with DMA_ATTR_NON_CONSISTENT or DMA_ATTR_SKIP_CPU_SYNC,
need to check) might help on other architectures that have
limited amounts of coherent memory and no CMA.

Another benefit of the coherent API for this kind of buffer is
that we can use CMA where available to get a large consecutive
chunk of RAM on architectures without an IOMMU when normal
memory is no longer available because of fragmentation.

	Arnd
