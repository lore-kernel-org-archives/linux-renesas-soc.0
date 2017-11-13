Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36435 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751682AbdKMIrE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 03:47:04 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 2/2] drm: rcar-du: Clip planes to screen boundaries
Date: Mon, 13 Nov 2017 10:47:00 +0200
Message-Id: <20171113084700.12076-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20171113084700.12076-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20171113084700.12076-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Unlike the KMS API, the hardware doesn't support planes exceeding the
screen boundaries or planes being located fully off-screen. We need to
clip plane coordinates to support the use case.

Fortunately the DRM core offers the drm_plane_helper_check_state()
helper that valides the scaling factor and clips the plane coordinates.
Use it to implement the plane atomic check and use the clipped source
and destination rectangles from the plane state instead of the unclipped
source and CRTC coordinates to configure the device.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  3 ++-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 37 ++++++++++++++++++++++++++-------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 10 ++++++---
 3 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index b492063a6e1f..5685d5af6998 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -319,7 +319,8 @@ static void rcar_du_crtc_update_planes(struct rcar_du_crtc *rcrtc)
 		struct rcar_du_plane *plane = &rcrtc->group->planes[i];
 		unsigned int j;
 
-		if (plane->plane.state->crtc != &rcrtc->crtc)
+		if (plane->plane.state->crtc != &rcrtc->crtc ||
+		    !plane->plane.state->visible)
 			continue;
 
 		/* Insert the plane in the sorted planes array. */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 4f076c364f25..9cf02b44902d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -570,16 +570,39 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
 				 const struct rcar_du_format_info **format)
 {
 	struct drm_device *dev = plane->dev;
+	struct drm_crtc_state *crtc_state;
+	struct drm_rect clip;
+	int ret;
 
-	if (!state->fb || !state->crtc) {
+	if (!state->crtc) {
+		/*
+		 * The visible field is not reset by the DRM core but only
+		 * updated by drm_plane_helper_check_state(), set it manually.
+		 */
+		state->visible = false;
 		*format = NULL;
 		return 0;
-	}
+	};
 
-	if (state->src_w >> 16 != state->crtc_w ||
-	    state->src_h >> 16 != state->crtc_h) {
-		dev_dbg(dev->dev, "%s: scaling not supported\n", __func__);
-		return -EINVAL;
+	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	clip.x1 = 0;
+	clip.y1 = 0;
+	clip.x2 = crtc_state->adjusted_mode.hdisplay;
+	clip.y2 = crtc_state->adjusted_mode.vdisplay;
+
+	ret = drm_plane_helper_check_state(state, &clip,
+					   DRM_PLANE_HELPER_NO_SCALING,
+					   DRM_PLANE_HELPER_NO_SCALING,
+					   true, true);
+	if (ret < 0)
+		return ret;
+
+	if (!state->visible) {
+		*format = NULL;
+		return 0;
 	}
 
 	*format = rcar_du_format_info(state->fb->format->format);
@@ -607,7 +630,7 @@ static void rcar_du_plane_atomic_update(struct drm_plane *plane,
 	struct rcar_du_plane_state *old_rstate;
 	struct rcar_du_plane_state *new_rstate;
 
-	if (!plane->state->crtc)
+	if (!plane->state->visible)
 		return;
 
 	rcar_du_plane_setup(rplane);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index dd66dcb8da23..6d1a82ee50ed 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -212,7 +212,11 @@ static int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
 	unsigned int i;
 	int ret;
 
-	if (!state->fb)
+	/*
+	 * There's no need to prepare (and unprepare) the framebuffer when the
+	 * plane is not visible, as it will not be displayed.
+	 */
+	if (!state->visible)
 		return 0;
 
 	for (i = 0; i < rstate->format->planes; ++i) {
@@ -253,7 +257,7 @@ static void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 	struct rcar_du_vsp *vsp = to_rcar_vsp_plane(plane)->vsp;
 	unsigned int i;
 
-	if (!state->fb)
+	if (!state->visible)
 		return;
 
 	for (i = 0; i < rstate->format->planes; ++i) {
@@ -278,7 +282,7 @@ static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
 	struct rcar_du_vsp_plane *rplane = to_rcar_vsp_plane(plane);
 	struct rcar_du_crtc *crtc = to_rcar_crtc(old_state->crtc);
 
-	if (plane->state->crtc)
+	if (plane->state->visible)
 		rcar_du_vsp_plane_setup(rplane);
 	else
 		vsp1_du_atomic_update(rplane->vsp->vsp, crtc->vsp_pipe,
-- 
Regards,

Laurent Pinchart
