Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:37242 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732513AbeISVfj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 17:35:39 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm: rcar-du: Enable alpha property on primary planes
Date: Wed, 19 Sep 2018 16:56:59 +0100
Message-Id: <20180919155700.10342-3-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20180919155700.10342-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180919155700.10342-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If the alpha property is not added to a plane, a default value will be
used, which can result in a non-visible layer if the alpha is
initialised as 0.

Provide an alpha blend property on all planes.

Fixes: 161ad653d6c9 ("drm: rcar-du: Use __drm_atomic_helper_plane_reset
instead of copying the logic")

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 9e07758a755c..72399a19d8a6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -783,13 +783,18 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
 		drm_plane_helper_add(&plane->plane,
 				     &rcar_du_plane_helper_funcs);
 
+		/*
+		 * The alpha property needs to be initialised on all planes
+		 * to ensure the correct setting at the output.
+		 */
+		drm_plane_create_alpha_property(&plane->plane);
+
 		if (type == DRM_PLANE_TYPE_PRIMARY)
 			continue;
 
 		drm_object_attach_property(&plane->plane.base,
 					   rcdu->props.colorkey,
 					   RCAR_DU_COLORKEY_NONE);
-		drm_plane_create_alpha_property(&plane->plane);
 		drm_plane_create_zpos_property(&plane->plane, 1, 1, 7);
 	}
 
-- 
2.17.1
