Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Tue, 20 Sep 2016 22:45:06 +0900
Message-Id: <20160920134506.25470.77154.sendpatchset@little-apple>
In-Reply-To: <20160920134355.25470.93701.sendpatchset@little-apple>
References: <20160920134355.25470.93701.sendpatchset@little-apple>
Subject: [PATCH v5 07/07] iommu/ipmmu-vmsa: Drop LPAE Kconfig dependency
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Neither the ARM page table code enabled by IOMMU_IO_PGTABLE_LPAE
nor the IPMMU_VMSA driver actually depends on ARM_LPAE, so get
rid of the dependency.

Tested with ipmmu-vmsa on r8a7794 ALT and a kernel config using:
 # CONFIG_ARM_LPAE is not set

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

 Changes since V4:
 - Rebased patch to fit on top of earlier Kconfig changes in series

 Changes since V3:
 - None

 Changes since V2:
 - None

 Changes since V1:
 - Rebased on top of ARCH_RENESAS change
 - Added Acked-by from Laurent

 drivers/iommu/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- 0008/drivers/iommu/Kconfig
+++ work/drivers/iommu/Kconfig	2016-09-20 22:13:03.500607110 +0900
@@ -275,7 +275,6 @@ config EXYNOS_IOMMU_DEBUG
 config IPMMU_VMSA
 	bool "Renesas VMSA-compatible IPMMU"
 	depends on ARM || IOMMU_DMA
-	depends on ARM_LPAE
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
