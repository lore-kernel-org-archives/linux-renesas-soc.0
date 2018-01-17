Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:47320 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754406AbeAQSo3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 13:44:29 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: rcar-du: Remove zpos field from rcar_du_vsp_plane_state structure
Date: Wed, 17 Jan 2018 20:44:29 +0200
Message-Id: <20180117184429.7809-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since commit 2fc4d838aaf2 ("drm: rcar: use generic code for managing
zpos plane property") the rcar-du driver stores the plane zpos in the
drm_plane_state structure. The commit however forgot to remove the zpos
field from the rcar_du_vsp_plane_state structure. Remove it.

Fixes: 2fc4d838aaf2 ("drm: rcar: use generic code for managing zpos plane property")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
index f876c512163c..4c5d7bbce6aa 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -45,7 +45,6 @@ static inline struct rcar_du_vsp_plane *to_rcar_vsp_plane(struct drm_plane *p)
  * @format: information about the pixel format used by the plane
  * @sg_tables: scatter-gather tables for the frame buffer memory
  * @alpha: value of the plane alpha property
- * @zpos: value of the plane zpos property
  */
 struct rcar_du_vsp_plane_state {
 	struct drm_plane_state state;
@@ -54,7 +53,6 @@ struct rcar_du_vsp_plane_state {
 	struct sg_table sg_tables[3];
 
 	unsigned int alpha;
-	unsigned int zpos;
 };
 
 static inline struct rcar_du_vsp_plane_state *
-- 
Regards,

Laurent Pinchart
