Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39292 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751185AbdBLMcI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Feb 2017 07:32:08 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/3] drm: rcar-du: Handle event when disabling CRTCs
Date: Sun, 12 Feb 2017 14:32:27 +0200
Message-Id: <20170212123229.18277-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170212123229.18277-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170212123229.18277-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The driver currently handles vblank events only when updating planes on
a CRTC. The atomic update API however allows requesting an event when
disabling a CRTC. This currently leads to event objects being leaked in
the kernel and to events not being sent out. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index edcbe2e3625d..04046c0faffd 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -488,6 +488,13 @@ static void rcar_du_crtc_disable(struct drm_crtc *crtc)
 	rcar_du_crtc_stop(rcrtc);
 	rcar_du_crtc_put(rcrtc);
 
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (crtc->state->event) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irq(&crtc->dev->event_lock);
+
 	rcrtc->outputs = 0;
 }
 
-- 
Regards,

Laurent Pinchart
