Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Wed, 08 Mar 2017 20:02:03 +0900
Message-Id: <148897092335.16106.10892669490439039957.sendpatchset@little-apple>
In-Reply-To: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
References: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
Subject: [PATCH v3 04/09] iommu/ipmmu-vmsa: Make use of IOMMU_OF_DECLARE()
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up IOMMU_OF_DECLARE() support in case CONFIG_IOMMU_DMA
is enabled. The only current supported case for 32-bit ARM
is disabled, however for 64-bit ARM usage of OF is required.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V2:
 - Reworked registration code to make use of recently introduced:
     iommu_device_register()
     iommu_device_set_ops()
     iommu_device_set_fwnode()

 Changes since V1:
 - Reworked slightly to fit updated patch order and
   [PATCH v3 00/06] iommu/ipmmu-vmsa: IPMMU multi-arch update V3

 drivers/iommu/ipmmu-vmsa.c |   39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

--- 0012/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-03-08 19:08:31.610607110 +0900
@@ -19,6 +19,7 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_iommu.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -41,6 +42,7 @@ struct ipmmu_features {
 struct ipmmu_vmsa_device {
 	struct device *dev;
 	void __iomem *base;
+	struct iommu_device iommu;
 	struct list_head list;
 	const struct ipmmu_features *features;
 	bool is_leaf;
@@ -1161,6 +1163,25 @@ static int ipmmu_probe(struct platform_d
 		ipmmu_device_reset(mmu);
 	}
 
+#if defined(CONFIG_IOMMU_DMA)
+	/*
+	 * Register the IPMMU to the IOMMU subsystem in the following cases:
+	 * - R-Car Gen2 IPMMU (all devices registered)
+	 * - R-Car Gen3 IPMMU (leaf devices only - skip root IPMMU-MM device)
+	 */
+	if (!mmu->features->has_cache_leaf_nodes || mmu->is_leaf) {
+		ret = iommu_device_register(&mmu->iommu);
+		if (ret)
+			return ret;
+
+		iommu_device_set_ops(&mmu->iommu, &ipmmu_ops);
+		iommu_device_set_fwnode(&mmu->iommu,
+					&pdev->dev.of_node->fwnode);
+
+		if (!iommu_present(&platform_bus_type))
+			bus_set_iommu(&platform_bus_type, &ipmmu_ops);
+	}
+#endif
 	/*
 	 * We can't create the ARM mapping here as it requires the bus to have
 	 * an IOMMU, which only happens when bus_set_iommu() is called in
@@ -1204,15 +1225,22 @@ static struct platform_driver ipmmu_driv
 
 static int __init ipmmu_init(void)
 {
+	static bool setup_done;
 	int ret;
 
+	if (setup_done)
+		return 0;
+
 	ret = platform_driver_register(&ipmmu_driver);
 	if (ret < 0)
 		return ret;
 
+#if defined(CONFIG_ARM) && !defined(CONFIG_IOMMU_DMA)
 	if (!iommu_present(&platform_bus_type))
 		bus_set_iommu(&platform_bus_type, &ipmmu_ops);
+#endif
 
+	setup_done = true;
 	return 0;
 }
 
@@ -1224,6 +1252,17 @@ static void __exit ipmmu_exit(void)
 subsys_initcall(ipmmu_init);
 module_exit(ipmmu_exit);
 
+#ifdef CONFIG_IOMMU_DMA
+static int __init ipmmu_vmsa_iommu_of_setup(struct device_node *np)
+{
+	ipmmu_init();
+	return 0;
+}
+
+IOMMU_OF_DECLARE(ipmmu_vmsa_iommu_of, "renesas,ipmmu-vmsa",
+		 ipmmu_vmsa_iommu_of_setup);
+#endif
+
 MODULE_DESCRIPTION("IOMMU API for Renesas VMSA-compatible IPMMU");
 MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
 MODULE_LICENSE("GPL v2");
