Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49849 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751370AbdCDNzJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Mar 2017 08:55:09 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Arm the page flip event after queuing the page flip.
Date: Sat,  4 Mar 2017 15:55:38 +0200
Message-Id: <20170304135538.17008-1-laurent.pinchart+renesas@ideasonboard.com>
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

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 7391dd95c733..7f6663ccd797 100644
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
@@ -522,11 +511,22 @@ static void rcar_du_crtc_atomic_flush(struct drm_crtc *crtc,
 				      struct drm_crtc_state *old_crtc_state)
 {
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+	struct drm_device *dev = rcrtc->crtc.dev;
+	unsigned long flags;
 
 	rcar_du_crtc_update_planes(rcrtc);
 
 	if (rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_atomic_flush(rcrtc);
+
+	if (crtc->state->event) {
+		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+
+		spin_lock_irqsave(&dev->event_lock, flags);
+		rcrtc->event = crtc->state->event;
+		crtc->state->event = NULL;
+		spin_unlock_irqrestore(&dev->event_lock, flags);
+	}
 }
 
 static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
-- 
Regards,

Laurent Pinchart
