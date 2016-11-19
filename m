Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55159 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752774AbcKSD2P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 22:28:15 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 13/13] drm: rcar-du: Add support for LVDS mode selection
Date: Sat, 19 Nov 2016 05:28:13 +0200
Message-Id: <1479526093-7014-14-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Retrieve the LVDS mode from the panel and configure the LVDS encoder
accordingly. LVDS mode selection is static as LVDS panels can't be
hot-plugged on any of the device supported by the driver. Support for
dynamic mode selection can be implemented in the future when needed.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c | 11 +++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h | 13 +++++++++++++
 3 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 2408216dc1fb..4134c16becda 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -98,9 +98,39 @@ static void rcar_du_encoder_mode_set(struct drm_encoder *encoder,
 				     struct drm_connector_state *conn_state)
 {
 	struct rcar_du_encoder *renc = to_rcar_encoder(encoder);
+	struct drm_display_info *info = &conn_state->connector->display_info;
+	enum rcar_lvds_mode mode;
 
 	rcar_du_crtc_route_output(crtc_state->crtc, renc->output);
 	renc->connector = to_rcar_connector(conn_state->connector);
+
+	if (!renc->lvds)
+		return;
+
+	if (!info->num_bus_formats || !info->bus_formats) {
+		dev_err(encoder->dev->dev, "no LVDS bus format reported\n");
+		return;
+	}
+
+	switch (info->bus_formats[0]) {
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		mode = RCAR_LVDS_MODE_JEIDA;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		mode = RCAR_LVDS_MODE_VESA;
+		break;
+	default:
+		dev_err(encoder->dev->dev,
+			"unsupported LVDS bus format 0x%04x\n",
+			info->bus_formats[0]);
+		return;
+	}
+
+	if (info->bus_flags & DRM_BUS_FLAG_DATA_MIRROR)
+		mode |= RCAR_LVDS_MODE_MIRROR;
+
+	rcar_du_lvdsenc_set_mode(renc->lvds, mode);
 }
 
 static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
index e3a4985f6f3f..1661f6201210 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -31,6 +31,7 @@ struct rcar_du_lvdsenc {
 	bool enabled;
 
 	enum rcar_lvds_input input;
+	enum rcar_lvds_mode mode;
 };
 
 static void rcar_lvds_write(struct rcar_du_lvdsenc *lvds, u32 reg, u32 data)
@@ -61,7 +62,7 @@ static void rcar_du_lvdsenc_start_gen2(struct rcar_du_lvdsenc *lvds,
 	/* Select the input, hardcode mode 0, enable LVDS operation and turn
 	 * bias circuitry on.
 	 */
-	lvdcr0 = LVDCR0_BEN | LVDCR0_LVEN;
+	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_BEN | LVDCR0_LVEN;
 	if (rcrtc->index == 2)
 		lvdcr0 |= LVDCR0_DUSEL;
 	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
@@ -114,7 +115,7 @@ static void rcar_du_lvdsenc_start_gen3(struct rcar_du_lvdsenc *lvds,
 	 * Turn the PLL on, set it to LVDS normal mode, wait for the startup
 	 * delay and turn the output on.
 	 */
-	lvdcr0 = LVDCR0_PLLON;
+	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_PLLON;
 	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
 
 	lvdcr0 |= LVDCR0_PWD;
@@ -211,6 +212,12 @@ void rcar_du_lvdsenc_atomic_check(struct rcar_du_lvdsenc *lvds,
 		mode->clock = clamp(mode->clock, 25175, 148500);
 }
 
+void rcar_du_lvdsenc_set_mode(struct rcar_du_lvdsenc *lvds,
+			      enum rcar_lvds_mode mode)
+{
+	lvds->mode = mode;
+}
+
 static int rcar_du_lvdsenc_get_resources(struct rcar_du_lvdsenc *lvds,
 					 struct platform_device *pdev)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h
index dfdba746edf4..7218ac89333e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h
@@ -26,8 +26,17 @@ enum rcar_lvds_input {
 	RCAR_LVDS_INPUT_DU2,
 };
 
+/* Keep in sync with the LVDCR0.LVMD hardware register values. */
+enum rcar_lvds_mode {
+	RCAR_LVDS_MODE_JEIDA = 0,
+	RCAR_LVDS_MODE_MIRROR = 1,
+	RCAR_LVDS_MODE_VESA = 4,
+};
+
 #if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
 int rcar_du_lvdsenc_init(struct rcar_du_device *rcdu);
+void rcar_du_lvdsenc_set_mode(struct rcar_du_lvdsenc *lvds,
+			      enum rcar_lvds_mode mode);
 int rcar_du_lvdsenc_enable(struct rcar_du_lvdsenc *lvds,
 			   struct drm_crtc *crtc, bool enable);
 void rcar_du_lvdsenc_atomic_check(struct rcar_du_lvdsenc *lvds,
@@ -37,6 +46,10 @@ static inline int rcar_du_lvdsenc_init(struct rcar_du_device *rcdu)
 {
 	return 0;
 }
+static inline void rcar_du_lvdsenc_set_mode(struct rcar_du_lvdsenc *lvds,
+					    enum rcar_lvds_mode mode)
+{
+}
 static inline int rcar_du_lvdsenc_enable(struct rcar_du_lvdsenc *lvds,
 					 struct drm_crtc *crtc, bool enable)
 {
-- 
Regards,

Laurent Pinchart
