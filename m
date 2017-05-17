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
Date: Wed, 17 May 2017 19:06:27 +0900
Message-Id: <149501558731.21593.14702289265585992485.sendpatchset@little-apple>
In-Reply-To: <149501557669.21593.1017116915706613060.sendpatchset@little-apple>
References: <149501557669.21593.1017116915706613060.sendpatchset@little-apple>
Subject: [PATCH v8 01/08] iommu/ipmmu-vmsa: Remove platform data handling
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

The IPMMU driver is using DT these days, and platform data is no longer
used by the driver. Remove unused code.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Joerg Roedel <jroedel@suse.de>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

 Changes since V7:
 - Added Reviewed-by from Geert - Thanks!

 drivers/iommu/ipmmu-vmsa.c |    5 -----
 1 file changed, 5 deletions(-)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-05-17 16:30:57.620607110 +0900
@@ -768,11 +768,6 @@ static int ipmmu_probe(struct platform_d
 	int irq;
 	int ret;
 
-	if (!IS_ENABLED(CONFIG_OF) && !pdev->dev.platform_data) {
-		dev_err(&pdev->dev, "missing platform data\n");
-		return -EINVAL;
-	}
-
 	mmu = devm_kzalloc(&pdev->dev, sizeof(*mmu), GFP_KERNEL);
 	if (!mmu) {
 		dev_err(&pdev->dev, "cannot allocate device data\n");
