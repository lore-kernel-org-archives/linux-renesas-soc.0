Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52648 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752469AbdCEBTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Mar 2017 20:19:33 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2] drm: rcar-du: Arm the page flip event after queuing the page flip
Date: Sun,  5 Mar 2017 03:10:32 +0200
Message-Id: <20170305011032.32747-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The page flip event is armed in the atomic begin handler, creating a
race condition with the frame end interrupt that could send the event
before the atomic operation actually completes. To avoid that, arm the
event in the atomic flush handler after queuing the page flip.

This change doesn't fully close the race window, as the frame end
interrupt could be generated before the page flip is committed to
hardware but only handled after the event is armed. However, the race
window is now much smaller.

The event must however be armed before calling the VSP atomic commit
function, otherwise the completion callback could arrive before we arm
the event, resulting in a deadlock.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

Changes since v1:

- Arm the event before calling the VSP atomic commit function

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 7391dd95c733..2aceb84fc15d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -502,17 +502,6 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
 				      struct drm_crtc_state *old_crtc_state)
 {
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
-	struct drm_device *dev = rcrtc->crtc.dev;
-	unsigned long flags;
-
-	if (crtc->state->event) {
-		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
-
-		spin_lock_irqsave(&dev->event_lock, flags);
-		rcrtc->event = crtc->state->event;
-		crtc->state->event = NULL;
-		spin_unlock_irqrestore(&dev->event_lock, flags);
-	}
 
 	if (rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_atomic_begin(rcrtc);
@@ -522,9 +511,20 @@ static void rcar_du_crtc_atomic_flush(struct drm_crtc *crtc,
 				      struct drm_crtc_state *old_crtc_state)
 {
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+	struct drm_device *dev = rcrtc->crtc.dev;
+	unsigned long flags;
 
 	rcar_du_crtc_update_planes(rcrtc);
 
+	if (crtc->state->event) {
+		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+
+		spin_lock_irqsave(&dev->event_lock, flags);
+		rcrtc->event = crtc->state->event;
+		crtc->state->event = NULL;
+		spin_unlock_irqrestore(&dev->event_lock, flags);
+	}
+
 	if (rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_atomic_flush(rcrtc);
 }
-- 
Regards,

Laurent Pinchart
