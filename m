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
Subject: [PATCH v2 3/3] swiotlb: Add swiotlb=noforce debug option
Date: Fri, 16 Dec 2016 14:28:42 +0100
Message-Id: <1481894922-28828-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1481894922-28828-1-git-send-email-geert+renesas@glider.be>
References: <1481894922-28828-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On architectures like arm64, swiotlb is tied intimately to the core
architecture DMA support. In addition, ZONE_DMA cannot be disabled.

To aid debugging and catch devices not supporting DMA to memory outside
the 32-bit address space, add a kernel command line option
"swiotlb=noforce", which disables the use of bounce buffers.
If specified, trying to map memory that cannot be used with DMA will
fail, and a rate-limited warning will be printed.

Note that io_tlb_nslabs is set to 1, which is the minimal supported
value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Change kernel parameter value from "nobounce" to "noforce",
  - Extend swiotlb_force enum instead of adding swiotlb_nobounce
    variable (both requested by Konrad Wilk).
---
 Documentation/admin-guide/kernel-parameters.txt |  3 ++-
 include/linux/swiotlb.h                         |  1 +
 include/trace/events/swiotlb.h                  |  3 ++-
 lib/swiotlb.c                                   | 18 ++++++++++++++++--
 4 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 21e2d88637050b7a..24fb691b2da5f78d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3811,10 +3811,11 @@
 			it if 0 is given (See Documentation/cgroup-v1/memory.txt)
 
 	swiotlb=	[ARM,IA-64,PPC,MIPS,X86]
-			Format: { <int> | force }
+			Format: { <int> | force | noforce }
 			<int> -- Number of I/O TLB slabs
 			force -- force using of bounce buffers even if they
 			         wouldn't be automatically used by the kernel
+			noforce -- Never use bounce buffers (for debugging)
 
 	switches=	[HW,M68k]
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 71d104e4c8490763..d9c84a9cde3dd7d7 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -12,6 +12,7 @@
 enum swiotlb_force {
 	SWIOTLB_NORMAL,		/* Default - depending on HW DMA mask etc. */
 	SWIOTLB_FORCE,		/* swiotlb=force */
+	SWIOTLB_NO_FORCE,	/* swiotlb=noforce */
 };
 
 extern enum swiotlb_force swiotlb_force;
diff --git a/include/trace/events/swiotlb.h b/include/trace/events/swiotlb.h
index 5e2e30a7efce0ebd..288c0c54a2b4ace6 100644
--- a/include/trace/events/swiotlb.h
+++ b/include/trace/events/swiotlb.h
@@ -39,7 +39,8 @@
 		__entry->size,
 		__print_symbolic(__entry->swiotlb_force,
 			{ SWIOTLB_NORMAL,	"NORMAL" },
-			{ SWIOTLB_FORCE,	"FORCE" }))
+			{ SWIOTLB_FORCE,	"FORCE" },
+			{ SWIOTLB_NO_FORCE,	"NO_FORCE" }))
 );
 
 #endif /*  _TRACE_SWIOTLB_H */
diff --git a/lib/swiotlb.c b/lib/swiotlb.c
index a32dce6d5101f408..9def738af4f4e568 100644
--- a/lib/swiotlb.c
+++ b/lib/swiotlb.c
@@ -106,8 +106,12 @@
 	}
 	if (*str == ',')
 		++str;
-	if (!strcmp(str, "force"))
+	if (!strcmp(str, "force")) {
 		swiotlb_force = SWIOTLB_FORCE;
+	} else if (!strcmp(str, "noforce")) {
+		swiotlb_force = SWIOTLB_NO_FORCE;
+		io_tlb_nslabs = 1;
+	}
 
 	return 0;
 }
@@ -543,8 +547,15 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev,
 map_single(struct device *hwdev, phys_addr_t phys, size_t size,
 	   enum dma_data_direction dir, unsigned long attrs)
 {
-	dma_addr_t start_dma_addr = phys_to_dma(hwdev, io_tlb_start);
+	dma_addr_t start_dma_addr;
+
+	if (swiotlb_force == SWIOTLB_NO_FORCE) {
+		dev_warn_ratelimited(hwdev, "Cannot do DMA to address %pa\n",
+				     &phys);
+		return SWIOTLB_MAP_ERROR;
+	}
 
+	start_dma_addr = phys_to_dma(hwdev, io_tlb_start);
 	return swiotlb_tbl_map_single(hwdev, start_dma_addr, phys, size,
 				      dir, attrs);
 }
@@ -721,6 +732,9 @@ void swiotlb_tbl_sync_single(struct device *hwdev, phys_addr_t tlb_addr,
 swiotlb_full(struct device *dev, size_t size, enum dma_data_direction dir,
 	     int do_panic)
 {
+	if (swiotlb_force == SWIOTLB_NO_FORCE)
+		return;
+
 	/*
 	 * Ran out of IOMMU space for this operation. This is very bad.
 	 * Unfortunately the drivers cannot handle this operation properly.
-- 
1.9.1
