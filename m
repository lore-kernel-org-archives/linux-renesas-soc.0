Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:55068 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757582AbdCUPrR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2017 11:47:17 -0400
Date: Tue, 21 Mar 2017 15:45:26 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <jroedel@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v5] arm64: Add support for DMA_ATTR_FORCE_CONTIGUOUS to
 IOMMU
Message-ID: <20170321154526.GA21829@e104818-lin.cambridge.arm.com>
References: <1488908612-22522-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1488908612-22522-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 07, 2017 at 06:43:32PM +0100, Geert Uytterhoeven wrote:
> Add support for allocating physically contiguous DMA buffers on arm64
> systems with an IOMMU.  This can be useful when two or more devices
> with different memory requirements are involved in buffer sharing.
> 
> Note that as this uses the CMA allocator, setting the
> DMA_ATTR_FORCE_CONTIGUOUS attribute has a runtime-dependency on
> CONFIG_DMA_CMA, just like on arm32.
> 
> For arm64 systems using swiotlb, no changes are needed to support the
> allocation of physically contiguous DMA buffers:
>   - swiotlb always uses physically contiguous buffers (up to
>     IO_TLB_SEGSIZE = 128 pages),
>   - arm64's __dma_alloc_coherent() already calls
>     dma_alloc_from_contiguous() when CMA is available.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Queued for 4.12. Thanks.

-- 
Catalin
