Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59567 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752169AbdKZLa1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 26 Nov 2017 06:30:27 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 2/2] drm: rcar-du: Clip planes to screen boundaries
Date: Sun, 26 Nov 2017 13:30:22 +0200
Message-Id: <20171126113022.27808-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20171126113022.27808-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20171126113022.27808-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Unlike the KMS API, the hardware doesn't support planes exceeding the
screen boundaries or planes being located fully off-screen. We need to
clip plane coordinates to support the use case.

Fortunately the DRM core offers a drm_atomic_helper_check_plane_state()
helper that valides the scaling factor and clips the plane coordinates.
Use it to implement the plane atomic check and use the clipped source
and destination rectangles from the plane state instead of the unclipped
source and CRTC coordinates to configure the device.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Actually use the clipped source and destination rectangles
- Use drm_crtc_state::mode instead of drm_crtc_state::adjusted_mode
  where applicable
- Removed spurious semicolon
- Rebased on top of latest drm+drm-misc
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  3 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 50 ++++++++++++++++++++++++---------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 42 ++++++++++++++-------------
 3 files changed, 62 insertions(+), 33 deletions(-)

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
index 4f076c364f25..4a3d16cf3ed6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -332,8 +332,8 @@ static void rcar_du_plane_write(struct rcar_du_group *rgrp,
 static void rcar_du_plane_setup_scanout(struct rcar_du_group *rgrp,
 					const struct rcar_du_plane_state *state)
 {
-	unsigned int src_x = state->state.src_x >> 16;
-	unsigned int src_y = state->state.src_y >> 16;
+	unsigned int src_x = state->state.src.x1 >> 16;
+	unsigned int src_y = state->state.src.y1 >> 16;
 	unsigned int index = state->hwindex;
 	unsigned int pitch;
 	bool interlaced;
@@ -357,7 +357,7 @@ static void rcar_du_plane_setup_scanout(struct rcar_du_group *rgrp,
 			dma[i] = gem->paddr + fb->offsets[i];
 		}
 	} else {
-		pitch = state->state.src_w >> 16;
+		pitch = drm_rect_width(&state->state.src) >> 16;
 		dma[0] = 0;
 		dma[1] = 0;
 	}
@@ -521,6 +521,7 @@ static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,
 				       const struct rcar_du_plane_state *state)
 {
 	struct rcar_du_device *rcdu = rgrp->dev;
+	const struct drm_rect *dst = &state->state.dst;
 
 	if (rcdu->info->gen < 3)
 		rcar_du_plane_setup_format_gen2(rgrp, index, state);
@@ -528,10 +529,10 @@ static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,
 		rcar_du_plane_setup_format_gen3(rgrp, index, state);
 
 	/* Destination position and size */
-	rcar_du_plane_write(rgrp, index, PnDSXR, state->state.crtc_w);
-	rcar_du_plane_write(rgrp, index, PnDSYR, state->state.crtc_h);
-	rcar_du_plane_write(rgrp, index, PnDPXR, state->state.crtc_x);
-	rcar_du_plane_write(rgrp, index, PnDPYR, state->state.crtc_y);
+	rcar_du_plane_write(rgrp, index, PnDSXR, drm_rect_width(dst));
+	rcar_du_plane_write(rgrp, index, PnDSYR, drm_rect_height(dst));
+	rcar_du_plane_write(rgrp, index, PnDPXR, dst->x1);
+	rcar_du_plane_write(rgrp, index, PnDPYR, dst->y1);
 
 	if (rcdu->info->gen < 3) {
 		/* Wrap-around and blinking, disabled */
@@ -570,16 +571,39 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
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
 	}
 
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
+	clip.x2 = crtc_state->mode.hdisplay;
+	clip.y2 = crtc_state->mode.vdisplay;
+
+	ret = drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  true, true);
+	if (ret < 0)
+		return ret;
+
+	if (!state->visible) {
+		*format = NULL;
+		return 0;
 	}
 
 	*format = rcar_du_format_info(state->fb->format->format);
@@ -607,7 +631,7 @@ static void rcar_du_plane_atomic_update(struct drm_plane *plane,
 	struct rcar_du_plane_state *old_rstate;
 	struct rcar_du_plane_state *new_rstate;
 
-	if (!plane->state->crtc)
+	if (!plane->state->visible)
 		return;
 
 	rcar_du_plane_setup(rplane);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index dd66dcb8da23..2c260c33840b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -55,14 +55,14 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	struct rcar_du_plane_state state = {
 		.state = {
 			.crtc = &crtc->crtc,
-			.crtc_x = 0,
-			.crtc_y = 0,
-			.crtc_w = mode->hdisplay,
-			.crtc_h = mode->vdisplay,
-			.src_x = 0,
-			.src_y = 0,
-			.src_w = mode->hdisplay << 16,
-			.src_h = mode->vdisplay << 16,
+			.dst.x1 = 0,
+			.dst.y1 = 0,
+			.dst.x2 = mode->hdisplay,
+			.dst.y2 = mode->vdisplay,
+			.src.x1 = 0,
+			.src.y1 = 0,
+			.src.x2 = mode->hdisplay << 16,
+			.src.y2 = mode->vdisplay << 16,
 			.zpos = 0,
 		},
 		.format = rcar_du_format_info(DRM_FORMAT_ARGB8888),
@@ -178,15 +178,15 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 	};
 	unsigned int i;
 
-	cfg.src.left = state->state.src_x >> 16;
-	cfg.src.top = state->state.src_y >> 16;
-	cfg.src.width = state->state.src_w >> 16;
-	cfg.src.height = state->state.src_h >> 16;
+	cfg.src.left = state->state.src.x1 >> 16;
+	cfg.src.top = state->state.src.y1 >> 16;
+	cfg.src.width = drm_rect_width(&state->state.src) >> 16;
+	cfg.src.height = drm_rect_height(&state->state.src) >> 16;
 
-	cfg.dst.left = state->state.crtc_x;
-	cfg.dst.top = state->state.crtc_y;
-	cfg.dst.width = state->state.crtc_w;
-	cfg.dst.height = state->state.crtc_h;
+	cfg.dst.left = state->state.dst.x1;
+	cfg.dst.top = state->state.dst.y1;
+	cfg.dst.width = drm_rect_width(&state->state.dst);
+	cfg.dst.height = drm_rect_height(&state->state.dst);
 
 	for (i = 0; i < state->format->planes; ++i)
 		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
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
