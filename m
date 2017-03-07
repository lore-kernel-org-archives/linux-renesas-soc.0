Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Tue, 07 Mar 2017 12:17:53 +0900
Message-Id: <148885667392.28553.14961612755669401435.sendpatchset@little-apple>
In-Reply-To: <148885660307.28553.995847796823338863.sendpatchset@little-apple>
References: <148885660307.28553.995847796823338863.sendpatchset@little-apple>
Subject: [PATCH v7 07/07] iommu/ipmmu-vmsa: Drop LPAE Kconfig dependency
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
Reviewed-by: Joerg Roedel <jroedel@suse.de>
---

 Changes since V6:
 - None

 drivers/iommu/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- 0011/drivers/iommu/Kconfig
+++ work/drivers/iommu/Kconfig	2017-03-06 18:50:49.260607110 +0900
@@ -275,7 +275,6 @@ config EXYNOS_IOMMU_DEBUG
 config IPMMU_VMSA
 	bool "Renesas VMSA-compatible IPMMU"
 	depends on ARM || IOMMU_DMA
-	depends on ARM_LPAE
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
