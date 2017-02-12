Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39294 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751185AbdBLMcK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Feb 2017 07:32:10 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/3] drm: rcar-du: Clear handled event pointer in CRTC state
Date: Sun, 12 Feb 2017 14:32:28 +0200
Message-Id: <20170212123229.18277-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170212123229.18277-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170212123229.18277-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The atomic commit helper requires drivers to clear the event pointer
stored in the CRTC state when the event is handled. In preparation to
using the helper, fix the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 04046c0faffd..7391dd95c733 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -501,16 +501,16 @@ static void rcar_du_crtc_disable(struct drm_crtc *crtc)
 static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
 				      struct drm_crtc_state *old_crtc_state)
 {
-	struct drm_pending_vblank_event *event = crtc->state->event;
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 	struct drm_device *dev = rcrtc->crtc.dev;
 	unsigned long flags;
 
-	if (event) {
+	if (crtc->state->event) {
 		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 
 		spin_lock_irqsave(&dev->event_lock, flags);
-		rcrtc->event = event;
+		rcrtc->event = crtc->state->event;
+		crtc->state->event = NULL;
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
-- 
Regards,

Laurent Pinchart
