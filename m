Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from leibniz.telenet-ops.be ([195.130.137.77]:55522 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751605AbdAaLOB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jan 2017 06:14:01 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 3vCNtY1l0MzMqwpf
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Jan 2017 12:13:57 +0100 (CET)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] arm64: Add support for DMA_ATTR_FORCE_CONTIGUOUS to IOMMU
Date: Tue, 31 Jan 2017 12:12:58 +0100
Message-Id: <1485861178-22694-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for allocating physically contiguous DMA buffers on arm64
systems with an IOMMU.  This can be useful when two or more devices
with different memory requirements are involved in buffer sharing.

Note that as this uses the CMA allocator, setting the
DMA_ATTR_FORCE_CONTIGUOUS attribute has a runtime-dependency on
CONFIG_DMA_CMA, just like on arm32.

For arm64 systems using swiotlb, no changes are needed to support the
allocation of physically contiguous DMA buffers:
  - swiotlb always uses physically contiguous buffers (up to
    IO_TLB_SEGSIZE = 128 pages),
  - arm64's __dma_alloc_coherent() already calls
    dma_alloc_from_contiguous() when CMA is available.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v3:
  - Add Acked-by,
  - Update comment to "one of _4_ things",
  - Call dma_alloc_from_contiguous() and iommu_dma_map_page() directly,
    as suggested by Robin Murphy,

v2:
  - New, handle dispatching in the arch (arm64) code, as requested by
    Robin Murphy.
---
 arch/arm64/mm/dma-mapping.c | 63 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 1d7d5d2881db7c19..b314256fcee028ce 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -577,20 +577,7 @@ static void *__iommu_alloc_attrs(struct device *dev, size_t size,
 	 */
 	gfp |= __GFP_ZERO;
 
-	if (gfpflags_allow_blocking(gfp)) {
-		struct page **pages;
-		pgprot_t prot = __get_dma_pgprot(attrs, PAGE_KERNEL, coherent);
-
-		pages = iommu_dma_alloc(dev, iosize, gfp, attrs, ioprot,
-					handle, flush_page);
-		if (!pages)
-			return NULL;
-
-		addr = dma_common_pages_remap(pages, size, VM_USERMAP, prot,
-					      __builtin_return_address(0));
-		if (!addr)
-			iommu_dma_free(dev, pages, iosize, handle);
-	} else {
+	if (!gfpflags_allow_blocking(gfp)) {
 		struct page *page;
 		/*
 		 * In atomic context we can't remap anything, so we'll only
@@ -614,6 +601,45 @@ static void *__iommu_alloc_attrs(struct device *dev, size_t size,
 				__free_from_pool(addr, size);
 			addr = NULL;
 		}
+	} else if (attrs & DMA_ATTR_FORCE_CONTIGUOUS) {
+		pgprot_t prot = __get_dma_pgprot(attrs, PAGE_KERNEL, coherent);
+		struct page *page;
+
+		page = dma_alloc_from_contiguous(dev, size >> PAGE_SHIFT,
+						 get_order(size));
+		if (!page)
+			return NULL;
+
+		*handle = iommu_dma_map_page(dev, page, 0, iosize, ioprot);
+		if (iommu_dma_mapping_error(dev, *handle)) {
+			dma_release_from_contiguous(dev, page,
+						    size >> PAGE_SHIFT);
+			return NULL;
+		}
+		if (!coherent)
+			__dma_flush_area(page_to_virt(page), iosize);
+
+		addr = dma_common_contiguous_remap(page, size, VM_USERMAP,
+						   prot,
+						   __builtin_return_address(0));
+		if (!addr) {
+			iommu_dma_unmap_page(dev, *handle, iosize, 0, attrs);
+			dma_release_from_contiguous(dev, page,
+						    size >> PAGE_SHIFT);
+		}
+	} else {
+		pgprot_t prot = __get_dma_pgprot(attrs, PAGE_KERNEL, coherent);
+		struct page **pages;
+
+		pages = iommu_dma_alloc(dev, iosize, gfp, attrs, ioprot,
+					handle, flush_page);
+		if (!pages)
+			return NULL;
+
+		addr = dma_common_pages_remap(pages, size, VM_USERMAP, prot,
+					      __builtin_return_address(0));
+		if (!addr)
+			iommu_dma_free(dev, pages, iosize, handle);
 	}
 	return addr;
 }
@@ -625,7 +651,8 @@ static void __iommu_free_attrs(struct device *dev, size_t size, void *cpu_addr,
 
 	size = PAGE_ALIGN(size);
 	/*
-	 * @cpu_addr will be one of 3 things depending on how it was allocated:
+	 * @cpu_addr will be one of 4 things depending on how it was allocated:
+	 * - A remapped array of pages for contiguous allocations.
 	 * - A remapped array of pages from iommu_dma_alloc(), for all
 	 *   non-atomic allocations.
 	 * - A non-cacheable alias from the atomic pool, for atomic
@@ -637,6 +664,12 @@ static void __iommu_free_attrs(struct device *dev, size_t size, void *cpu_addr,
 	if (__in_atomic_pool(cpu_addr, size)) {
 		iommu_dma_unmap_page(dev, handle, iosize, 0, 0);
 		__free_from_pool(cpu_addr, size);
+	} else if (attrs & DMA_ATTR_FORCE_CONTIGUOUS) {
+		struct page *page = phys_to_page(dma_to_phys(dev, handle));
+
+		iommu_dma_unmap_page(dev, handle, iosize, 0, attrs);
+		dma_release_from_contiguous(dev, page, size >> PAGE_SHIFT);
+		dma_common_free_remap(cpu_addr, size, VM_USERMAP);
 	} else if (is_vmalloc_addr(cpu_addr)){
 		struct vm_struct *area = find_vm_area(cpu_addr);
 
-- 
1.9.1
