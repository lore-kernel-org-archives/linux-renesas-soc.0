Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54385 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967963AbdIZKGU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:20 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 4B99E21507
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:06 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 08/13] v4l: rcar-fcp: Check device revision at probe time
Date: Tue, 26 Sep 2017 13:06:00 +0300
Message-Id: <20170926100605.2313-11-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Verify that the device revision register reports a valid value,
otherwise reject the device.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-fcp.c | 139 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 132 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index 2988031d285d..ddbc960f8458 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -12,24 +12,84 @@
  */
 
 #include <linux/device.h>
+#include <linux/io.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include <media/rcar-fcp.h>
 
+#define FCP_VCR				0x0000
+#define FCP_VCR_CATEGORY		(1 << 8)
+#define FCP_VCR_REVISION_H3_ES1		(1 << 0)
+#define FCP_VCR_REVISION_M3W		(2 << 0)
+#define FCP_VCR_REVISION_V3M		(3 << 0)
+#define FCP_VCR_REVISION_H3		(4 << 0)
+#define FCP_VCR_REVISION_D3		(5 << 0)
+#define FCP_VCR_REVISION_M3N		(6 << 0)
+#define FCP_VCR_REVISION_V3H		(7 << 0)
+#define FCP_VCR_REVISION_E3		(8 << 0)
+
+#define FCP_CFG0			0x0004
+#define FCP_CFG0_FCPVSEL		BIT(1)
+
+#define FCP_RST				0x0010
+#define FCP_RST_RIIFRST			BIT(22)
+#define FCP_RST_RSIFRST			BIT(21)
+#define FCP_RST_DCMPRST			BIT(20)
+#define FCP_RST_MODRST			BIT(4)
+#define FCP_RST_SOFTRST			BIT(0)
+
+#define FCP_STA				0x0018
+#define FCP_STA_ACT			BIT(0)
+
+#define FCP_TL_CTRL			0x0070
+#define FCP_TL_CTRL_TLEN		BIT(31)
+#define FCP_TL_CTRL_VPOS_C(n)		((n) << 16)
+#define FCP_TL_CTRL_VPOS_Y(n)		((n) << 0)
+
+#define FCP_PICINFO1			0x00c4
+#define FCP_PICINFO1_STRIDE_DIV16	((n) << 0)
+
+#define FCP_BA_ANC_Y0			0x0100
+#define FCP_BA_ANC_Y1			0x0104
+#define FCP_BA_ANC_Y2			0x0108
+#define FCP_BA_ANC_C			0x010c
+#define FCP_BA_REF_Y0			0x0110
+#define FCP_BA_REF_Y1			0x0114
+#define FCP_BA_REF_Y2			0x0118
+#define FCP_BA_REF_C			0x011c
+
+enum rcar_fcp_type {
+	RCAR_FCPF,
+	RCAR_FCPV,
+};
+
 struct rcar_fcp_device {
 	struct list_head list;
 	struct device *dev;
+
+	enum rcar_fcp_type type;
+	void __iomem *mmio;
 };
 
 static LIST_HEAD(fcp_devices);
 static DEFINE_MUTEX(fcp_lock);
 
 /* -----------------------------------------------------------------------------
+ * Device Configuration
+ */
+
+static u32 rcar_fcp_read(struct rcar_fcp_device *fcp, unsigned int reg)
+{
+	return ioread32(fcp->mmio + reg);
+}
+
+/* -----------------------------------------------------------------------------
  * Public API
  */
 
@@ -129,17 +189,83 @@ EXPORT_SYMBOL_GPL(rcar_fcp_disable);
  * Platform Driver
  */
 
+static int rcar_fcp_setup(struct rcar_fcp_device *fcp)
+{
+	static const char * const models[] = {
+		[RCAR_FCPF] = "FCPF",
+		[RCAR_FCPV] = "FCPV",
+	};
+	static struct {
+		u32 version;
+		const char *name;
+	} versions[] = {
+		{ FCP_VCR_CATEGORY | FCP_VCR_REVISION_H3_ES1, "H3 ES1.x" },
+		{ FCP_VCR_CATEGORY | FCP_VCR_REVISION_M3W, "M3W" },
+		{ FCP_VCR_CATEGORY | FCP_VCR_REVISION_V3M, "V3M" },
+		{ FCP_VCR_CATEGORY | FCP_VCR_REVISION_H3, "H3" },
+		{ FCP_VCR_CATEGORY | FCP_VCR_REVISION_D3, "D3" },
+		{ FCP_VCR_CATEGORY | FCP_VCR_REVISION_M3N, "M3N" },
+		{ FCP_VCR_CATEGORY | FCP_VCR_REVISION_V3H, "V3H" },
+		{ FCP_VCR_CATEGORY | FCP_VCR_REVISION_E3, "E3" },
+	};
+
+	unsigned int i;
+	u32 version;
+
+	/* Check the device version register. */
+	version = rcar_fcp_read(fcp, FCP_VCR);
+
+	for (i = 0; i < ARRAY_SIZE(versions); ++i) {
+		if (versions[i].version == version)
+			break;
+	}
+
+	if (i >= ARRAY_SIZE(versions)) {
+		dev_err(fcp->dev, "Invalid FCP version 0x%08x\n", version);
+		return -ENODEV;
+	}
+
+	dev_dbg(fcp->dev, "%s %s device found\n", models[fcp->type],
+		versions[i].name);
+
+	return 0;
+}
+
+static const struct of_device_id rcar_fcp_of_match[] = {
+	{ .compatible = "renesas,fcpf", .data = (void *)RCAR_FCPF },
+	{ .compatible = "renesas,fcpv", .data = (void *)RCAR_FCPV },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);
+
 static int rcar_fcp_probe(struct platform_device *pdev)
 {
 	struct rcar_fcp_device *fcp;
+	struct resource *io;
+	int ret;
 
 	fcp = devm_kzalloc(&pdev->dev, sizeof(*fcp), GFP_KERNEL);
 	if (fcp == NULL)
 		return -ENOMEM;
 
 	fcp->dev = &pdev->dev;
+	fcp->type = (enum rcar_fcp_type)of_device_get_match_data(&pdev->dev);
+
+	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	fcp->mmio = devm_ioremap_resource(&pdev->dev, io);
+	if (IS_ERR(fcp->mmio))
+		return PTR_ERR(fcp->mmio);
 
 	pm_runtime_enable(&pdev->dev);
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0)
+		goto error_pm_disable;
+
+	ret = rcar_fcp_setup(fcp);
+	if (ret < 0)
+		goto error_pm_put;
+
+	pm_runtime_put(&pdev->dev);
 
 	mutex_lock(&fcp_lock);
 	list_add_tail(&fcp->list, &fcp_devices);
@@ -148,6 +274,12 @@ static int rcar_fcp_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, fcp);
 
 	return 0;
+
+error_pm_put:
+	pm_runtime_put(&pdev->dev);
+error_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
 }
 
 static int rcar_fcp_remove(struct platform_device *pdev)
@@ -163,13 +295,6 @@ static int rcar_fcp_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id rcar_fcp_of_match[] = {
-	{ .compatible = "renesas,fcpf" },
-	{ .compatible = "renesas,fcpv" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);
-
 static struct platform_driver rcar_fcp_platform_driver = {
 	.probe		= rcar_fcp_probe,
 	.remove		= rcar_fcp_remove,
-- 
Regards,

Laurent Pinchart
