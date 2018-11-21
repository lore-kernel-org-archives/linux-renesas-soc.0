Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44069 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729485AbeKUVEb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 16:04:31 -0500
Received: by mail-pl1-f195.google.com with SMTP id s5-v6so4920590plq.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Nov 2018 02:30:38 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 21 Nov 2018 19:30:56 +0900
Message-Id: <154279625682.29528.16840605699274594629.sendpatchset@octo>
In-Reply-To: <154279624819.29528.954090919447072739.sendpatchset@octo>
References: <154279624819.29528.954090919447072739.sendpatchset@octo>
Subject: [PATCH 01/05] Hack FCP driver to poke at FCPCS and VDPB during probe
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hack up the FCP driver to test the power domains and dump registers.

This prototype level code is not intended for upstream merge.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/media/platform/rcar-fcp.c |   42 ++++++++++++++++++++++++++++++++++++-
 drivers/soc/renesas/rcar-sysc.c   |    1 
 2 files changed, 42 insertions(+), 1 deletion(-)

--- 0002/drivers/media/platform/rcar-fcp.c
+++ work/drivers/media/platform/rcar-fcp.c	2018-11-21 18:32:58.792603934 +0900
@@ -8,10 +8,12 @@
  */
 
 #include <linux/device.h>
+#include <linux/io.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
@@ -26,6 +28,8 @@ struct rcar_fcp_device {
 static LIST_HEAD(fcp_devices);
 static DEFINE_MUTEX(fcp_lock);
 
+#define FCP_VCR 0 /* Version register at offset 0 */
+
 /* -----------------------------------------------------------------------------
  * Public API
  */
@@ -118,7 +122,7 @@ EXPORT_SYMBOL_GPL(rcar_fcp_enable);
 void rcar_fcp_disable(struct rcar_fcp_device *fcp)
 {
 	if (fcp)
-		pm_runtime_put(fcp->dev);
+		pm_runtime_put_sync(fcp->dev);
 }
 EXPORT_SYMBOL_GPL(rcar_fcp_disable);
 
@@ -144,6 +148,41 @@ static int rcar_fcp_probe(struct platfor
 
 	platform_set_drvdata(pdev, fcp);
 
+	/* self-test VCPCS on ->probe() */
+	if (of_device_get_match_data(&pdev->dev)) {
+		struct resource *io;
+		void __iomem *mmio, *mmio2;
+
+		printk("Enabling FCPCS device (Runtime PM on)\n");
+		rcar_fcp_enable(fcp);
+
+		io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		mmio = devm_ioremap_resource(&pdev->dev, io);
+		if (!IS_ERR(mmio))
+			printk("Power-on FCPCS version is 0x%08lx\n",
+			       (unsigned long) ioread32(mmio + FCP_VCR));
+
+		io = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+		mmio2 = devm_ioremap_resource(&pdev->dev, io);
+
+		if (!IS_ERR(mmio2))
+			printk("Power-on VDPB read at offset 0x200 is 0x%08lx\n",
+			       (unsigned long) ioread32(mmio2 + 0x200));
+
+		printk("Disabling FCPCS device (Runtime PM off)\n");
+		rcar_fcp_disable(fcp);
+
+#ifdef IOREAD_POWER_OFF_TEST
+		if (!IS_ERR(mmio))
+			printk("Power-off FCPCS version is 0x%08lx\n",
+			       (unsigned long) ioread32(mmio + FCP_VCR));
+
+		if (!IS_ERR(mmio2))
+			printk("Power-off VDPB read at offset 0x200 is 0x%08lx\n",
+			       (unsigned long) ioread32(mmio2 + 0x200));
+#endif
+	}
+
 	return 0;
 }
 
@@ -163,6 +202,7 @@ static int rcar_fcp_remove(struct platfo
 static const struct of_device_id rcar_fcp_of_match[] = {
 	{ .compatible = "renesas,fcpf" },
 	{ .compatible = "renesas,fcpv" },
+	{ .compatible = "renesas,fcpc", .data = &rcar_fcp_of_match[0] },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);
--- 0002/drivers/soc/renesas/rcar-sysc.c
+++ work/drivers/soc/renesas/rcar-sysc.c	2018-11-21 17:16:50.411091041 +0900
@@ -6,6 +6,7 @@
  * Copyright (C) 2015-2017 Glider bvba
  */
 
+#define DEBUG
 #include <linux/clk/renesas.h>
 #include <linux/delay.h>
 #include <linux/err.h>
