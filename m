Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 06 Jun 2016 12:58:10 +0900
Message-Id: <20160606035810.31763.53611.sendpatchset@little-apple>
In-Reply-To: <20160606035723.31763.66500.sendpatchset@little-apple>
References: <20160606035723.31763.66500.sendpatchset@little-apple>
Subject: [PATCH v2 05/11] iommu/ipmmu-vmsa: Make use of IOMMU_OF_DECLARE()
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up IOMMU_OF_DECLARE() support in case CONFIG_IOMMU_DMA
is enabled. The only current supported case for 32-bit ARM
is disabled, however for 64-bit ARM this is required.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V1:
 - Reworked slightly to fit updated patch order and
   [PATCH v3 00/06] iommu/ipmmu-vmsa: IPMMU multi-arch update V3

 drivers/iommu/ipmmu-vmsa.c |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

--- 0015/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-06-06 10:57:26.790607110 +0900
@@ -19,6 +19,7 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_iommu.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -1178,15 +1179,22 @@ static struct platform_driver ipmmu_driv
 
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
 
@@ -1198,6 +1206,24 @@ static void __exit ipmmu_exit(void)
 subsys_initcall(ipmmu_init);
 module_exit(ipmmu_exit);
 
+#ifdef CONFIG_IOMMU_DMA
+static int __init ipmmu_vmsa_iommu_of_setup(struct device_node *np)
+{
+	static const struct iommu_ops *ops = &ipmmu_ops;
+
+	ipmmu_init();
+
+	of_iommu_set_ops(np, (struct iommu_ops *)ops);
+	if (!iommu_present(&platform_bus_type))
+		bus_set_iommu(&platform_bus_type, ops);
+
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
