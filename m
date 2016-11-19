Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55160 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752785AbcKSD2O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 22:28:14 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 12/13] drm: rcar-du: Use the DRM panel API
Date: Sat, 19 Nov 2016 05:28:12 +0200
Message-Id: <1479526093-7014-13-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Instead of parsing the panel device tree node manually, use the panel
API to delegate panel handling to a panel driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Kconfig           |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 12 ++++++
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h |  3 ++
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c | 68 +++++++++++--------------------
 4 files changed, 40 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 4c2fd056dd6d..2bab449add76 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -20,6 +20,7 @@ config DRM_RCAR_HDMI
 config DRM_RCAR_LVDS
 	bool "R-Car DU LVDS Encoder Support"
 	depends on DRM_RCAR_DU
+	select DRM_PANEL
 	help
 	  Enable support for the R-Car Display Unit embedded LVDS encoders.
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 3974d9495f37..2408216dc1fb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -16,6 +16,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_panel.h>
 
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
@@ -33,6 +34,11 @@ static void rcar_du_encoder_disable(struct drm_encoder *encoder)
 {
 	struct rcar_du_encoder *renc = to_rcar_encoder(encoder);
 
+	if (renc->connector->panel) {
+		drm_panel_disable(renc->connector->panel);
+		drm_panel_unprepare(renc->connector->panel);
+	}
+
 	if (renc->lvds)
 		rcar_du_lvdsenc_enable(renc->lvds, encoder->crtc, false);
 }
@@ -43,6 +49,11 @@ static void rcar_du_encoder_enable(struct drm_encoder *encoder)
 
 	if (renc->lvds)
 		rcar_du_lvdsenc_enable(renc->lvds, encoder->crtc, true);
+
+	if (renc->connector->panel) {
+		drm_panel_prepare(renc->connector->panel);
+		drm_panel_enable(renc->connector->panel);
+	}
 }
 
 static int rcar_du_encoder_atomic_check(struct drm_encoder *encoder,
@@ -89,6 +100,7 @@ static void rcar_du_encoder_mode_set(struct drm_encoder *encoder,
 	struct rcar_du_encoder *renc = to_rcar_encoder(encoder);
 
 	rcar_du_crtc_route_output(crtc_state->crtc, renc->output);
+	renc->connector = to_rcar_connector(conn_state->connector);
 }
 
 static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index 7fc10a9c34c3..269fbab15907 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -16,6 +16,7 @@
 
 #include <drm/drm_crtc.h>
 
+struct drm_panel;
 struct rcar_du_device;
 struct rcar_du_hdmienc;
 struct rcar_du_lvdsenc;
@@ -31,6 +32,7 @@ enum rcar_du_encoder_type {
 struct rcar_du_encoder {
 	struct drm_encoder base;
 	enum rcar_du_output output;
+	struct rcar_du_connector *connector;
 	struct rcar_du_hdmienc *hdmi;
 	struct rcar_du_lvdsenc *lvds;
 };
@@ -43,6 +45,7 @@ struct rcar_du_encoder {
 struct rcar_du_connector {
 	struct drm_connector connector;
 	struct rcar_du_encoder *encoder;
+	struct drm_panel *panel;
 };
 
 #define to_rcar_connector(c) \
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
index 64e9f0b86e58..ee87494f9218 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
@@ -15,6 +15,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_panel.h>
 
 #include <video/display_timing.h>
 #include <video/of_display_timing.h>
@@ -25,36 +26,11 @@
 #include "rcar_du_kms.h"
 #include "rcar_du_lvdscon.h"
 
-struct rcar_du_lvds_connector {
-	struct rcar_du_connector connector;
-
-	struct {
-		unsigned int width_mm;		/* Panel width in mm */
-		unsigned int height_mm;		/* Panel height in mm */
-		struct videomode mode;
-	} panel;
-};
-
-#define to_rcar_lvds_connector(c) \
-	container_of(c, struct rcar_du_lvds_connector, connector.connector)
-
 static int rcar_du_lvds_connector_get_modes(struct drm_connector *connector)
 {
-	struct rcar_du_lvds_connector *lvdscon =
-		to_rcar_lvds_connector(connector);
-	struct drm_display_mode *mode;
-
-	mode = drm_mode_create(connector->dev);
-	if (mode == NULL)
-		return 0;
+	struct rcar_du_connector *rcon = to_rcar_connector(connector);
 
-	mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
-
-	drm_display_mode_from_videomode(&lvdscon->panel.mode, mode);
-
-	drm_mode_probed_add(connector, mode);
-
-	return 1;
+	return drm_panel_get_modes(rcon->panel);
 }
 
 static const struct drm_connector_helper_funcs connector_helper_funcs = {
@@ -67,12 +43,20 @@ rcar_du_lvds_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_connected;
 }
 
+static void rcar_du_lvds_connector_destroy(struct drm_connector *connector)
+{
+	struct rcar_du_connector *rcon = to_rcar_connector(connector);
+
+	drm_panel_detach(rcon->panel);
+	drm_connector_cleanup(connector);
+}
+
 static const struct drm_connector_funcs connector_funcs = {
 	.dpms = drm_atomic_helper_connector_dpms,
 	.reset = drm_atomic_helper_connector_reset,
 	.detect = rcar_du_lvds_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
+	.destroy = rcar_du_lvds_connector_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -82,27 +66,19 @@ int rcar_du_lvds_connector_init(struct rcar_du_device *rcdu,
 				const struct device_node *np)
 {
 	struct drm_encoder *encoder = rcar_encoder_to_drm_encoder(renc);
-	struct rcar_du_lvds_connector *lvdscon;
+	struct rcar_du_connector *rcon;
 	struct drm_connector *connector;
-	struct display_timing timing;
 	int ret;
 
-	lvdscon = devm_kzalloc(rcdu->dev, sizeof(*lvdscon), GFP_KERNEL);
-	if (lvdscon == NULL)
+	rcon = devm_kzalloc(rcdu->dev, sizeof(*rcon), GFP_KERNEL);
+	if (rcon == NULL)
 		return -ENOMEM;
 
-	ret = of_get_display_timing(np, "panel-timing", &timing);
-	if (ret < 0)
-		return ret;
-
-	videomode_from_timing(&timing, &lvdscon->panel.mode);
+	connector = &rcon->connector;
 
-	of_property_read_u32(np, "width-mm", &lvdscon->panel.width_mm);
-	of_property_read_u32(np, "height-mm", &lvdscon->panel.height_mm);
-
-	connector = &lvdscon->connector.connector;
-	connector->display_info.width_mm = lvdscon->panel.width_mm;
-	connector->display_info.height_mm = lvdscon->panel.height_mm;
+	rcon->panel = of_drm_find_panel(np);
+	if (!rcon->panel)
+		return -EPROBE_DEFER;
 
 	ret = drm_connector_init(rcdu->ddev, connector, &connector_funcs,
 				 DRM_MODE_CONNECTOR_LVDS);
@@ -119,7 +95,11 @@ int rcar_du_lvds_connector_init(struct rcar_du_device *rcdu,
 	if (ret < 0)
 		return ret;
 
-	lvdscon->connector.encoder = renc;
+	ret = drm_panel_attach(rcon->panel, connector);
+	if (ret < 0)
+		return ret;
+
+	rcon->encoder = renc;
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart
