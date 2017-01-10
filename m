Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 10 Jan 2017 15:44:53 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@linaro.org>
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
        Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dma_mapping: allow PCI host driver to limit
        DMA mask
Message-ID: <20170110144453.GA27156@lst.de>
References: <1483044304-2085-1-git-send-email-nikita.yoush@cogentembedded.com> <b50e25af-3936-d22d-2e9b-5bf6be19c800@cogentembedded.com> <20170109205746.GA6274@lst.de> <1988852.3nyUoruEjG@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1988852.3nyUoruEjG@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 10, 2017 at 11:47:42AM +0100, Arnd Bergmann wrote:
> I see that we have CONFIG_ARCH_PHYS_ADDR_T_64BIT on a couple of
> 32-bit architectures without swiotlb (arc, arm, some mips32), and
> there are several 64-bit architectures that do not have swiotlb
> (alpha, parisc, s390, sparc). I believe that alpha, s390 and sparc
> always use some form of IOMMU, but the other four apparently don't,
> so we would need to add swiotlb support there to remove all the
> bounce buffering in network and block layers.

mips has lots of weird swiotlb wire-up in it's board code (the swiotlb
arch glue really needs some major cleanup..), as does arm.  Not
sure about the others.

Getting rid of highmem bouncing in the block layer will take some time
as various PIO-only drivers rely on it at the moment.  These should
all be convertable to kmap that data, but it needs a careful audit
first.  For 4.11 I'll plan to switch away from bouncing highmem by
default at least, though and maybe also convert a few PIO drivers.
