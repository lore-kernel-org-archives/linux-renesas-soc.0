Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35069 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938531AbcJSOOG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2016 10:14:06 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 7/8] drm: rcar-du: Replace manual VGA DAC implementation with DRM bridge
Date: Wed, 19 Oct 2016 17:07:55 +0300
Message-Id: <1476886076-24178-8-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1476886076-24178-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476886076-24178-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Kconfig           |   6 --
 drivers/gpu/drm/rcar-du/Makefile          |   5 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  52 ++++++++----
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h |   2 -
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c | 137 ------------------------------
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h |  35 --------
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c  |  82 ------------------
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h  |  23 -----
 8 files changed, 35 insertions(+), 307 deletions(-)
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 4c2fd056dd6d..c222dc157494 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -11,12 +11,6 @@ config DRM_RCAR_DU
 	  Choose this option if you have an R-Car chipset.
 	  If M is selected the module will be called rcar-du-drm.
 
-config DRM_RCAR_HDMI
-	bool "R-Car DU HDMI Encoder Support"
-	depends on DRM_RCAR_DU
-	help
-	  Enable support for external HDMI encoders.
-
 config DRM_RCAR_LVDS
 	bool "R-Car DU LVDS Encoder Support"
 	depends on DRM_RCAR_DU
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index d3b44651061a..a492e6858691 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -4,10 +4,7 @@ rcar-du-drm-y := rcar_du_crtc.o \
 		 rcar_du_group.o \
 		 rcar_du_kms.o \
 		 rcar_du_lvdscon.o \
-		 rcar_du_plane.o \
-		 rcar_du_vgacon.o
-
-rcar-du-drm-$(CONFIG_DRM_RCAR_HDMI)	+= rcar_du_hdmienc.o
+		 rcar_du_plane.o
 
 rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_lvdsenc.o
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index ab8645c57e2d..61aaf746b2d6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -19,11 +19,9 @@
 
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
-#include "rcar_du_hdmienc.h"
 #include "rcar_du_kms.h"
 #include "rcar_du_lvdscon.h"
 #include "rcar_du_lvdsenc.h"
-#include "rcar_du_vgacon.h"
 
 /* -----------------------------------------------------------------------------
  * Encoder
@@ -56,8 +54,12 @@ static int rcar_du_encoder_atomic_check(struct drm_encoder *encoder,
 	struct drm_connector *connector = conn_state->connector;
 	struct drm_device *dev = encoder->dev;
 
-	/* DAC encoders have currently no restriction on the mode. */
-	if (encoder->encoder_type == DRM_MODE_ENCODER_DAC)
+	/*
+	 * Only panel-related encoder types require validation here, everything
+	 * else is handled by the bridge drivers.
+	 */
+	if (encoder->encoder_type != DRM_MODE_ENCODER_NONE &&
+	    encoder->encoder_type != DRM_MODE_ENCODER_LVDS)
 		return 0;
 
 	if (list_empty(&connector->modes)) {
@@ -110,6 +112,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 {
 	struct rcar_du_encoder *renc;
 	struct drm_encoder *encoder;
+	struct drm_bridge *bridge = NULL;
 	unsigned int encoder_type;
 	int ret;
 
@@ -133,6 +136,15 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		break;
 	}
 
+	if (enc_node) {
+		/* Locate the DRM bridge from the encoder DT node. */
+		bridge = of_drm_find_bridge(enc_node);
+		if (!bridge) {
+			ret = -EPROBE_DEFER;
+			goto done;
+		}
+	}
+
 	switch (type) {
 	case RCAR_DU_ENCODER_VGA:
 		encoder_type = DRM_MODE_ENCODER_DAC;
@@ -150,30 +162,34 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		break;
 	}
 
-	if (type == RCAR_DU_ENCODER_HDMI) {
-		ret = rcar_du_hdmienc_init(rcdu, renc, enc_node);
-		if (ret < 0)
-			goto done;
-	} else {
-		ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
-				       encoder_type, NULL);
-		if (ret < 0)
-			goto done;
+	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
+			       encoder_type, NULL);
+	if (ret < 0)
+		goto done;
 
-		drm_encoder_helper_add(encoder, &encoder_helper_funcs);
+	drm_encoder_helper_add(encoder, &encoder_helper_funcs);
+
+	/* Link the bridge to the encoder. */
+	if (bridge) {
+		bridge->encoder = encoder;
+		encoder->bridge = bridge;
+
+		ret = drm_bridge_attach(rcdu->ddev, bridge);
+		if (ret) {
+			drm_encoder_cleanup(encoder);
+			return ret;
+		}
 	}
 
+	/* Create the connector. */
 	switch (encoder_type) {
 	case DRM_MODE_ENCODER_LVDS:
 		ret = rcar_du_lvds_connector_init(rcdu, renc, con_node);
 		break;
 
 	case DRM_MODE_ENCODER_DAC:
-		ret = rcar_du_vga_connector_init(rcdu, renc);
-		break;
-
 	case DRM_MODE_ENCODER_TMDS:
-		/* connector managed by the bridge driver */
+		/* Connector managed by the bridge driver. */
 		break;
 
 	default:
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index 7fc10a9c34c3..5609a0b8d7e6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -17,7 +17,6 @@
 #include <drm/drm_crtc.h>
 
 struct rcar_du_device;
-struct rcar_du_hdmienc;
 struct rcar_du_lvdsenc;
 
 enum rcar_du_encoder_type {
@@ -31,7 +30,6 @@ enum rcar_du_encoder_type {
 struct rcar_du_encoder {
 	struct drm_encoder base;
 	enum rcar_du_output output;
-	struct rcar_du_hdmienc *hdmi;
 	struct rcar_du_lvdsenc *lvds;
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c b/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
deleted file mode 100644
index f9515f53cc5b..000000000000
--- a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
+++ /dev/null
@@ -1,137 +0,0 @@
-/*
- * R-Car Display Unit HDMI Encoder
- *
- * Copyright (C) 2014 Renesas Electronics Corporation
- *
- * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
-
-#include <linux/slab.h>
-
-#include <drm/drmP.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
-
-#include "rcar_du_drv.h"
-#include "rcar_du_encoder.h"
-#include "rcar_du_hdmienc.h"
-#include "rcar_du_lvdsenc.h"
-
-struct rcar_du_hdmienc {
-	struct rcar_du_encoder *renc;
-	bool enabled;
-};
-
-#define to_rcar_hdmienc(e)	(to_rcar_encoder(e)->hdmi)
-
-static void rcar_du_hdmienc_disable(struct drm_encoder *encoder)
-{
-	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
-
-	if (hdmienc->renc->lvds)
-		rcar_du_lvdsenc_enable(hdmienc->renc->lvds, encoder->crtc,
-				       false);
-
-	hdmienc->enabled = false;
-}
-
-static void rcar_du_hdmienc_enable(struct drm_encoder *encoder)
-{
-	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
-
-	if (hdmienc->renc->lvds)
-		rcar_du_lvdsenc_enable(hdmienc->renc->lvds, encoder->crtc,
-				       true);
-
-	hdmienc->enabled = true;
-}
-
-static int rcar_du_hdmienc_atomic_check(struct drm_encoder *encoder,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state)
-{
-	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
-	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
-
-	if (hdmienc->renc->lvds)
-		rcar_du_lvdsenc_atomic_check(hdmienc->renc->lvds,
-					     adjusted_mode);
-
-	return 0;
-}
-
-
-static void rcar_du_hdmienc_mode_set(struct drm_encoder *encoder,
-				     struct drm_display_mode *mode,
-				     struct drm_display_mode *adjusted_mode)
-{
-	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
-
-	rcar_du_crtc_route_output(encoder->crtc, hdmienc->renc->output);
-}
-
-static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
-	.mode_set = rcar_du_hdmienc_mode_set,
-	.disable = rcar_du_hdmienc_disable,
-	.enable = rcar_du_hdmienc_enable,
-	.atomic_check = rcar_du_hdmienc_atomic_check,
-};
-
-static void rcar_du_hdmienc_cleanup(struct drm_encoder *encoder)
-{
-	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
-
-	if (hdmienc->enabled)
-		rcar_du_hdmienc_disable(encoder);
-
-	drm_encoder_cleanup(encoder);
-}
-
-static const struct drm_encoder_funcs encoder_funcs = {
-	.destroy = rcar_du_hdmienc_cleanup,
-};
-
-int rcar_du_hdmienc_init(struct rcar_du_device *rcdu,
-			 struct rcar_du_encoder *renc, struct device_node *np)
-{
-	struct drm_encoder *encoder = rcar_encoder_to_drm_encoder(renc);
-	struct drm_bridge *bridge;
-	struct rcar_du_hdmienc *hdmienc;
-	int ret;
-
-	hdmienc = devm_kzalloc(rcdu->dev, sizeof(*hdmienc), GFP_KERNEL);
-	if (hdmienc == NULL)
-		return -ENOMEM;
-
-	/* Locate the DRM bridge from the HDMI encoder DT node. */
-	bridge = of_drm_find_bridge(np);
-	if (!bridge)
-		return -EPROBE_DEFER;
-
-	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
-	if (ret < 0)
-		return ret;
-
-	drm_encoder_helper_add(encoder, &encoder_helper_funcs);
-
-	renc->hdmi = hdmienc;
-	hdmienc->renc = renc;
-
-	/* Link the bridge to the encoder. */
-	bridge->encoder = encoder;
-	encoder->bridge = bridge;
-
-	ret = drm_bridge_attach(rcdu->ddev, bridge);
-	if (ret) {
-		drm_encoder_cleanup(encoder);
-		return ret;
-	}
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h b/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h
deleted file mode 100644
index 2ff0128ac8e1..000000000000
--- a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h
+++ /dev/null
@@ -1,35 +0,0 @@
-/*
- * R-Car Display Unit HDMI Encoder
- *
- * Copyright (C) 2014 Renesas Electronics Corporation
- *
- * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
-
-#ifndef __RCAR_DU_HDMIENC_H__
-#define __RCAR_DU_HDMIENC_H__
-
-#include <linux/module.h>
-
-struct device_node;
-struct rcar_du_device;
-struct rcar_du_encoder;
-
-#if IS_ENABLED(CONFIG_DRM_RCAR_HDMI)
-int rcar_du_hdmienc_init(struct rcar_du_device *rcdu,
-			 struct rcar_du_encoder *renc, struct device_node *np);
-#else
-static inline int rcar_du_hdmienc_init(struct rcar_du_device *rcdu,
-				       struct rcar_du_encoder *renc,
-				       struct device_node *np)
-{
-	return -ENOSYS;
-}
-#endif
-
-#endif /* __RCAR_DU_HDMIENC_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vgacon.c b/drivers/gpu/drm/rcar-du/rcar_du_vgacon.c
deleted file mode 100644
index 63d0df7f8487..000000000000
--- a/drivers/gpu/drm/rcar-du/rcar_du_vgacon.c
+++ /dev/null
@@ -1,82 +0,0 @@
-/*
- * rcar_du_vgacon.c  --  R-Car Display Unit VGA Connector
- *
- * Copyright (C) 2013-2014 Renesas Electronics Corporation
- *
- * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
-
-#include <drm/drmP.h>
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
-
-#include "rcar_du_drv.h"
-#include "rcar_du_encoder.h"
-#include "rcar_du_kms.h"
-#include "rcar_du_vgacon.h"
-
-static int rcar_du_vga_connector_get_modes(struct drm_connector *connector)
-{
-	return drm_add_modes_noedid(connector, 1280, 768);
-}
-
-static const struct drm_connector_helper_funcs connector_helper_funcs = {
-	.get_modes = rcar_du_vga_connector_get_modes,
-};
-
-static enum drm_connector_status
-rcar_du_vga_connector_detect(struct drm_connector *connector, bool force)
-{
-	return connector_status_connected;
-}
-
-static const struct drm_connector_funcs connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
-	.reset = drm_atomic_helper_connector_reset,
-	.detect = rcar_du_vga_connector_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-int rcar_du_vga_connector_init(struct rcar_du_device *rcdu,
-			       struct rcar_du_encoder *renc)
-{
-	struct drm_encoder *encoder = rcar_encoder_to_drm_encoder(renc);
-	struct rcar_du_connector *rcon;
-	struct drm_connector *connector;
-	int ret;
-
-	rcon = devm_kzalloc(rcdu->dev, sizeof(*rcon), GFP_KERNEL);
-	if (rcon == NULL)
-		return -ENOMEM;
-
-	connector = &rcon->connector;
-	connector->display_info.width_mm = 0;
-	connector->display_info.height_mm = 0;
-	connector->interlace_allowed = true;
-
-	ret = drm_connector_init(rcdu->ddev, connector, &connector_funcs,
-				 DRM_MODE_CONNECTOR_VGA);
-	if (ret < 0)
-		return ret;
-
-	drm_connector_helper_add(connector, &connector_helper_funcs);
-
-	connector->dpms = DRM_MODE_DPMS_OFF;
-	drm_object_property_set_value(&connector->base,
-		rcdu->ddev->mode_config.dpms_property, DRM_MODE_DPMS_OFF);
-
-	ret = drm_mode_connector_attach_encoder(connector, encoder);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vgacon.h b/drivers/gpu/drm/rcar-du/rcar_du_vgacon.h
deleted file mode 100644
index 112f50316e01..000000000000
--- a/drivers/gpu/drm/rcar-du/rcar_du_vgacon.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/*
- * rcar_du_vgacon.h  --  R-Car Display Unit VGA Connector
- *
- * Copyright (C) 2013-2014 Renesas Electronics Corporation
- *
- * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
-
-#ifndef __RCAR_DU_VGACON_H__
-#define __RCAR_DU_VGACON_H__
-
-struct rcar_du_device;
-struct rcar_du_encoder;
-
-int rcar_du_vga_connector_init(struct rcar_du_device *rcdu,
-			       struct rcar_du_encoder *renc);
-
-#endif /* __RCAR_DU_VGACON_H__ */
-- 
Regards,

Laurent Pinchart
