Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        David Vrabel <david.vrabel@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/3] swiotlb: Convert swiotlb_force from int to enum
Date: Fri, 16 Dec 2016 14:28:41 +0100
Message-Id: <1481894922-28828-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1481894922-28828-1-git-send-email-geert+renesas@glider.be>
References: <1481894922-28828-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Convert the flag swiotlb_force from an int to an enum, to prepare for
the advent of more possible values.

Suggested-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/arm64/mm/dma-mapping.c    |  3 ++-
 arch/arm64/mm/init.c           |  3 ++-
 arch/x86/kernel/pci-swiotlb.c  |  2 +-
 arch/x86/xen/pci-swiotlb-xen.c |  2 +-
 drivers/xen/swiotlb-xen.c      |  4 ++--
 include/linux/swiotlb.h        |  7 ++++++-
 include/trace/events/swiotlb.h | 16 +++++++++-------
 lib/swiotlb.c                  |  8 ++++----
 8 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 290a84f3351f706b..e04082700bb16c35 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -524,7 +524,8 @@ struct dma_map_ops dummy_dma_ops = {
 
 static int __init arm64_dma_init(void)
 {
-	if (swiotlb_force || max_pfn > (arm64_dma_phys_limit >> PAGE_SHIFT))
+	if (swiotlb_force == SWIOTLB_FORCE ||
+	    max_pfn > (arm64_dma_phys_limit >> PAGE_SHIFT))
 		swiotlb = 1;
 
 	return atomic_pool_init();
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 212c4d1e2f26df7f..716d1226ba6925ba 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -401,7 +401,8 @@ static void __init free_unused_memmap(void)
  */
 void __init mem_init(void)
 {
-	if (swiotlb_force || max_pfn > (arm64_dma_phys_limit >> PAGE_SHIFT))
+	if (swiotlb_force == SWIOTLB_FORCE ||
+	    max_pfn > (arm64_dma_phys_limit >> PAGE_SHIFT))
 		swiotlb_init(1);
 
 	set_max_mapnr(pfn_to_page(max_pfn) - mem_map);
diff --git a/arch/x86/kernel/pci-swiotlb.c b/arch/x86/kernel/pci-swiotlb.c
index 36049af2715ebd13..410efb2c7b80028b 100644
--- a/arch/x86/kernel/pci-swiotlb.c
+++ b/arch/x86/kernel/pci-swiotlb.c
@@ -68,7 +68,7 @@ void x86_swiotlb_free_coherent(struct device *dev, size_t size,
  */
 int __init pci_swiotlb_detect_override(void)
 {
-	if (swiotlb_force)
+	if (swiotlb_force == SWIOTLB_FORCE)
 		swiotlb = 1;
 
 	return swiotlb;
diff --git a/arch/x86/xen/pci-swiotlb-xen.c b/arch/x86/xen/pci-swiotlb-xen.c
index a9fafb5c873897ee..a0b36a9d5df149e6 100644
--- a/arch/x86/xen/pci-swiotlb-xen.c
+++ b/arch/x86/xen/pci-swiotlb-xen.c
@@ -48,7 +48,7 @@ int __init pci_xen_swiotlb_detect(void)
 	 * activate this IOMMU. If running as PV privileged, activate it
 	 * irregardless.
 	 */
-	if ((xen_initial_domain() || swiotlb || swiotlb_force))
+	if (xen_initial_domain() || swiotlb || swiotlb_force == SWIOTLB_FORCE)
 		xen_swiotlb = 1;
 
 	/* If we are running under Xen, we MUST disable the native SWIOTLB.
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 478fb91e3df2b8a9..aba12009422e343d 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -392,7 +392,7 @@ dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 	if (dma_capable(dev, dev_addr, size) &&
 	    !range_straddles_page_boundary(phys, size) &&
 		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
-		!swiotlb_force) {
+		(swiotlb_force != SWIOTLB_FORCE)) {
 		/* we are not interested in the dma_addr returned by
 		 * xen_dma_map_page, only in the potential cache flushes executed
 		 * by the function. */
@@ -552,7 +552,7 @@ void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 		phys_addr_t paddr = sg_phys(sg);
 		dma_addr_t dev_addr = xen_phys_to_bus(paddr);
 
-		if (swiotlb_force ||
+		if (swiotlb_force == SWIOTLB_FORCE ||
 		    xen_arch_need_swiotlb(hwdev, paddr, dev_addr) ||
 		    !dma_capable(hwdev, dev_addr, sg->length) ||
 		    range_straddles_page_boundary(paddr, sg->length)) {
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 183f37c8a5e164ad..71d104e4c8490763 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -9,7 +9,12 @@
 struct page;
 struct scatterlist;
 
-extern int swiotlb_force;
+enum swiotlb_force {
+	SWIOTLB_NORMAL,		/* Default - depending on HW DMA mask etc. */
+	SWIOTLB_FORCE,		/* swiotlb=force */
+};
+
+extern enum swiotlb_force swiotlb_force;
 
 /*
  * Maximum allowable number of contiguous slabs to map,
diff --git a/include/trace/events/swiotlb.h b/include/trace/events/swiotlb.h
index 7ea4c5e7c4487a96..5e2e30a7efce0ebd 100644
--- a/include/trace/events/swiotlb.h
+++ b/include/trace/events/swiotlb.h
@@ -11,16 +11,16 @@
 	TP_PROTO(struct device *dev,
 		 dma_addr_t dev_addr,
 		 size_t size,
-		 int swiotlb_force),
+		 enum swiotlb_force swiotlb_force),
 
 	TP_ARGS(dev, dev_addr, size, swiotlb_force),
 
 	TP_STRUCT__entry(
-		__string(	dev_name,	dev_name(dev)	)
-		__field(	u64,	dma_mask		)
-		__field(	dma_addr_t,	dev_addr	)
-		__field(	size_t,	size			)
-		__field(	int,	swiotlb_force		)
+		__string(	dev_name,	dev_name(dev)		)
+		__field(	u64,	dma_mask			)
+		__field(	dma_addr_t,	dev_addr		)
+		__field(	size_t,	size				)
+		__field(	enum swiotlb_force,	swiotlb_force	)
 	),
 
 	TP_fast_assign(
@@ -37,7 +37,9 @@
 		__entry->dma_mask,
 		(unsigned long long)__entry->dev_addr,
 		__entry->size,
-		__entry->swiotlb_force ? "swiotlb_force" : "" )
+		__print_symbolic(__entry->swiotlb_force,
+			{ SWIOTLB_NORMAL,	"NORMAL" },
+			{ SWIOTLB_FORCE,	"FORCE" }))
 );
 
 #endif /*  _TRACE_SWIOTLB_H */
diff --git a/lib/swiotlb.c b/lib/swiotlb.c
index cb1b54ee8527241d..a32dce6d5101f408 100644
--- a/lib/swiotlb.c
+++ b/lib/swiotlb.c
@@ -53,7 +53,7 @@
  */
 #define IO_TLB_MIN_SLABS ((1<<20) >> IO_TLB_SHIFT)
 
-int swiotlb_force;
+enum swiotlb_force swiotlb_force;
 
 /*
  * Used to do a quick range check in swiotlb_tbl_unmap_single and
@@ -107,7 +107,7 @@
 	if (*str == ',')
 		++str;
 	if (!strcmp(str, "force"))
-		swiotlb_force = 1;
+		swiotlb_force = SWIOTLB_FORCE;
 
 	return 0;
 }
@@ -763,7 +763,7 @@ dma_addr_t swiotlb_map_page(struct device *dev, struct page *page,
 	 * we can safely return the device addr and not worry about bounce
 	 * buffering it.
 	 */
-	if (dma_capable(dev, dev_addr, size) && !swiotlb_force)
+	if (dma_capable(dev, dev_addr, size) && swiotlb_force != SWIOTLB_FORCE)
 		return dev_addr;
 
 	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
@@ -904,7 +904,7 @@ void swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 		phys_addr_t paddr = sg_phys(sg);
 		dma_addr_t dev_addr = phys_to_dma(hwdev, paddr);
 
-		if (swiotlb_force ||
+		if (swiotlb_force == SWIOTLB_FORCE ||
 		    !dma_capable(hwdev, dev_addr, sg->length)) {
 			phys_addr_t map = map_single(hwdev, sg_phys(sg),
 						     sg->length, dir, attrs);
-- 
1.9.1
