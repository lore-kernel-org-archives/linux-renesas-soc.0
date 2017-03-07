Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35630 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754827AbdCGDZK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 22:25:10 -0500
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Tue, 07 Mar 2017 12:17:13 +0900
Message-Id: <148885663361.28553.16605169682314363447.sendpatchset@little-apple>
In-Reply-To: <148885660307.28553.995847796823338863.sendpatchset@little-apple>
References: <148885660307.28553.995847796823338863.sendpatchset@little-apple>
Subject: [PATCH v7 03/07] iommu/ipmmu-vmsa: Break out utlb parsing code
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Break out the utlb parsing code and dev_data allocation into a
separate function. This is preparation for future code sharing.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Joerg Roedel <jroedel@suse.de>
---

Changes since V6:
 - None

 drivers/iommu/ipmmu-vmsa.c |   58 ++++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 21 deletions(-)

--- 0004/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-03-06 18:33:38.600607110 +0900
@@ -649,22 +649,15 @@ static int ipmmu_find_utlbs(struct ipmmu
 	return 0;
 }
 
-static int ipmmu_add_device(struct device *dev)
+static int ipmmu_init_platform_device(struct device *dev)
 {
 	struct ipmmu_vmsa_archdata *archdata;
 	struct ipmmu_vmsa_device *mmu;
-	struct iommu_group *group = NULL;
 	unsigned int *utlbs;
 	unsigned int i;
 	int num_utlbs;
 	int ret = -ENODEV;
 
-	if (dev->archdata.iommu) {
-		dev_warn(dev, "IOMMU driver already assigned to device %s\n",
-			 dev_name(dev));
-		return -EINVAL;
-	}
-
 	/* Find the master corresponding to the device. */
 
 	num_utlbs = of_count_phandle_with_args(dev->of_node, "iommus",
@@ -701,6 +694,36 @@ static int ipmmu_add_device(struct devic
 		}
 	}
 
+	archdata = kzalloc(sizeof(*archdata), GFP_KERNEL);
+	if (!archdata) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	archdata->mmu = mmu;
+	archdata->utlbs = utlbs;
+	archdata->num_utlbs = num_utlbs;
+	dev->archdata.iommu = archdata;
+	return 0;
+
+error:
+	kfree(utlbs);
+	return ret;
+}
+
+static int ipmmu_add_device(struct device *dev)
+{
+	struct ipmmu_vmsa_archdata *archdata;
+	struct ipmmu_vmsa_device *mmu = NULL;
+	struct iommu_group *group;
+	int ret;
+
+	if (dev->archdata.iommu) {
+		dev_warn(dev, "IOMMU driver already assigned to device %s\n",
+			 dev_name(dev));
+		return -EINVAL;
+	}
+
 	/* Create a device group and add the device to it. */
 	group = iommu_group_alloc();
 	if (IS_ERR(group)) {
@@ -718,16 +741,9 @@ static int ipmmu_add_device(struct devic
 		goto error;
 	}
 
-	archdata = kzalloc(sizeof(*archdata), GFP_KERNEL);
-	if (!archdata) {
-		ret = -ENOMEM;
+	ret = ipmmu_init_platform_device(dev);
+	if (ret < 0)
 		goto error;
-	}
-
-	archdata->mmu = mmu;
-	archdata->utlbs = utlbs;
-	archdata->num_utlbs = num_utlbs;
-	dev->archdata.iommu = archdata;
 
 	/*
 	 * Create the ARM mapping, used by the ARM DMA mapping core to allocate
@@ -738,6 +754,8 @@ static int ipmmu_add_device(struct devic
 	 * - Make the mapping size configurable ? We currently use a 2GB mapping
 	 *   at a 1GB offset to ensure that NULL VAs will fault.
 	 */
+	archdata = dev->archdata.iommu;
+	mmu = archdata->mmu;
 	if (!mmu->mapping) {
 		struct dma_iommu_mapping *mapping;
 
@@ -762,10 +780,8 @@ static int ipmmu_add_device(struct devic
 	return 0;
 
 error:
-	arm_iommu_release_mapping(mmu->mapping);
-
-	kfree(dev->archdata.iommu);
-	kfree(utlbs);
+	if (mmu)
+		arm_iommu_release_mapping(mmu->mapping);
 
 	dev->archdata.iommu = NULL;
 
