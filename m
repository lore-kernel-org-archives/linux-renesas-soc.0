Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 18 Mar 2016 01:29:18 +0900
Message-Id: <20160317162918.24104.29242.sendpatchset@little-apple>
In-Reply-To: <20160317162909.24104.31682.sendpatchset@little-apple>
References: <20160317162909.24104.31682.sendpatchset@little-apple>
Subject: [PATCH 01/10] iommu/ipmmu-vmsa: Make use of IOMMU_OF_DECLARE()
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up IOMMU_OF_DECLARE() support in case CONFIG_IOMMU_DMA
is enabled. The only current supported case for 32-bit ARM
is disabled, however for 64-bit ARM this is required.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |   31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

--- 0014/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-03-18 00:12:22.950513000 +0900
@@ -19,6 +19,7 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_iommu.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -1016,18 +1017,22 @@ static struct platform_driver ipmmu_driv
 
 static int __init ipmmu_init(void)
 {
-	const struct iommu_ops *ops;
+	static bool setup_done;
 	int ret;
 
+	if (setup_done)
+		return 0;
+
 	ret = platform_driver_register(&ipmmu_driver);
 	if (ret < 0)
 		return ret;
 
-	ops = IS_ENABLED(CONFIG_IOMMU_DMA) ? &ipmmu_ops_dma : &ipmmu_ops;
-
+#if defined(CONFIG_ARM) && !defined(CONFIG_IOMMU_DMA)
 	if (!iommu_present(&platform_bus_type))
-		bus_set_iommu(&platform_bus_type, ops);
+		bus_set_iommu(&platform_bus_type, &ipmmu_ops);
+#endif
 
+	setup_done = true;
 	return 0;
 }
 
@@ -1039,6 +1044,24 @@ static void __exit ipmmu_exit(void)
 subsys_initcall(ipmmu_init);
 module_exit(ipmmu_exit);
 
+#ifdef CONFIG_IOMMU_DMA
+static int __init ipmmu_vmsa_iommu_of_setup(struct device_node *np)
+{
+	static const struct iommu_ops *ops = &ipmmu_ops_dma;
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
