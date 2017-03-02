Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56843 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751055AbdCBKtJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Mar 2017 05:49:09 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v4 2/4] drm: bridge: Add LVDS encoder driver
Date: Thu,  2 Mar 2017 12:47:26 +0200
Message-Id: <20170302104728.7150-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170302104728.7150-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170302104728.7150-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The LVDS encoder driver is a DRM bridge driver that supports the
parallel to LVDS encoders that don't require any configuration. The
driver thus doesn't interact with the device, but creates an LVDS
connector for the panel and exposes its size and timing based on
information retrieved from DT.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Daniel Vetter <daniel@ffwll.ch>
---
Changes since v3:

- Dropped encoder_type
- Added a Kconfig dependency on DRM_PANEL
---
 drivers/gpu/drm/bridge/Kconfig        |   9 ++
 drivers/gpu/drm/bridge/Makefile       |   1 +
 drivers/gpu/drm/bridge/lvds-encoder.c | 209 ++++++++++++++++++++++++++++++++++
 3 files changed, 219 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index eb8688ec6f18..0c62d6ee1c88 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -24,6 +24,15 @@ config DRM_DUMB_VGA_DAC
 	help
 	  Support for RGB to VGA DAC based bridges
 
+config DRM_LVDS_ENCODER
+	tristate "Transparent parallel to LVDS encoder support"
+	depends on OF
+	select DRM_KMS_HELPER
+	select DRM_PANEL
+	help
+	  Support for transparent parallel to LVDS encoders that don't require
+	  any configuration.
+
 config DRM_DW_HDMI
 	tristate
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 2e83a7855399..f675ecabb609 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -2,6 +2,7 @@ ccflags-y := -Iinclude/drm
 
 obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
 obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
+obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
 obj-$(CONFIG_DRM_DW_HDMI) += dw-hdmi.o
 obj-$(CONFIG_DRM_DW_HDMI_AHB_AUDIO) += dw-hdmi-ahb-audio.o
 obj-$(CONFIG_DRM_DW_HDMI_I2S_AUDIO) += dw-hdmi-i2s-audio.o
diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-encoder.c
new file mode 100644
index 000000000000..d817d78b893d
--- /dev/null
+++ b/drivers/gpu/drm/bridge/lvds-encoder.c
@@ -0,0 +1,209 @@
+/*
+ * Copyright (C) 2016 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ */
+
+#include <drm/drmP.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_panel.h>
+
+#include <linux/of_graph.h>
+
+struct lvds_encoder {
+	struct device *dev;
+
+	struct drm_bridge bridge;
+	struct drm_connector connector;
+	struct drm_panel *panel;
+};
+
+static inline struct lvds_encoder *
+drm_bridge_to_lvds_encoder(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct lvds_encoder, bridge);
+}
+
+static inline struct lvds_encoder *
+drm_connector_to_lvds_encoder(struct drm_connector *connector)
+{
+	return container_of(connector, struct lvds_encoder, connector);
+}
+
+static int lvds_connector_get_modes(struct drm_connector *connector)
+{
+	struct lvds_encoder *lvds = drm_connector_to_lvds_encoder(connector);
+
+	return drm_panel_get_modes(lvds->panel);
+}
+
+static const struct drm_connector_helper_funcs lvds_connector_helper_funcs = {
+	.get_modes = lvds_connector_get_modes,
+};
+
+static const struct drm_connector_funcs lvds_connector_funcs = {
+	.dpms = drm_atomic_helper_connector_dpms,
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int lvds_encoder_attach(struct drm_bridge *bridge)
+{
+	struct lvds_encoder *lvds = drm_bridge_to_lvds_encoder(bridge);
+	struct drm_connector *connector = &lvds->connector;
+	int ret;
+
+	if (!bridge->encoder) {
+		DRM_ERROR("Missing encoder\n");
+		return -ENODEV;
+	}
+
+	drm_connector_helper_add(connector, &lvds_connector_helper_funcs);
+
+	ret = drm_connector_init(bridge->dev, connector, &lvds_connector_funcs,
+				 DRM_MODE_CONNECTOR_LVDS);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector\n");
+		return ret;
+	}
+
+	drm_mode_connector_attach_encoder(&lvds->connector, bridge->encoder);
+
+	ret = drm_panel_attach(lvds->panel, &lvds->connector);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static void lvds_encoder_detach(struct drm_bridge *bridge)
+{
+	struct lvds_encoder *lvds = drm_bridge_to_lvds_encoder(bridge);
+
+	drm_panel_detach(lvds->panel);
+}
+
+static void lvds_encoder_pre_enable(struct drm_bridge *bridge)
+{
+	struct lvds_encoder *lvds = drm_bridge_to_lvds_encoder(bridge);
+
+	drm_panel_prepare(lvds->panel);
+}
+
+static void lvds_encoder_enable(struct drm_bridge *bridge)
+{
+	struct lvds_encoder *lvds = drm_bridge_to_lvds_encoder(bridge);
+
+	drm_panel_enable(lvds->panel);
+}
+
+static void lvds_encoder_disable(struct drm_bridge *bridge)
+{
+	struct lvds_encoder *lvds = drm_bridge_to_lvds_encoder(bridge);
+
+	drm_panel_disable(lvds->panel);
+}
+
+static void lvds_encoder_post_disable(struct drm_bridge *bridge)
+{
+	struct lvds_encoder *lvds = drm_bridge_to_lvds_encoder(bridge);
+
+	drm_panel_unprepare(lvds->panel);
+}
+
+static const struct drm_bridge_funcs lvds_encoder_bridge_funcs = {
+	.attach = lvds_encoder_attach,
+	.detach = lvds_encoder_detach,
+	.pre_enable = lvds_encoder_pre_enable,
+	.enable = lvds_encoder_enable,
+	.disable = lvds_encoder_disable,
+	.post_disable = lvds_encoder_post_disable,
+};
+
+static int lvds_encoder_probe(struct platform_device *pdev)
+{
+	struct lvds_encoder *lvds;
+	struct device_node *port;
+	struct device_node *endpoint;
+	struct device_node *panel;
+
+	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
+	if (!lvds)
+		return -ENOMEM;
+
+	lvds->dev = &pdev->dev;
+	platform_set_drvdata(pdev, lvds);
+
+	lvds->bridge.funcs = &lvds_encoder_bridge_funcs;
+	lvds->bridge.of_node = pdev->dev.of_node;
+
+	/* Locate the panel DT node. */
+	port = of_graph_get_port_by_id(pdev->dev.of_node, 1);
+	if (!port) {
+		dev_dbg(&pdev->dev, "port 1 not found\n");
+		return -ENXIO;
+	}
+
+	endpoint = of_get_child_by_name(port, "endpoint");
+	of_node_put(port);
+	if (!endpoint) {
+		dev_dbg(&pdev->dev, "no endpoint for port 1\n");
+		return -ENXIO;
+	}
+
+	panel = of_graph_get_remote_port_parent(endpoint);
+	of_node_put(endpoint);
+	if (!panel) {
+		dev_dbg(&pdev->dev, "no remote endpoint for port 1\n");
+		return -ENXIO;
+	}
+
+	lvds->panel = of_drm_find_panel(panel);
+	of_node_put(panel);
+	if (!lvds->panel) {
+		dev_dbg(&pdev->dev, "panel not found, deferring probe\n");
+		return -EPROBE_DEFER;
+	}
+
+	/* Register the bridge. */
+	return drm_bridge_add(&lvds->bridge);
+}
+
+static int lvds_encoder_remove(struct platform_device *pdev)
+{
+	struct lvds_encoder *encoder = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&encoder->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id lvds_encoder_match[] = {
+	{ .compatible = "lvds-encoder" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, lvds_encoder_match);
+
+struct platform_driver lvds_encoder_driver = {
+	.probe	= lvds_encoder_probe,
+	.remove	= lvds_encoder_remove,
+	.driver		= {
+		.name		= "lvds-encoder",
+		.of_match_table	= lvds_encoder_match,
+	},
+};
+module_platform_driver(lvds_encoder_driver);
+
+MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
+MODULE_DESCRIPTION("Transparent parallel to LVDS encoder");
+MODULE_LICENSE("GPL");
-- 
Regards,

Laurent Pinchart
