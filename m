Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
	m.szyprowski@samsung.com
Date: Wed, 08 Jun 2016 16:18:05 +0900
Message-Id: <20160608071805.7560.11681.sendpatchset@little-apple>
In-Reply-To: <20160608071737.7560.32571.sendpatchset@little-apple>
References: <20160608071737.7560.32571.sendpatchset@little-apple>
Subject: [PATCH v4 03/07] iommu/ipmmu-vmsa: Break out utlb parsing code
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Break out the utlb parsing code and dev_data allocation into a
separate function. This is preparation for future code sharing.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V3:
 - Initialize "mmu" to NULL, check before accessing
 - Removed group parameter from ipmmu_init_platform_device()

 Changes since V2:
 - Included this new patch from the following series:
   [PATCH 00/04] iommu/ipmmu-vmsa: IPMMU CONFIG_IOMMU_DMA update
 - Reworked code to fit on top on previous two patches in current series.

 drivers/iommu/ipmmu-vmsa.c |   60 +++++++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 22 deletions(-)

--- 0004/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-06-08 14:59:34.470607110 +0900
@@ -647,22 +647,15 @@ static int ipmmu_find_utlbs(struct ipmmu
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
@@ -690,7 +683,7 @@ static int ipmmu_add_device(struct devic
 	spin_unlock(&ipmmu_devices_lock);
 
 	if (ret < 0)
-		return -ENODEV;
+		goto error;
 
 	for (i = 0; i < num_utlbs; ++i) {
 		if (utlbs[i] >= mmu->num_utlbs) {
@@ -699,6 +692,36 @@ static int ipmmu_add_device(struct devic
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
@@ -716,16 +739,9 @@ static int ipmmu_add_device(struct devic
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
@@ -736,6 +752,8 @@ static int ipmmu_add_device(struct devic
 	 * - Make the mapping size configurable ? We currently use a 2GB mapping
 	 *   at a 1GB offset to ensure that NULL VAs will fault.
 	 */
+	archdata = dev->archdata.iommu;
+	mmu = archdata->mmu;
 	if (!mmu->mapping) {
 		struct dma_iommu_mapping *mapping;
 
@@ -760,10 +778,8 @@ static int ipmmu_add_device(struct devic
 	return 0;
 
 error:
-	arm_iommu_release_mapping(mmu->mapping);
-
-	kfree(dev->archdata.iommu);
-	kfree(utlbs);
+	if (mmu)
+		arm_iommu_release_mapping(mmu->mapping);
 
 	dev->archdata.iommu = NULL;
 
