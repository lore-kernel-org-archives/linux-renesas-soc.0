Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:40542 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387844AbeKWWbs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 17:31:48 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Subject: [PATCH] drm: rcar-du: Fix DU3 start/stop on M3-N
Date: Fri, 23 Nov 2018 13:48:08 +0200
Message-Id: <20181123114809.19693-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Group start/stop is controlled by the DRES and DEN bits of DSYSR0 for
the first group and DSYSR2 for the second group. On most DU instances,
this maps to the first CRTC of the group. On M3-N, however, DU2 doesn't
exist, but DSYSR2 does. There is no CRTC object there that maps to the
correct DSYSR register.

Commit 9144adc5e5a9 ("drm: rcar-du: Cache DSYSR value to ensure known
initial value") switched group start/stop from using group read/write
access to DSYSR to a CRTC-based API to cache the DSYSR value. While
doing so, it introduced a regression on M3-N by accessing DSYSR3 instead
of DSYSR2 to start/stop the second group.

To fix this, access the DSYSR register directly through group read/write
if the SoC is missing the first DU channel of the group. Keep using the
rcar_du_crtc_dsysr_clr_set() function otherwise, to retain the DSYSR
caching feature.

Fixes: 9144adc5e5a9 ("drm: rcar-du: Cache DSYSR value to ensure known initial value")
Reported-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index d85f0a1c1581..cebf313c6e1f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -202,10 +202,25 @@ void rcar_du_group_put(struct rcar_du_group *rgrp)
 
 static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
 {
-	struct rcar_du_crtc *rcrtc = &rgrp->dev->crtcs[rgrp->index * 2];
+	struct rcar_du_device *rcdu = rgrp->dev;
+
+	/*
+	 * Group start/stop is controlled by the DRES and DEN bits of DSYSR0
+	 * for the first group and DSYSR2 for the second group. On most DU
+	 * instances, this maps to the first CRTC of the group, and we can just
+	 * use rcar_du_crtc_dsysr_clr_set() to access the correct DSYSR. On
+	 * M3-N, however, DU2 doesn't exist, but DSYSR2 does. We thus need to
+	 * access the register directly using group read/write.
+	 */
+	if (rcdu->info->channels_mask & BIT(rgrp->index * 2)) {
+		struct rcar_du_crtc *rcrtc = &rgrp->dev->crtcs[rgrp->index * 2];
 
-	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
-				   start ? DSYSR_DEN : DSYSR_DRES);
+		rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
+					   start ? DSYSR_DEN : DSYSR_DRES);
+	} else {
+		rcar_du_group_write(rgrp, DSYSR,
+				    start ? DSYSR_DEN : DSYSR_DRES);
+	}
 }
 
 void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
-- 
Regards,

Laurent Pinchart
