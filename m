Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38514 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752381AbdHOXDS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2017 19:03:18 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/3] drm: rcar-du: Reject planes located fully off-screen
Date: Wed, 16 Aug 2017 02:03:37 +0300
Message-Id: <20170815230338.14913-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170815230338.14913-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170815230338.14913-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

There is no point in accepting fully off-screen planes as they won't be
displayed. Reject them in the atomic check.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 4f076c364f25..714e02960635 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -569,6 +569,8 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
 				 struct drm_plane_state *state,
 				 const struct rcar_du_format_info **format)
 {
+	const struct drm_display_mode *mode;
+	struct drm_crtc_state *crtc_state;
 	struct drm_device *dev = plane->dev;
 
 	if (!state->fb || !state->crtc) {
@@ -582,6 +584,20 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	mode = &crtc_state->adjusted_mode;
+	if (state->crtc_x >= mode->hdisplay ||
+	    state->crtc_y >= mode->vdisplay ||
+	    state->crtc_x + (int)state->crtc_w <= 0 ||
+	    state->crtc_y + (int)state->crtc_h <= 0) {
+		dev_dbg(dev->dev, "%s: plane can't be fully off-screen\n",
+			__func__);
+		return -EINVAL;
+	}
+
 	*format = rcar_du_format_info(state->fb->format->format);
 	if (*format == NULL) {
 		dev_dbg(dev->dev, "%s: unsupported format %08x\n", __func__,
-- 
Regards,

Laurent Pinchart
