Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:36633 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752425AbdFOKdk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2017 06:33:40 -0400
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        robin.murphy@arm.com, will.deacon@arm.com,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, sricharan@codeaurora.org,
        m.szyprowski@samsung.com
Date: Thu, 15 Jun 2017 19:29:38 +0900
Message-Id: <149752257829.21887.15003130821809174947.sendpatchset@little-apple>
In-Reply-To: <149752254550.21887.15183665699230243235.sendpatchset@little-apple>
References: <149752254550.21887.15183665699230243235.sendpatchset@little-apple>
Subject: [PATCH 03/04] iommu/ipmmu-vmsa: Use fwspec on both 32 and 64-bit ARM
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Robin Murphy <robin.murphy@arm.com>

Consolidate the 32-bit and 64-bit code to make use of fwspec instead
of archdata for the 32-bit ARM case.

This is a simplified version of the fwspec handling code from Robin
posted as [PATCH] iommu/ipmmu-vmsa: Convert to iommu_fwspec

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |   21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

--- 0010/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-06-15 17:29:00.290607110 +0900
@@ -73,22 +73,9 @@ static struct ipmmu_vmsa_domain *to_vmsa
 	return container_of(dom, struct ipmmu_vmsa_domain, io_domain);
 }
 
-
 static struct ipmmu_vmsa_iommu_priv *to_priv(struct device *dev)
 {
-#if defined(CONFIG_ARM)
-	return dev->archdata.iommu;
-#else
-	return dev->iommu_fwspec->iommu_priv;
-#endif
-}
-static void set_priv(struct device *dev, struct ipmmu_vmsa_iommu_priv *p)
-{
-#if defined(CONFIG_ARM)
-	dev->archdata.iommu = p;
-#else
-	dev->iommu_fwspec->iommu_priv = p;
-#endif
+	return dev->iommu_fwspec ? dev->iommu_fwspec->iommu_priv : NULL;
 }
 
 #define TLB_LOOP_TIMEOUT		100	/* 100us */
@@ -730,7 +717,7 @@ static int ipmmu_init_platform_device(st
 	priv->utlbs = utlbs;
 	priv->num_utlbs = num_utlbs;
 	priv->dev = dev;
-	set_priv(dev, priv);
+	dev->iommu_fwspec->iommu_priv = priv;
 	return 0;
 
 error:
@@ -887,14 +874,12 @@ static void ipmmu_domain_free_dma(struct
 
 static int ipmmu_add_device_dma(struct device *dev)
 {
-	struct iommu_fwspec *fwspec = dev->iommu_fwspec;
 	struct iommu_group *group;
 
 	/*
 	 * Only let through devices that have been verified in xlate()
-	 * We may get called with dev->iommu_fwspec set to NULL.
 	 */
-	if (!fwspec || !fwspec->iommu_priv)
+	if (!to_priv(dev))
 		return -ENODEV;
 
 	group = iommu_group_get_for_dev(dev);
