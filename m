Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Thu, 20 Apr 2017 22:49:51 +0900
Message-Id: <149269619140.29240.8313759935990074477.sendpatchset@little-apple>
Subject: [PATCH] iommu/ipmmu-vmsa: Fix pgsize_bitmap semicolon typo
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Fix comman-instead-of-semicolon typo error present
in the latest version of the IPMMU driver.

Will in the future be rolled into next driver update.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Applies on top of renesas-drivers-2017-04-18-v4.11-rc7 or -next plus:
 [PATCH v7 00/07] iommu/ipmmu-vmsa: IPMMU multi-arch update V7
 [PATCH v3 00/09] iommu/ipmmu-vmsa: r8a7795 support V3
 [PATCH v3 0/3] iommu/ipmmu-vmsa: r8a7796 support V3

 drivers/iommu/ipmmu-vmsa.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-04-20 22:30:07.000607110 +0900
@@ -431,7 +431,7 @@ static int ipmmu_domain_init_context(str
 	 * non-secure mode.
 	 */
 	domain->cfg.quirks = IO_PGTABLE_QUIRK_ARM_NS;
-	domain->cfg.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K,
+	domain->cfg.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K;
 	domain->cfg.ias = 32;
 	domain->cfg.oas = 40;
 	domain->cfg.tlb = &ipmmu_gather_ops;
