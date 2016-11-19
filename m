Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55229 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752380AbcKSDsQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 22:48:16 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/9] drm: bridge: Add LVDS encoder driver
Date: Sat, 19 Nov 2016 05:48:15 +0200
Message-Id: <1479527302-7674-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1479527302-7674-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479527302-7674-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The LVDS encoder driver is a DRM bridge driver that supports the
parallel to LVDS encoders that don't require any configuration. The
driver thus doesn't interact with the device, but creates an LVDS
connector for the panel and exposes its size and timing based on
information retrieved from DT.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/Kconfig        |   8 ++
 drivers/gpu/drm/bridge/Makefile       |   1 +
 drivers/gpu/drm/bridge/lvds-encoder.c | 203 ++++++++++++++++++++++++++++++++++
 3 files changed, 212 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 10e12e74fc9f..5dafad7817ad 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -24,6 +24,14 @@ config DRM_DUMB_VGA_DAC
 	help
 	  Support for RGB to VGA DAC based bridges
 
+config DRM_LVDS_ENCODER
+	tristate "Transparent parallel to LVDS encoder support"
+	depends on OF
+	select DRM_KMS_HELPER
+	help
+	  Support for transparent parallel to LVDS encoders that don't require
+	  any configuration.
+
 config DRM_DW_HDMI
 	tristate
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index cdf3a3cf765d..bbaf583581ac 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -2,6 +2,7 @@ ccflags-y := -Iinclude/drm
 
 obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
 obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
+obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
 obj-$(CONFIG_DRM_DW_HDMI) += dw-hdmi.o
 obj-$(CONFIG_DRM_DW_HDMI_AHB_AUDIO) += dw-hdmi-ahb-audio.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-encoder.c
new file mode 100644
index 000000000000..33e8025c8a6d
--- /dev/null
+++ b/drivers/gpu/drm/bridge/lvds-encoder.c
@@ -0,0 +1,203 @@
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
+
+#include <linux/of_graph.h>
+
+#include <video/display_timing.h>
+#include <video/of_display_timing.h>
+#include <video/videomode.h>
+
+struct lvds_encoder {
+	struct device *dev;
+
+	struct drm_bridge bridge;
+	struct drm_connector connector;
+
+	struct {
+		unsigned int width_mm;
+		unsigned int height_mm;
+		struct videomode mode;
+	} panel;
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
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_create(connector->dev);
+	if (mode == NULL)
+		return 0;
+
+	mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
+
+	drm_display_mode_from_videomode(&lvds->panel.mode, mode);
+
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_connector_helper_funcs lvds_connector_helper_funcs = {
+	.get_modes = lvds_connector_get_modes,
+};
+
+static enum drm_connector_status
+lvds_connector_detect(struct drm_connector *connector, bool force)
+{
+	return connector_status_connected;
+}
+
+static const struct drm_connector_funcs lvds_connector_funcs = {
+	.dpms = drm_atomic_helper_connector_dpms,
+	.reset = drm_atomic_helper_connector_reset,
+	.detect = lvds_connector_detect,
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
+	connector->display_info.width_mm = lvds->panel.width_mm;
+	connector->display_info.height_mm = lvds->panel.height_mm;
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
+	return 0;
+}
+
+static const struct drm_bridge_funcs lvds_encoder_bridge_funcs = {
+	.attach = lvds_encoder_attach,
+};
+
+static int lvds_encoder_probe(struct platform_device *pdev)
+{
+	struct lvds_encoder *lvds;
+	struct display_timing timing;
+	struct device_node *port;
+	struct device_node *endpoint;
+	struct device_node *panel;
+	int ret;
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
+	lvds->bridge.encoder_type = DRM_MODE_ENCODER_LVDS;
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
+	/* Parse and store panel information. */
+	ret = of_get_display_timing(panel, "panel-timing", &timing);
+	of_node_put(panel);
+	if (ret < 0) {
+		dev_dbg(&pdev->dev, "unable to parse panel timings\n");
+		return ret;
+	}
+
+	videomode_from_timing(&timing, &lvds->panel.mode);
+
+	of_property_read_u32(panel, "width-mm", &lvds->panel.width_mm);
+	of_property_read_u32(panel, "height-mm", &lvds->panel.height_mm);
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
