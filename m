Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34206 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932508AbcE3QAg (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:00:36 -0400
Received: by mail-lf0-f68.google.com with SMTP id 65so14283740lfq.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:00:35 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC 01/21] drm: rcar-du: Remove i2c slave encoder interface for hdmi encoder
Date: Mon, 30 May 2016 18:00:00 +0200
Message-Id: <1464624020-27709-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Archit Taneja <architt@codeaurora.org>

The hdmi output in rcar-du uses the i2c slave encoder interface to link
to the adv7511 encoder chip. The kms driver creates encoder and connector
entities that internally uses the drm_encoder_slave_funcs ops provided by
the slave encoder driver.

Change the driver such that it expects a bridge entity instead of a slave
encoder. The hdmi connector code isn't needed anymore as we expect the
adv7511 bridge driver to create/manage the connector.

Note that the kms driver still expects a connector node for hdmi to be
present in DT. This node has no connection to the connector created
by the bridge driver.

Compile tested only.

Signed-off-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/rcar-du/Makefile          |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h |   7 +-
 drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c | 117 ------------------------------
 drivers/gpu/drm/rcar-du/rcar_du_hdmicon.h |  31 --------
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c |  67 +++++------------
 6 files changed, 22 insertions(+), 206 deletions(-)
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmicon.h

diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 827711e..2ade186 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -7,8 +7,7 @@ rcar-du-drm-y := rcar_du_crtc.o \
 		 rcar_du_plane.o \
 		 rcar_du_vgacon.o
 
-rcar-du-drm-$(CONFIG_DRM_RCAR_HDMI)	+= rcar_du_hdmicon.o \
-					   rcar_du_hdmienc.o
+rcar-du-drm-$(CONFIG_DRM_RCAR_HDMI)	+= rcar_du_hdmienc.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_lvdsenc.o
 
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 4e939e4..1b16297 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -19,7 +19,6 @@
 
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
-#include "rcar_du_hdmicon.h"
 #include "rcar_du_hdmienc.h"
 #include "rcar_du_kms.h"
 #include "rcar_du_lvdscon.h"
@@ -186,7 +185,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		break;
 
 	case DRM_MODE_ENCODER_TMDS:
-		ret = rcar_du_hdmi_connector_init(rcdu, renc);
+		/* connector managed by the bridge driver */
 		break;
 
 	default:
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index 719b6f2a..dde523a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -15,7 +15,6 @@
 #define __RCAR_DU_ENCODER_H__
 
 #include <drm/drm_crtc.h>
-#include <drm/drm_encoder_slave.h>
 
 struct rcar_du_device;
 struct rcar_du_hdmienc;
@@ -30,16 +29,16 @@ enum rcar_du_encoder_type {
 };
 
 struct rcar_du_encoder {
-	struct drm_encoder_slave slave;
+	struct drm_encoder base;
 	enum rcar_du_output output;
 	struct rcar_du_hdmienc *hdmi;
 	struct rcar_du_lvdsenc *lvds;
 };
 
 #define to_rcar_encoder(e) \
-	container_of(e, struct rcar_du_encoder, slave.base)
+	container_of(e, struct rcar_du_encoder, base)
 
-#define rcar_encoder_to_drm_encoder(e)	(&(e)->slave.base)
+#define rcar_encoder_to_drm_encoder(e)	(&(e)->base)
 
 struct rcar_du_connector {
 	struct drm_connector connector;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c b/drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c
deleted file mode 100644
index 6c92714..0000000
--- a/drivers/gpu/drm/rcar-du/rcar_du_hdmicon.c
+++ /dev/null
@@ -1,117 +0,0 @@
-/*
- * R-Car Display Unit HDMI Connector
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
-#include <drm/drmP.h>
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
-#include <drm/drm_encoder_slave.h>
-
-#include "rcar_du_drv.h"
-#include "rcar_du_encoder.h"
-#include "rcar_du_hdmicon.h"
-#include "rcar_du_kms.h"
-
-#define to_slave_funcs(e)	(to_rcar_encoder(e)->slave.slave_funcs)
-
-static int rcar_du_hdmi_connector_get_modes(struct drm_connector *connector)
-{
-	struct rcar_du_connector *con = to_rcar_connector(connector);
-	struct drm_encoder *encoder = rcar_encoder_to_drm_encoder(con->encoder);
-	const struct drm_encoder_slave_funcs *sfuncs = to_slave_funcs(encoder);
-
-	if (sfuncs->get_modes == NULL)
-		return 0;
-
-	return sfuncs->get_modes(encoder, connector);
-}
-
-static int rcar_du_hdmi_connector_mode_valid(struct drm_connector *connector,
-					     struct drm_display_mode *mode)
-{
-	struct rcar_du_connector *con = to_rcar_connector(connector);
-	struct drm_encoder *encoder = rcar_encoder_to_drm_encoder(con->encoder);
-	const struct drm_encoder_slave_funcs *sfuncs = to_slave_funcs(encoder);
-
-	if (sfuncs->mode_valid == NULL)
-		return MODE_OK;
-
-	return sfuncs->mode_valid(encoder, mode);
-}
-
-static const struct drm_connector_helper_funcs connector_helper_funcs = {
-	.get_modes = rcar_du_hdmi_connector_get_modes,
-	.mode_valid = rcar_du_hdmi_connector_mode_valid,
-	.best_encoder = rcar_du_connector_best_encoder,
-};
-
-static enum drm_connector_status
-rcar_du_hdmi_connector_detect(struct drm_connector *connector, bool force)
-{
-	struct rcar_du_connector *con = to_rcar_connector(connector);
-	struct drm_encoder *encoder = rcar_encoder_to_drm_encoder(con->encoder);
-	const struct drm_encoder_slave_funcs *sfuncs = to_slave_funcs(encoder);
-
-	if (sfuncs->detect == NULL)
-		return connector_status_unknown;
-
-	return sfuncs->detect(encoder, connector);
-}
-
-static const struct drm_connector_funcs connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
-	.reset = drm_atomic_helper_connector_reset,
-	.detect = rcar_du_hdmi_connector_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-int rcar_du_hdmi_connector_init(struct rcar_du_device *rcdu,
-				struct rcar_du_encoder *renc)
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
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
-
-	ret = drm_connector_init(rcdu->ddev, connector, &connector_funcs,
-				 DRM_MODE_CONNECTOR_HDMIA);
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
-	rcon->encoder = renc;
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_hdmicon.h b/drivers/gpu/drm/rcar-du/rcar_du_hdmicon.h
deleted file mode 100644
index 87daa94..0000000
--- a/drivers/gpu/drm/rcar-du/rcar_du_hdmicon.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- * R-Car Display Unit HDMI Connector
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
-#ifndef __RCAR_DU_HDMICON_H__
-#define __RCAR_DU_HDMICON_H__
-
-struct rcar_du_device;
-struct rcar_du_encoder;
-
-#if IS_ENABLED(CONFIG_DRM_RCAR_HDMI)
-int rcar_du_hdmi_connector_init(struct rcar_du_device *rcdu,
-				struct rcar_du_encoder *renc);
-#else
-static inline int rcar_du_hdmi_connector_init(struct rcar_du_device *rcdu,
-					      struct rcar_du_encoder *renc)
-{
-	return -ENOSYS;
-}
-#endif
-
-#endif /* __RCAR_DU_HDMICON_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c b/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
index 461662d..15d553a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
@@ -16,7 +16,6 @@
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_encoder_slave.h>
 
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
@@ -25,20 +24,14 @@
 
 struct rcar_du_hdmienc {
 	struct rcar_du_encoder *renc;
-	struct device *dev;
 	bool enabled;
 };
 
 #define to_rcar_hdmienc(e)	(to_rcar_encoder(e)->hdmi)
-#define to_slave_funcs(e)	(to_rcar_encoder(e)->slave.slave_funcs)
 
 static void rcar_du_hdmienc_disable(struct drm_encoder *encoder)
 {
 	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
-	const struct drm_encoder_slave_funcs *sfuncs = to_slave_funcs(encoder);
-
-	if (sfuncs->dpms)
-		sfuncs->dpms(encoder, DRM_MODE_DPMS_OFF);
 
 	if (hdmienc->renc->lvds)
 		rcar_du_lvdsenc_enable(hdmienc->renc->lvds, encoder->crtc,
@@ -50,15 +43,11 @@ static void rcar_du_hdmienc_disable(struct drm_encoder *encoder)
 static void rcar_du_hdmienc_enable(struct drm_encoder *encoder)
 {
 	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
-	const struct drm_encoder_slave_funcs *sfuncs = to_slave_funcs(encoder);
 
 	if (hdmienc->renc->lvds)
 		rcar_du_lvdsenc_enable(hdmienc->renc->lvds, encoder->crtc,
 				       true);
 
-	if (sfuncs->dpms)
-		sfuncs->dpms(encoder, DRM_MODE_DPMS_ON);
-
 	hdmienc->enabled = true;
 }
 
@@ -67,18 +56,13 @@ static int rcar_du_hdmienc_atomic_check(struct drm_encoder *encoder,
 					struct drm_connector_state *conn_state)
 {
 	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
-	const struct drm_encoder_slave_funcs *sfuncs = to_slave_funcs(encoder);
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
-	const struct drm_display_mode *mode = &crtc_state->mode;
 
 	if (hdmienc->renc->lvds)
 		rcar_du_lvdsenc_atomic_check(hdmienc->renc->lvds,
 					     adjusted_mode);
 
-	if (sfuncs->mode_fixup == NULL)
-		return 0;
-
-	return sfuncs->mode_fixup(encoder, mode, adjusted_mode) ? 0 : -EINVAL;
+	return 0;
 }
 
 static void rcar_du_hdmienc_mode_set(struct drm_encoder *encoder,
@@ -86,10 +70,6 @@ static void rcar_du_hdmienc_mode_set(struct drm_encoder *encoder,
 				     struct drm_display_mode *adjusted_mode)
 {
 	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
-	const struct drm_encoder_slave_funcs *sfuncs = to_slave_funcs(encoder);
-
-	if (sfuncs->mode_set)
-		sfuncs->mode_set(encoder, mode, adjusted_mode);
 
 	rcar_du_crtc_route_output(encoder->crtc, hdmienc->renc->output);
 }
@@ -109,7 +89,6 @@ static void rcar_du_hdmienc_cleanup(struct drm_encoder *encoder)
 		rcar_du_hdmienc_disable(encoder);
 
 	drm_encoder_cleanup(encoder);
-	put_device(hdmienc->dev);
 }
 
 static const struct drm_encoder_funcs encoder_funcs = {
@@ -120,8 +99,7 @@ int rcar_du_hdmienc_init(struct rcar_du_device *rcdu,
 			 struct rcar_du_encoder *renc, struct device_node *np)
 {
 	struct drm_encoder *encoder = rcar_encoder_to_drm_encoder(renc);
-	struct drm_i2c_encoder_driver *driver;
-	struct i2c_client *i2c_slave;
+	struct drm_bridge *bridge;
 	struct rcar_du_hdmienc *hdmienc;
 	int ret;
 
@@ -129,44 +107,33 @@ int rcar_du_hdmienc_init(struct rcar_du_device *rcdu,
 	if (hdmienc == NULL)
 		return -ENOMEM;
 
-	/* Locate the slave I2C device and driver. */
-	i2c_slave = of_find_i2c_device_by_node(np);
-	if (!i2c_slave || !i2c_get_clientdata(i2c_slave)) {
-		dev_dbg(rcdu->dev,
-			"can't get I2C slave for %s, deferring probe\n",
+	/* Locate the DRM bridge from the HDMI encoder DT node. */
+	bridge = of_drm_find_bridge(np);
+	if (!bridge) {
+		dev_dbg(rcdu->dev, "can't get bridge for %s, deferring probe\n",
 			of_node_full_name(np));
 		return -EPROBE_DEFER;
 	}
 
-	hdmienc->dev = &i2c_slave->dev;
-
-	if (hdmienc->dev->driver == NULL) {
-		dev_dbg(rcdu->dev,
-			"I2C slave %s not probed yet, deferring probe\n",
-			dev_name(hdmienc->dev));
-		ret = -EPROBE_DEFER;
-		goto error;
-	}
-
-	/* Initialize the slave encoder. */
-	driver = to_drm_i2c_encoder_driver(to_i2c_driver(hdmienc->dev->driver));
-	ret = driver->encoder_init(i2c_slave, rcdu->ddev, &renc->slave);
-	if (ret < 0)
-		goto error;
-
 	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
 			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	drm_encoder_helper_add(encoder, &encoder_helper_funcs);
 
 	renc->hdmi = hdmienc;
 	hdmienc->renc = renc;
 
-	return 0;
+	/* Link the bridge to the encoder. */
+	bridge->encoder = encoder;
+	encoder->bridge = bridge;
 
-error:
-	put_device(hdmienc->dev);
-	return ret;
+	ret = drm_bridge_attach(rcdu->ddev, bridge);
+	if (ret) {
+		drm_encoder_cleanup(encoder);
+		return ret;
+	}
+
+	return 0;
 }
-- 
2.7.4
