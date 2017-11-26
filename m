Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59564 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752120AbdKZLaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 26 Nov 2017 06:30:25 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 1/2] drm: rcar-du: Share plane atomic check code between Gen2 and Gen3
Date: Sun, 26 Nov 2017 13:30:21 +0200
Message-Id: <20171126113022.27808-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20171126113022.27808-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20171126113022.27808-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The plane atomic check implementation is identical on Gen2 (DU planes)
and Gen3 (VSP planes), but two separate functions exist as they operate
on different data structures. Refactor the code to share the
implementation.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 27 +++++++++++++++++----------
 drivers/gpu/drm/rcar-du/rcar_du_plane.h |  4 ++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 22 +---------------------
 3 files changed, 22 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 61833cc1c699..4f076c364f25 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -565,27 +565,26 @@ void __rcar_du_plane_setup(struct rcar_du_group *rgrp,
 	}
 }
 
-static int rcar_du_plane_atomic_check(struct drm_plane *plane,
-				      struct drm_plane_state *state)
+int __rcar_du_plane_atomic_check(struct drm_plane *plane,
+				 struct drm_plane_state *state,
+				 const struct rcar_du_format_info **format)
 {
-	struct rcar_du_plane_state *rstate = to_rcar_plane_state(state);
-	struct rcar_du_plane *rplane = to_rcar_plane(plane);
-	struct rcar_du_device *rcdu = rplane->group->dev;
+	struct drm_device *dev = plane->dev;
 
 	if (!state->fb || !state->crtc) {
-		rstate->format = NULL;
+		*format = NULL;
 		return 0;
 	}
 
 	if (state->src_w >> 16 != state->crtc_w ||
 	    state->src_h >> 16 != state->crtc_h) {
-		dev_dbg(rcdu->dev, "%s: scaling not supported\n", __func__);
+		dev_dbg(dev->dev, "%s: scaling not supported\n", __func__);
 		return -EINVAL;
 	}
 
-	rstate->format = rcar_du_format_info(state->fb->format->format);
-	if (rstate->format == NULL) {
-		dev_dbg(rcdu->dev, "%s: unsupported format %08x\n", __func__,
+	*format = rcar_du_format_info(state->fb->format->format);
+	if (*format == NULL) {
+		dev_dbg(dev->dev, "%s: unsupported format %08x\n", __func__,
 			state->fb->format->format);
 		return -EINVAL;
 	}
@@ -593,6 +592,14 @@ static int rcar_du_plane_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
+static int rcar_du_plane_atomic_check(struct drm_plane *plane,
+				      struct drm_plane_state *state)
+{
+	struct rcar_du_plane_state *rstate = to_rcar_plane_state(state);
+
+	return __rcar_du_plane_atomic_check(plane, state, &rstate->format);
+}
+
 static void rcar_du_plane_atomic_update(struct drm_plane *plane,
 					struct drm_plane_state *old_state)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
index f62e09f195de..890321b4665d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
@@ -73,6 +73,10 @@ to_rcar_plane_state(struct drm_plane_state *state)
 int rcar_du_atomic_check_planes(struct drm_device *dev,
 				struct drm_atomic_state *state);
 
+int __rcar_du_plane_atomic_check(struct drm_plane *plane,
+				 struct drm_plane_state *state,
+				 const struct rcar_du_format_info **format);
+
 int rcar_du_planes_init(struct rcar_du_group *rgrp);
 
 void __rcar_du_plane_setup(struct rcar_du_group *rgrp,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 2c96147bc444..dd66dcb8da23 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -268,28 +268,8 @@ static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
 					  struct drm_plane_state *state)
 {
 	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(state);
-	struct rcar_du_vsp_plane *rplane = to_rcar_vsp_plane(plane);
-	struct rcar_du_device *rcdu = rplane->vsp->dev;
-
-	if (!state->fb || !state->crtc) {
-		rstate->format = NULL;
-		return 0;
-	}
 
-	if (state->src_w >> 16 != state->crtc_w ||
-	    state->src_h >> 16 != state->crtc_h) {
-		dev_dbg(rcdu->dev, "%s: scaling not supported\n", __func__);
-		return -EINVAL;
-	}
-
-	rstate->format = rcar_du_format_info(state->fb->format->format);
-	if (rstate->format == NULL) {
-		dev_dbg(rcdu->dev, "%s: unsupported format %08x\n", __func__,
-			state->fb->format->format);
-		return -EINVAL;
-	}
-
-	return 0;
+	return __rcar_du_plane_atomic_check(plane, state, &rstate->format);
 }
 
 static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
-- 
Regards,

Laurent Pinchart
