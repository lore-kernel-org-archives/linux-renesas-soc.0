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
Date: Thu, 15 Jun 2017 19:29:27 +0900
Message-Id: <149752256764.21887.17904093211691192196.sendpatchset@little-apple>
In-Reply-To: <149752254550.21887.15183665699230243235.sendpatchset@little-apple>
References: <149752254550.21887.15183665699230243235.sendpatchset@little-apple>
Subject: [PATCH 02/04] iommu/ipmmu-vmsa: Consistent ->of_xlate() handling
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

The 32-bit ARM code gets updated to make use of ->of_xlate() and the
code is shared between 64-bit and 32-bit ARM. The of_device_is_available()
check gets dropped since it is included in of_iommu_xlate().

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |   51 ++++++++++++++------------------------------
 1 file changed, 17 insertions(+), 34 deletions(-)

--- 0009/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-06-15 17:22:27.460607110 +0900
@@ -680,6 +680,10 @@ static int ipmmu_init_platform_device(st
 	int num_utlbs;
 	int ret = -ENODEV;
 
+	/* Initialize once - xlate() will call multiple times */
+	if (to_priv(dev))
+		return 0;
+
 	/* Find the master corresponding to the device. */
 
 	num_utlbs = of_count_phandle_with_args(dev->of_node, "iommus",
@@ -734,6 +738,12 @@ error:
 	return ret;
 }
 
+static int ipmmu_of_xlate(struct device *dev,
+			  struct of_phandle_args *spec)
+{
+	return ipmmu_init_platform_device(dev);
+}
+
 #if defined(CONFIG_ARM) && !defined(CONFIG_IOMMU_DMA)
 
 static struct iommu_domain *ipmmu_domain_alloc(unsigned type)
@@ -750,11 +760,11 @@ static int ipmmu_add_device(struct devic
 	struct iommu_group *group;
 	int ret;
 
-	if (to_priv(dev)) {
-		dev_warn(dev, "IOMMU driver already assigned to device %s\n",
-			 dev_name(dev));
-		return -EINVAL;
-	}
+	/*
+	 * Only let through devices that have been verified in xlate()
+	 */
+	if (!to_priv(dev))
+		return -ENODEV;
 
 	/* Create a device group and add the device to it. */
 	group = iommu_group_alloc();
@@ -773,10 +783,6 @@ static int ipmmu_add_device(struct devic
 		goto error;
 	}
 
-	ret = ipmmu_init_platform_device(dev);
-	if (ret < 0)
-		goto error;
-
 	/*
 	 * Create the ARM mapping, used by the ARM DMA mapping core to allocate
 	 * VAs. This will allocate a corresponding IOMMU domain.
@@ -817,24 +823,13 @@ error:
 	if (!IS_ERR_OR_NULL(group))
 		iommu_group_remove_device(dev);
 
-	kfree(to_priv(dev)->utlbs);
-	kfree(to_priv(dev));
-	set_priv(dev, NULL);
-
 	return ret;
 }
 
 static void ipmmu_remove_device(struct device *dev)
 {
-	struct ipmmu_vmsa_iommu_priv *priv = to_priv(dev);
-
 	arm_iommu_detach_device(dev);
 	iommu_group_remove_device(dev);
-
-	kfree(priv->utlbs);
-	kfree(priv);
-
-	set_priv(dev, NULL);
 }
 
 static const struct iommu_ops ipmmu_ops = {
@@ -849,6 +844,7 @@ static const struct iommu_ops ipmmu_ops
 	.add_device = ipmmu_add_device,
 	.remove_device = ipmmu_remove_device,
 	.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K,
+	.of_xlate = ipmmu_of_xlate,
 };
 
 #endif /* !CONFIG_ARM && CONFIG_IOMMU_DMA */
@@ -958,19 +954,6 @@ static struct iommu_group *ipmmu_find_gr
 	return group;
 }
 
-static int ipmmu_of_xlate_dma(struct device *dev,
-			      struct of_phandle_args *spec)
-{
-	/* If the IPMMU device is disabled in DT then return error
-	 * to make sure the of_iommu code does not install ops
-	 * even though the iommu device is disabled
-	 */
-	if (!of_device_is_available(spec->np))
-		return -ENODEV;
-
-	return ipmmu_init_platform_device(dev);
-}
-
 static const struct iommu_ops ipmmu_ops = {
 	.domain_alloc = ipmmu_domain_alloc_dma,
 	.domain_free = ipmmu_domain_free_dma,
@@ -984,7 +967,7 @@ static const struct iommu_ops ipmmu_ops
 	.remove_device = ipmmu_remove_device_dma,
 	.device_group = ipmmu_find_group_dma,
 	.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K,
-	.of_xlate = ipmmu_of_xlate_dma,
+	.of_xlate = ipmmu_of_xlate,
 };
 
 #endif /* CONFIG_IOMMU_DMA */
