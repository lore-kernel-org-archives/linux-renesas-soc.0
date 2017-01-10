Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Arnd Bergmann <arnd@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Christoph Hellwig <hch@lst.de>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Keith Busch <keith.busch@intel.com>,
        Sagi Grimberg <sagi@grimberg.me>, Jens Axboe <axboe@fb.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>, linux-pci@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        artemi.ivanov@cogentembedded.com
Subject: Re: [PATCH 1/2] arm64: dma_mapping: allow PCI host driver to limit DMA mask
Date: Tue, 10 Jan 2017 16:00:47 +0100
Message-ID: <7276604.Zo5Nlf9pQ3@wuerfel>
In-Reply-To: <20170110144453.GA27156@lst.de>
References: <1483044304-2085-1-git-send-email-nikita.yoush@cogentembedded.com> <1988852.3nyUoruEjG@wuerfel> <20170110144453.GA27156@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tuesday, January 10, 2017 3:44:53 PM CET Christoph Hellwig wrote:
> On Tue, Jan 10, 2017 at 11:47:42AM +0100, Arnd Bergmann wrote:
> > I see that we have CONFIG_ARCH_PHYS_ADDR_T_64BIT on a couple of
> > 32-bit architectures without swiotlb (arc, arm, some mips32), and
> > there are several 64-bit architectures that do not have swiotlb
> > (alpha, parisc, s390, sparc). I believe that alpha, s390 and sparc
> > always use some form of IOMMU, but the other four apparently don't,
> > so we would need to add swiotlb support there to remove all the
> > bounce buffering in network and block layers.
> 
> mips has lots of weird swiotlb wire-up in it's board code (the swiotlb
> arch glue really needs some major cleanup..),

My reading of the MIPS code was that only the 64-bit platforms use it,
but there are a number of 32-bit platforms that have 64-bit physical
addresses and don't.

> as does arm.  Not sure about the others.

32-bit ARM doesn't actually use SWIOTLB at all, despite selecting it
in Kconfig. I think Xen uses it for its own purposes, but nothing
else does.

Most ARM platforms can't actually have RAM beyond 4GB, and the ones
that do have it tend to also come with an IOMMU, but I remember
at least BCM53xx actually needing swiotlb on some chip revisions
that are widely used and that cannot DMA to the second memory bank
from PCI (!).

	Arnd
