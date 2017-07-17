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
Date: Mon, 17 Jul 2017 22:05:31 +0900
Message-Id: <150029673120.22030.6013637834677159530.sendpatchset@little-apple>
In-Reply-To: <150029669967.22030.8059216113725566341.sendpatchset@little-apple>
References: <150029669967.22030.8059216113725566341.sendpatchset@little-apple>
Subject: [PATCH v2 03/05] iommu/ipmmu-vmsa: Use fwspec on both 32 and 64-bit ARM
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Robin Murphy <robin.murphy@arm.com>

Consolidate the 32-bit and 64-bit code to make use of fwspec instead
of archdata for the 32-bit ARM case.

This is a simplified version of the fwspec handling code from Robin
posted as [PATCH] iommu/ipmmu-vmsa: Convert to iommu_fwspec

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V1:
 - Rebased to apply on top of earlier changes in series

 drivers/iommu/ipmmu-vmsa.c |   21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

--- 0004/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-07-17 21:04:54.850607110 +0900
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
@@ -726,7 +713,7 @@ static int ipmmu_init_platform_device(st
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
