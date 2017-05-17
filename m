Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        sricharan@codeaurora.org, will.deacon@arm.com,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Wed, 17 May 2017 19:07:41 +0900
Message-Id: <149501566125.21593.3631162285769723783.sendpatchset@little-apple>
In-Reply-To: <149501557669.21593.1017116915706613060.sendpatchset@little-apple>
References: <149501557669.21593.1017116915706613060.sendpatchset@little-apple>
Subject: [PATCH v8 08/08] iommu/ipmmu-vmsa: Fix pgsize_bitmap semicolon typo
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Fix comma-instead-of-semicolon typo error present
in the latest version of the IPMMU driver.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Earlier posted as:
 [PATCH] iommu/ipmmu-vmsa: Fix pgsize_bitmap semicolon typo

 drivers/iommu/ipmmu-vmsa.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0014/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-05-17 16:50:02.850607110 +0900
@@ -358,7 +358,7 @@ static int ipmmu_domain_init_context(str
 	 * non-secure mode.
 	 */
 	domain->cfg.quirks = IO_PGTABLE_QUIRK_ARM_NS;
-	domain->cfg.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K,
+	domain->cfg.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K;
 	domain->cfg.ias = 32;
 	domain->cfg.oas = 40;
 	domain->cfg.tlb = &ipmmu_gather_ops;
