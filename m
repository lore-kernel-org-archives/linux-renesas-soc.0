Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 06 Jun 2016 12:58:01 +0900
Message-Id: <20160606035801.31763.40763.sendpatchset@little-apple>
In-Reply-To: <20160606035723.31763.66500.sendpatchset@little-apple>
References: <20160606035723.31763.66500.sendpatchset@little-apple>
Subject: [PATCH v2 04/11] iommu/ipmmu-vmsa: Reuse iommu groups
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Extend the IPMMU driver to group devices together based
on the IPMMU device they are connected to. The slave
devices are kept on a list which is used to determine
if existing groups (and contexts) exist.

With this patch the two SYS-DMAC devices using IPMMU-DS0
on r8a7795 will be grouped together.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V1:
 - New patch

 drivers/iommu/ipmmu-vmsa.c |   68 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 8 deletions(-)

--- 0013/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-06-06 10:55:32.340607110 +0900
@@ -69,11 +69,16 @@ struct ipmmu_vmsa_archdata {
 	struct ipmmu_vmsa_device *mmu;
 	unsigned int *utlbs;
 	unsigned int num_utlbs;
+	struct device *dev;
+	struct list_head list;
 };
 
 static DEFINE_SPINLOCK(ipmmu_devices_lock);
 static LIST_HEAD(ipmmu_devices);
 
+static DEFINE_SPINLOCK(ipmmu_slave_devices_lock);
+static LIST_HEAD(ipmmu_slave_devices);
+
 static struct ipmmu_vmsa_domain *to_vmsa_domain(struct iommu_domain *dom)
 {
 	return container_of(dom, struct ipmmu_vmsa_domain, io_domain);
@@ -619,6 +624,9 @@ static int ipmmu_attach_device(struct io
 		dev_err(dev, "Can't attach IPMMU %s to domain on IPMMU %s\n",
 			dev_name(mmu->dev), dev_name(domain->mmu->dev));
 		ret = -EINVAL;
+	} else {
+			dev_info(dev, "Reusing IPMMU context %u\n",
+				 domain->context_id);
 	}
 
 	spin_unlock_irqrestore(&domain->lock, flags);
@@ -676,6 +684,42 @@ static phys_addr_t ipmmu_iova_to_phys(st
 	return domain->iop->iova_to_phys(domain->iop, iova);
 }
 
+static struct device *ipmmu_find_sibling_device(struct device *dev)
+{
+	struct ipmmu_vmsa_archdata *archdata = dev->archdata.iommu;
+	struct ipmmu_vmsa_archdata *sibling_archdata = NULL;
+	bool found = false;
+
+	spin_lock(&ipmmu_slave_devices_lock);
+
+	list_for_each_entry(sibling_archdata, &ipmmu_slave_devices, list) {
+		if (archdata == sibling_archdata)
+			continue;
+		if (sibling_archdata->mmu == archdata->mmu) {
+			found = true;
+			break;
+		}
+	}
+
+	spin_unlock(&ipmmu_slave_devices_lock);
+
+	return found ? sibling_archdata->dev : NULL;
+}
+
+static struct iommu_group *ipmmu_find_group(struct device *dev)
+{
+	struct iommu_group *group;
+	struct device *sibling;
+
+	sibling = ipmmu_find_sibling_device(dev);
+	if (sibling)
+		group = iommu_group_get(sibling);
+	if (!sibling || IS_ERR(group))
+		group = generic_device_group(dev);
+
+	return group;
+}
+
 static int ipmmu_find_utlbs(struct ipmmu_vmsa_device *mmu, struct device *dev,
 			    unsigned int *utlbs, unsigned int num_utlbs)
 {
@@ -756,6 +800,7 @@ static int ipmmu_init_platform_device(st
 	archdata->mmu = mmu;
 	archdata->utlbs = utlbs;
 	archdata->num_utlbs = num_utlbs;
+	archdata->dev = dev;
 	dev->archdata.iommu = archdata;
 	return 0;
 
@@ -908,6 +953,7 @@ static void ipmmu_domain_free_dma(struct
 
 static int ipmmu_add_device_dma(struct device *dev)
 {
+	struct ipmmu_vmsa_archdata *archdata = dev->archdata.iommu;
 	struct iommu_group *group;
 
 	/* only accept devices with iommus property */
@@ -919,11 +965,21 @@ static int ipmmu_add_device_dma(struct d
 	if (IS_ERR(group))
 		return PTR_ERR(group);
 
+	archdata = dev->archdata.iommu;
+	spin_lock(&ipmmu_slave_devices_lock);
+	list_add(&archdata->list, &ipmmu_slave_devices);
+	spin_unlock(&ipmmu_slave_devices_lock);
 	return 0;
 }
 
 static void ipmmu_remove_device_dma(struct device *dev)
 {
+	struct ipmmu_vmsa_archdata *archdata = dev->archdata.iommu;
+
+	spin_lock(&ipmmu_slave_devices_lock);
+	list_del(&archdata->list);
+	spin_unlock(&ipmmu_slave_devices_lock);
+
 	iommu_group_remove_device(dev);
 }
 
@@ -932,15 +988,11 @@ static struct iommu_group *ipmmu_device_
 	struct iommu_group *group;
 	int ret;
 
-	group = generic_device_group(dev);
-	if (IS_ERR(group))
-		return group;
-
-	ret = ipmmu_init_platform_device(dev, group);
-	if (ret) {
-		iommu_group_put(group);
+	ret = ipmmu_init_platform_device(dev, NULL);
+	if (!ret)
+		group = ipmmu_find_group(dev);
+	else
 		group = ERR_PTR(ret);
-	}
 
 	return group;
 }
