Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        robin.murphy@arm.com, will.deacon@arm.com,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, sricharan@codeaurora.org,
        m.szyprowski@samsung.com
Date: Wed, 17 May 2017 19:07:30 +0900
Message-Id: <149501565080.21593.5373464892088228227.sendpatchset@little-apple>
In-Reply-To: <149501557669.21593.1017116915706613060.sendpatchset@little-apple>
References: <149501557669.21593.1017116915706613060.sendpatchset@little-apple>
Subject: [PATCH v8 07/08] iommu/ipmmu-vmsa: Drop LPAE Kconfig dependency
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

 Changes since V7:
 - None

 drivers/iommu/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- 0010/drivers/iommu/Kconfig
+++ work/drivers/iommu/Kconfig	2017-05-17 16:45:15.530607110 +0900
@@ -275,7 +275,6 @@ config EXYNOS_IOMMU_DEBUG
 config IPMMU_VMSA
 	bool "Renesas VMSA-compatible IPMMU"
 	depends on ARM || IOMMU_DMA
-	depends on ARM_LPAE
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
