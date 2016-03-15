Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
	m.szyprowski@samsung.com
Date: Wed, 16 Mar 2016 02:04:51 +0900
Message-Id: <20160315170451.20615.97297.sendpatchset@little-apple>
In-Reply-To: <20160315170431.20615.30333.sendpatchset@little-apple>
References: <20160315170431.20615.30333.sendpatchset@little-apple>
Subject: [PATCH 02/04] iommu/ipmmu-vmsa: Break out utlb parsing code
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Break out the utlb parsing code and dev_data allocation into a
separate function. This is preparation for future code sharing.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |  125 ++++++++++++++++++++++++--------------------
 1 file changed, 70 insertions(+), 55 deletions(-)

--- 0008/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-03-15 21:08:20.180513000 +0900
@@ -619,6 +619,69 @@ static int ipmmu_find_utlbs(struct ipmmu
 	return 0;
 }
 
+static int ipmmu_init_platform_device(struct device *dev,
+				      struct iommu_group *group)
+{
+	struct ipmmu_vmsa_archdata *archdata;
+	struct ipmmu_vmsa_device *mmu;
+	unsigned int *utlbs;
+	unsigned int i;
+	int num_utlbs;
+	int ret = -ENODEV;
+
+	/* Find the master corresponding to the device. */
+
+	num_utlbs = of_count_phandle_with_args(dev->of_node, "iommus",
+					       "#iommu-cells");
+	if (num_utlbs < 0)
+		return -ENODEV;
+
+	utlbs = kcalloc(num_utlbs, sizeof(*utlbs), GFP_KERNEL);
+	if (!utlbs)
+		return -ENOMEM;
+
+	spin_lock(&ipmmu_devices_lock);
+
+	list_for_each_entry(mmu, &ipmmu_devices, list) {
+		ret = ipmmu_find_utlbs(mmu, dev, utlbs, num_utlbs);
+		if (!ret) {
+			/*
+			 * TODO Take a reference to the MMU to protect
+			 * against device removal.
+			 */
+			break;
+		}
+	}
+
+	spin_unlock(&ipmmu_devices_lock);
+
+	if (ret < 0)
+		goto error;
+
+	for (i = 0; i < num_utlbs; ++i) {
+		if (utlbs[i] >= mmu->num_utlbs) {
+			ret = -EINVAL;
+			goto error;
+		}
+	}
+
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
 #if defined(CONFIG_ARM) && !defined(CONFIG_IOMMU_DMA)
 static int ipmmu_map_attach(struct device *dev, struct ipmmu_vmsa_device *mmu)
 {
@@ -675,13 +738,8 @@ static inline void ipmmu_release_mapping
 
 static int ipmmu_add_device(struct device *dev)
 {
-	struct ipmmu_vmsa_archdata *archdata;
-	struct ipmmu_vmsa_device *mmu;
-	struct iommu_group *group = NULL;
-	unsigned int *utlbs;
-	unsigned int i;
-	int num_utlbs;
-	int ret = -ENODEV;
+	struct iommu_group *group;
+	int ret;
 
 	if (dev->archdata.iommu) {
 		dev_warn(dev, "IOMMU driver already assigned to device %s\n",
@@ -689,42 +747,6 @@ static int ipmmu_add_device(struct devic
 		return -EINVAL;
 	}
 
-	/* Find the master corresponding to the device. */
-
-	num_utlbs = of_count_phandle_with_args(dev->of_node, "iommus",
-					       "#iommu-cells");
-	if (num_utlbs < 0)
-		return -ENODEV;
-
-	utlbs = kcalloc(num_utlbs, sizeof(*utlbs), GFP_KERNEL);
-	if (!utlbs)
-		return -ENOMEM;
-
-	spin_lock(&ipmmu_devices_lock);
-
-	list_for_each_entry(mmu, &ipmmu_devices, list) {
-		ret = ipmmu_find_utlbs(mmu, dev, utlbs, num_utlbs);
-		if (!ret) {
-			/*
-			 * TODO Take a reference to the MMU to protect
-			 * against device removal.
-			 */
-			break;
-		}
-	}
-
-	spin_unlock(&ipmmu_devices_lock);
-
-	if (ret < 0)
-		return -ENODEV;
-
-	for (i = 0; i < num_utlbs; ++i) {
-		if (utlbs[i] >= mmu->num_utlbs) {
-			ret = -EINVAL;
-			goto error;
-		}
-	}
-
 	/* Create a device group and add the device to it. */
 	group = iommu_group_alloc();
 	if (IS_ERR(group)) {
@@ -742,27 +764,20 @@ static int ipmmu_add_device(struct devic
 		goto error;
 	}
 
-	archdata = kzalloc(sizeof(*archdata), GFP_KERNEL);
-	if (!archdata) {
-		ret = -ENOMEM;
+	ret = ipmmu_init_platform_device(dev, group);
+	if (ret < 0) {
+		dev_err(dev, "Failed to init platform device\n");
 		goto error;
 	}
 
-	archdata->mmu = mmu;
-	archdata->utlbs = utlbs;
-	archdata->num_utlbs = num_utlbs;
-	dev->archdata.iommu = archdata;
-
-	ret = ipmmu_map_attach(dev, mmu);
+	ret = ipmmu_map_attach(dev, ((struct ipmmu_vmsa_archdata *)
+				     dev->archdata.iommu)->mmu);
 	if (ret < 0)
 		goto error;
 
 	return 0;
 
 error:
-	kfree(dev->archdata.iommu);
-	kfree(utlbs);
-
 	dev->archdata.iommu = NULL;
 
 	if (!IS_ERR_OR_NULL(group))
