Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Tue, 07 Mar 2017 12:16:53 +0900
Message-Id: <148885661365.28553.9778846573359254430.sendpatchset@little-apple>
In-Reply-To: <148885660307.28553.995847796823338863.sendpatchset@little-apple>
References: <148885660307.28553.995847796823338863.sendpatchset@little-apple>
Subject: [PATCH v7 01/07] iommu/ipmmu-vmsa: Remove platform data handling
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

The IPMMU driver is using DT these days, and platform data is no longer
used by the driver. Remove unused code.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Joerg Roedel <jroedel@suse.de>
---

 Changes since V6:
 - None

 drivers/iommu/ipmmu-vmsa.c |    5 -----
 1 file changed, 5 deletions(-)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-03-06 17:25:49.000000000 +0900
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
