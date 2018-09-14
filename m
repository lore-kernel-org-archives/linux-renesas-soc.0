Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:42202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbeIOBZy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 21:25:54 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
Cc: David Airlie <airlied@linux.ie>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Revert "drm: rcar-du: Use __drm_atomic_helper_plane_reset instead of copying the logic"
Date: Fri, 14 Sep 2018 21:09:49 +0100
Message-Id: <20180914200949.25763-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Commit: 161ad653d6c9 ("drm: rcar-du: Use __drm_atomic_helper_plane_reset
instead of copying the logic") causes a regression in the R-Car DU
display driver, and prevents any output from being displayed.

The display appears to function correctly but only a black screen is
ever visible.

Revert the commit.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---

Looking through the code, the reason for this issue isn't particularly
obvious - and will need some further exploration, which I can't look at
until Tuesday. So I'm posting this revert patch to

 A) Report the issue
 B) Provide a temporary fix

I suspect either the initial alpha value is not set correctly or setting

         state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;

causes some side effect perhaps. There's not much else that could be
different between the helper, and the original code.

 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++--
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 9e07758a755c..5c2462afe408 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -686,12 +686,14 @@ static void rcar_du_plane_reset(struct drm_plane *plane)
 	if (state == NULL)
 		return;
 
-	__drm_atomic_helper_plane_reset(plane, &state->state);
-
 	state->hwindex = -1;
 	state->source = RCAR_DU_PLANE_MEMORY;
 	state->colorkey = RCAR_DU_COLORKEY_NONE;
 	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
+
+	plane->state = &state->state;
+	plane->state->alpha = DRM_BLEND_ALPHA_OPAQUE;
+	plane->state->plane = plane;
 }
 
 static int rcar_du_plane_atomic_set_property(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 4576119e7777..3170b126cfba 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -341,8 +341,11 @@ static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
 	if (state == NULL)
 		return;
 
-	__drm_atomic_helper_plane_reset(plane, &state->state);
+	state->state.alpha = DRM_BLEND_ALPHA_OPAQUE;
 	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
+
+	plane->state = &state->state;
+	plane->state->plane = plane;
 }
 
 static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
-- 
2.17.1
