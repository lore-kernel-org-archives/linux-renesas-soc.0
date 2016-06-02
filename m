Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
	m.szyprowski@samsung.com
Date: Fri, 03 Jun 2016 00:55:29 +0900
Message-Id: <20160602155529.31018.53638.sendpatchset@little-apple>
In-Reply-To: <20160602155519.31018.59925.sendpatchset@little-apple>
References: <20160602155519.31018.59925.sendpatchset@little-apple>
Subject: [PATCH v3 01/06] iommu/ipmmu-vmsa: Remove platform data handling
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

The IPMMU driver is using DT these days, and platform data is no longer
used by the driver. Remove unused code.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

 Changes since V2:
 - None

 Changes since V1:
 - Added Reviewed-by from Laurent

 drivers/iommu/ipmmu-vmsa.c |    5 -----
 1 file changed, 5 deletions(-)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-06-02 20:43:14.090607110 +0900
@@ -766,11 +766,6 @@ static int ipmmu_probe(struct platform_d
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
