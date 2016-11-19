Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55159 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752774AbcKSD2N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 22:28:13 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 11/13] drm: rcar-du: Switch to encoder .atomic_mode_set() helper function
Date: Sat, 19 Nov 2016 05:28:11 +0200
Message-Id: <1479526093-7014-12-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The native encoder mode set helper function for atomic drivers is
.atomic_mode_set(). Replace the legacy .mode_set() implementation.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 8 ++++----
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index ab8645c57e2d..3974d9495f37 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -83,16 +83,16 @@ static int rcar_du_encoder_atomic_check(struct drm_encoder *encoder,
 }
 
 static void rcar_du_encoder_mode_set(struct drm_encoder *encoder,
-				     struct drm_display_mode *mode,
-				     struct drm_display_mode *adjusted_mode)
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state)
 {
 	struct rcar_du_encoder *renc = to_rcar_encoder(encoder);
 
-	rcar_du_crtc_route_output(encoder->crtc, renc->output);
+	rcar_du_crtc_route_output(crtc_state->crtc, renc->output);
 }
 
 static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
-	.mode_set = rcar_du_encoder_mode_set,
+	.atomic_mode_set = rcar_du_encoder_mode_set,
 	.disable = rcar_du_encoder_disable,
 	.enable = rcar_du_encoder_enable,
 	.atomic_check = rcar_du_encoder_atomic_check,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c b/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
index f9515f53cc5b..a1a2c5e7822c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
@@ -67,16 +67,16 @@ static int rcar_du_hdmienc_atomic_check(struct drm_encoder *encoder,
 
 
 static void rcar_du_hdmienc_mode_set(struct drm_encoder *encoder,
-				     struct drm_display_mode *mode,
-				     struct drm_display_mode *adjusted_mode)
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state)
 {
 	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
 
-	rcar_du_crtc_route_output(encoder->crtc, hdmienc->renc->output);
+	rcar_du_crtc_route_output(crtc_state->crtc, hdmienc->renc->output);
 }
 
 static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
-	.mode_set = rcar_du_hdmienc_mode_set,
+	.atomic_mode_set = rcar_du_hdmienc_mode_set,
 	.disable = rcar_du_hdmienc_disable,
 	.enable = rcar_du_hdmienc_enable,
 	.atomic_check = rcar_du_hdmienc_atomic_check,
-- 
Regards,

Laurent Pinchart
