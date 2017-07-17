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
Date: Mon, 17 Jul 2017 22:05:10 +0900
Message-Id: <150029671059.22030.9200719361237858789.sendpatchset@little-apple>
In-Reply-To: <150029669967.22030.8059216113725566341.sendpatchset@little-apple>
References: <150029669967.22030.8059216113725566341.sendpatchset@little-apple>
Subject: [PATCH v2 01/05] iommu/ipmmu-vmsa: Use iommu_device_register()/unregister()
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Extend the driver to make use of iommu_device_register()/unregister()
functions together with iommu_device_set_ops() and iommu_set_fwnode().

These used to be part of the earlier posted 64-bit ARM (r8a7795) series but
it turns out that these days they are required on 32-bit ARM as well.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V1:
 - Perform iommu_device_set_ops() and iommu_device_set_fwnode() before
   iommu_device_register() - thanks Robin!

 drivers/iommu/ipmmu-vmsa.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-07-17 21:01:47.140607110 +0900
@@ -35,6 +35,7 @@
 struct ipmmu_vmsa_device {
 	struct device *dev;
 	void __iomem *base;
+	struct iommu_device iommu;
 	struct list_head list;
 
 	unsigned int num_utlbs;
@@ -1054,6 +1055,13 @@ static int ipmmu_probe(struct platform_d
 
 	ipmmu_device_reset(mmu);
 
+	iommu_device_set_ops(&mmu->iommu, &ipmmu_ops);
+	iommu_device_set_fwnode(&mmu->iommu, &pdev->dev.of_node->fwnode);
+
+	ret = iommu_device_register(&mmu->iommu);
+	if (ret)
+		return ret;
+
 	/*
 	 * We can't create the ARM mapping here as it requires the bus to have
 	 * an IOMMU, which only happens when bus_set_iommu() is called in
@@ -1077,6 +1085,8 @@ static int ipmmu_remove(struct platform_
 	list_del(&mmu->list);
 	spin_unlock(&ipmmu_devices_lock);
 
+	iommu_device_unregister(&mmu->iommu);
+
 #if defined(CONFIG_ARM) && !defined(CONFIG_IOMMU_DMA)
 	arm_iommu_release_mapping(mmu->mapping);
 #endif
