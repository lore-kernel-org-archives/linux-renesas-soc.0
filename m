Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:33945 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752388AbcD1VEh (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 28 Apr 2016 17:04:37 -0400
Received: by mail-lf0-f42.google.com with SMTP id j11so111056084lfb.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2016 14:04:36 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] rcar-du: add TCON connector driver
Date: Fri, 29 Apr 2016 00:04:33 +0300
Message-ID: <2114462.VbyThWBxQO@wasted.cogentembedded.com>
In-Reply-To: <1787748.qAADjKK4gv@wasted.cogentembedded.com>
References: <1787748.qAADjKK4gv@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas  R-Car SoCs include  the timing controller (TCON) that can directly
drive LCDs. It receives the  H/VSYNC, etc. from the Display Unit (DU)  and
converts  them to the set of signals  that a LCD panel can understand (the
RBG signals are  effectively passed thru). Add the DRM connector driver for
the LCDs connected via the TCON interface...

Based on a large patch by Andrey Gusakov.

Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/gpu/drm/rcar-du/Makefile          |    1 
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |    5 +
 drivers/gpu/drm/rcar-du/rcar_du_tconcon.c |  125 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_tconcon.h |   23 +++++
 4 files changed, 154 insertions(+)

Index: linux/drivers/gpu/drm/rcar-du/Makefile
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/Makefile
+++ linux/drivers/gpu/drm/rcar-du/Makefile
@@ -4,6 +4,7 @@ rcar-du-drm-y := rcar_du_crtc.o \
 		 rcar_du_group.o \
 		 rcar_du_kms.o \
 		 rcar_du_lvdscon.o \
+		 rcar_du_tconcon.o \
 		 rcar_du_plane.o \
 		 rcar_du_vgacon.o
 
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -24,6 +24,7 @@
 #include "rcar_du_kms.h"
 #include "rcar_du_lvdscon.h"
 #include "rcar_du_lvdsenc.h"
+#include "rcar_du_tconcon.h"
 #include "rcar_du_tconenc.h"
 #include "rcar_du_vgacon.h"
 
@@ -194,6 +195,10 @@ int rcar_du_encoder_init(struct rcar_du_
 		ret = rcar_du_vga_connector_init(rcdu, renc);
 		break;
 
+	case RCAR_DU_ENCODER_TCON:
+		ret = rcar_du_tcon_connector_init(rcdu, renc, con_node);
+		break;
+
 	case DRM_MODE_ENCODER_TMDS:
 		ret = rcar_du_hdmi_connector_init(rcdu, renc);
 		break;
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_tconcon.c
===================================================================
--- /dev/null
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_tconcon.c
@@ -0,0 +1,125 @@
+/*
+ * rcar_du_tconcon.c -- R-Car Display Unit TCON Connector
+ *
+ * Copyright (C) 2015-2016 Cogent Embedded, Inc. <source@cogentembedded.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <drm/drmP.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder_slave.h>
+
+#include <video/of_display_timing.h>
+#include <video/videomode.h>
+
+#include "rcar_du_drv.h"
+#include "rcar_du_encoder.h"
+#include "rcar_du_kms.h"
+#include "rcar_du_tconcon.h"
+
+struct rcar_du_tcon_connector {
+	struct rcar_du_connector connector;
+
+	struct {
+		unsigned int width_mm;		/* Panel width in mm */
+		unsigned int height_mm;		/* Panel height in mm */
+		struct videomode mode;
+	} panel;
+};
+
+#define to_rcar_tcon_connector(c) \
+	container_of(c, struct rcar_du_tcon_connector, connector.connector)
+
+static int rcar_du_tcon_connector_get_modes(struct drm_connector *connector)
+{
+	struct rcar_du_tcon_connector *tconcon =
+		to_rcar_tcon_connector(connector);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_create(connector->dev);
+	if (mode == NULL)
+		return 0;
+
+	mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
+
+	drm_display_mode_from_videomode(&tconcon->panel.mode, mode);
+
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_connector_helper_funcs connector_helper_funcs = {
+	.get_modes = rcar_du_tcon_connector_get_modes,
+	.best_encoder = rcar_du_connector_best_encoder,
+};
+
+static enum drm_connector_status
+rcar_du_tcon_connector_detect(struct drm_connector *connector, bool force)
+{
+	return connector_status_connected;
+}
+
+static const struct drm_connector_funcs connector_funcs = {
+	.dpms = drm_atomic_helper_connector_dpms,
+	.reset = drm_atomic_helper_connector_reset,
+	.detect = rcar_du_tcon_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+int rcar_du_tcon_connector_init(struct rcar_du_device *rcdu,
+				struct rcar_du_encoder *renc,
+				/* TODO const */ struct device_node *np)
+{
+	struct drm_encoder *encoder = rcar_encoder_to_drm_encoder(renc);
+	struct rcar_du_tcon_connector *tconcon;
+	struct drm_connector *connector;
+	struct display_timing timing;
+	int ret;
+
+	tconcon = devm_kzalloc(rcdu->dev, sizeof(*tconcon), GFP_KERNEL);
+	if (tconcon == NULL)
+		return -ENOMEM;
+
+	ret = of_get_display_timing(np, "panel-timing", &timing);
+	if (ret < 0)
+		return ret;
+
+	videomode_from_timing(&timing, &tconcon->panel.mode);
+
+	of_property_read_u32(np, "width-mm", &tconcon->panel.width_mm);
+	of_property_read_u32(np, "height-mm", &tconcon->panel.height_mm);
+
+	connector = &tconcon->connector.connector;
+	connector->display_info.width_mm = tconcon->panel.width_mm;
+	connector->display_info.height_mm = tconcon->panel.height_mm;
+
+	ret = drm_connector_init(rcdu->ddev, connector, &connector_funcs,
+				 DRM_MODE_CONNECTOR_TCON);
+	if (ret < 0)
+		return ret;
+
+	drm_connector_helper_add(connector, &connector_helper_funcs);
+
+	connector->dpms = DRM_MODE_DPMS_OFF;
+	drm_object_property_set_value(&connector->base,
+		rcdu->ddev->mode_config.dpms_property, DRM_MODE_DPMS_OFF);
+
+	ret = drm_mode_connector_attach_encoder(connector, encoder);
+	if (ret < 0)
+		return ret;
+
+	tconcon->connector.encoder = renc;
+
+	return 0;
+}
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_tconcon.h
===================================================================
--- /dev/null
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_tconcon.h
@@ -0,0 +1,23 @@
+/*
+ * rcar_du_tconcon.h -- R-Car Display Unit LVDS Connector
+ *
+ * Copyright (C) 2015-2016 CogentEmbedded, Inc. <source@cogentembedded.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __RCAR_DU_TCONCON_H__
+#define __RCAR_DU_TCONCON_H__
+
+struct rcar_du_device;
+struct rcar_du_encoder;
+struct rcar_du_panel_data;
+
+int rcar_du_tcon_connector_init(struct rcar_du_device *rcdu,
+				struct rcar_du_encoder *renc,
+				struct device_node *np);
+
+#endif /* __RCAR_DU_TCONCON_H__ */
