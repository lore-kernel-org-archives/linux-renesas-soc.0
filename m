Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:59035 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966527AbeEYPvr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 May 2018 11:51:47 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Liviu Dudau <Liviu.Dudau@arm.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] drm/rcar-du: fix merge conflict for state->alpha
Date: Fri, 25 May 2018 17:50:11 +0200
Message-Id: <20180525155030.3667352-4-arnd@arndb.de>
In-Reply-To: <20180525155030.3667352-1-arnd@arndb.de>
References: <20180525155030.3667352-1-arnd@arndb.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The "alpha" struct member was removed in one commit but another user
added in another, leading to a build failure:

drivers/gpu/drm/rcar-du/rcar_du_vsp.c: In function 'rcar_du_vsp_plane_atomic_duplicate_state':
drivers/gpu/drm/rcar-du/rcar_du_vsp.c:325:6: error: 'struct rcar_du_vsp_plane_state' has no member named 'alpha'
  copy->alpha = to_rcar_vsp_plane_state(plane->state)->alpha;

This fixes up the merge by using the correct member.

Fixes: 75a07f399cd4 ("drm: rcar-du: Zero-out sg_tables when duplicating plane state")
Fixes: 301a9b8d5456 ("drm/rcar-du: Convert to the new generic alpha property")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 4a98470626d5..d9232e749b6d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -322,7 +322,7 @@ rcar_du_vsp_plane_atomic_duplicate_state(struct drm_plane *plane)
 		return NULL;
 
 	__drm_atomic_helper_plane_duplicate_state(plane, &copy->state);
-	copy->alpha = to_rcar_vsp_plane_state(plane->state)->alpha;
+	copy->state.alpha = plane->state->alpha;
 
 	return &copy->state;
 }
-- 
2.9.0
