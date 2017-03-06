Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60007 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752487AbdCFAOl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Mar 2017 19:14:41 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 6/9] drm: rcar-du: Add Gen3 HDMI encoder support
Date: Mon,  6 Mar 2017 02:02:59 +0200
Message-Id: <20170306000302.14149-7-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170306000302.14149-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170306000302.14149-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

The R-Car Gen3 SoCs include on-chip DesignWare HDMI encoders. Support
them with a platform driver to provide platform glue data to the dw-hdmi
driver.

The driver is a complete rewrite of code coming from the Renesas BSP,
save for the values in the PHY parameters table.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Changes since v2:

- Replaced the dependency on DRM_RCAR_DU with DRM and made the symbol
  tristate.
---
 drivers/gpu/drm/rcar-du/Kconfig        |   7 +++
 drivers/gpu/drm/rcar-du/Makefile       |   1 +
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c | 100 +++++++++++++++++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 06121eeba9e5..8a50dab19e5c 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -11,6 +11,13 @@ config DRM_RCAR_DU
 	  Choose this option if you have an R-Car chipset.
 	  If M is selected the module will be called rcar-du-drm.
 
+config DRM_RCAR_DW_HDMI
+	tristate "R-Car DU Gen3 HDMI Encoder Support"
+	depends on DRM && OF
+	select DRM_DW_HDMI
+	help
+	  Enable support for R-Car Gen3 internal HDMI encoder.
+
 config DRM_RCAR_LVDS
 	bool "R-Car DU LVDS Encoder Support"
 	depends on DRM_RCAR_DU
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index a492e6858691..2131e722de3b 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -11,3 +11,4 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_lvdsenc.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
+obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
new file mode 100644
index 000000000000..7539626b8ebd
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
@@ -0,0 +1,100 @@
+/*
+ * R-Car Gen3 HDMI PHY
+ *
+ * Copyright (C) 2016 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <drm/bridge/dw_hdmi.h>
+
+#define RCAR_HDMI_PHY_OPMODE_PLLCFG	0x06	/* Mode of operation and PLL dividers */
+#define RCAR_HDMI_PHY_PLLCURRGMPCTRL	0x10	/* PLL current and Gmp (conductance) */
+#define RCAR_HDMI_PHY_PLLDIVCTRL	0x11	/* PLL dividers */
+
+struct rcar_hdmi_phy_params {
+	unsigned long mpixelclock;
+	u16 opmode_div;	/* Mode of operation and PLL dividers */
+	u16 curr_gmp;	/* PLL current and Gmp (conductance) */
+	u16 div;	/* PLL dividers */
+};
+
+static const struct rcar_hdmi_phy_params rcar_hdmi_phy_params[] = {
+	{ 35500000,  0x0003, 0x0344, 0x0328 },
+	{ 44900000,  0x0003, 0x0285, 0x0128 },
+	{ 71000000,  0x0002, 0x1184, 0x0314 },
+	{ 90000000,  0x0002, 0x1144, 0x0114 },
+	{ 140250000, 0x0001, 0x20c4, 0x030a },
+	{ 182750000, 0x0001, 0x2084, 0x010a },
+	{ 281250000, 0x0000, 0x0084, 0x0305 },
+	{ 297000000, 0x0000, 0x0084, 0x0105 },
+	{ ~0UL,      0x0000, 0x0000, 0x0000 },
+};
+
+static int rcar_hdmi_phy_configure(struct dw_hdmi *hdmi,
+				   const struct dw_hdmi_plat_data *pdata,
+				   unsigned long mpixelclock)
+{
+	const struct rcar_hdmi_phy_params *params = rcar_hdmi_phy_params;
+
+	for (; params && params->mpixelclock != ~0UL; ++params) {
+		if (mpixelclock <= params->mpixelclock)
+			break;
+	}
+
+	if (params->mpixelclock == ~0UL)
+		return -EINVAL;
+
+	dw_hdmi_phy_i2c_write(hdmi, params->opmode_div,
+			      RCAR_HDMI_PHY_OPMODE_PLLCFG);
+	dw_hdmi_phy_i2c_write(hdmi, params->curr_gmp,
+			      RCAR_HDMI_PHY_PLLCURRGMPCTRL);
+	dw_hdmi_phy_i2c_write(hdmi, params->div, RCAR_HDMI_PHY_PLLDIVCTRL);
+
+	return 0;
+}
+
+static const struct dw_hdmi_plat_data rcar_dw_hdmi_plat_data = {
+	.configure_phy	= rcar_hdmi_phy_configure,
+};
+
+static int rcar_dw_hdmi_probe(struct platform_device *pdev)
+{
+	return dw_hdmi_probe(pdev, &rcar_dw_hdmi_plat_data);
+}
+
+static int rcar_dw_hdmi_remove(struct platform_device *pdev)
+{
+	dw_hdmi_remove(pdev);
+
+	return 0;
+}
+
+static const struct of_device_id rcar_dw_hdmi_of_table[] = {
+	{ .compatible = "renesas,rcar-gen3-hdmi" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, rcar_dw_hdmi_of_table);
+
+static struct platform_driver rcar_dw_hdmi_platform_driver = {
+	.probe		= rcar_dw_hdmi_probe,
+	.remove		= rcar_dw_hdmi_remove,
+	.driver		= {
+		.name	= "rcar-dw-hdmi",
+		.of_match_table = rcar_dw_hdmi_of_table,
+	},
+};
+
+module_platform_driver(rcar_dw_hdmi_platform_driver);
+
+MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
+MODULE_DESCRIPTION("Renesas R-Car Gen3 HDMI Encoder Driver");
+MODULE_LICENSE("GPL");
-- 
Regards,

Laurent Pinchart
