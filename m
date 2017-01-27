Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Joerg Roedel <joro@8bytes.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] iommu/dma: Add support for DMA_ATTR_FORCE_CONTIGUOUS
Date: Fri, 27 Jan 2017 16:34:17 +0100
Message-Id: <1485531259-17513-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

Tis patch series adds helpers for DMA_ATTR_FORCE_CONTIGUOUS to the
generic IOMMU DMA code, and support for allocating physically contiguous
DMA buffers on arm64 systems with an IOMMU.  This can be useful when two
or more devices with different memory requirements are involved in
buffer sharing.

Changes compared to v1:
  - Provide standalone iommu_dma_{alloc,free}_contiguous() functions, as
    requested by Robin Murphy,
  - Handle dispatching in the arch (arm64) code, as requested by Robin
    Murphy,
  - Simplify operations by getting rid of the page array/scatterlist
    dance, as the buffer is contiguous,
  - Move CPU cache magement into the caller, which is much simpler with
    a single contiguous buffer.

Thanks for your comments!

Geert Uytterhoeven (2):
  iommu/dma: Add support for DMA_ATTR_FORCE_CONTIGUOUS
  arm64: Add support for DMA_ATTR_FORCE_CONTIGUOUS to IOMMU

 arch/arm64/mm/dma-mapping.c | 51 +++++++++++++++++++++++---------
 drivers/iommu/dma-iommu.c   | 72 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/dma-iommu.h   |  4 +++
 3 files changed, 113 insertions(+), 14 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
