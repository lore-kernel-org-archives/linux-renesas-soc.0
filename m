Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:37230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732545AbeISVfj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 17:35:39 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/atomic: Initialise planes with opaque alpha values
Date: Wed, 19 Sep 2018 16:56:58 +0100
Message-Id: <20180919155700.10342-2-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20180919155700.10342-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180919155700.10342-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Planes without an alpha property, using __drm_atomic_helper_plane_reset
will have their plane state alpha initialised as zero, which represents
a transparent alpha.

If this value is then used for the plane, it may not be visible by
default, and thus doesn't represent a good initialisation state.

Update the default state->alpha value to DRM_BLEND_ALPHA_OPAQUE
unconditionally when the plane is reset.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 3cf1aa132778..e49b22381048 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3569,9 +3569,7 @@ void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
 	state->plane = plane;
 	state->rotation = DRM_MODE_ROTATE_0;
 
-	/* Reset the alpha value to fully opaque if it matters */
-	if (plane->alpha_property)
-		state->alpha = plane->alpha_property->values[1];
+	state->alpha = DRM_BLEND_ALPHA_OPAQUE;
 	state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
 
 	plane->state = state;
-- 
2.17.1
