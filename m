Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Gustavo Padovan <gustavo@padovan.org>
To: dri-devel@lists.freedesktop.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Airlie <airlied@linux.ie>,
	linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 14/14] drm/shmobile: use drm_crtc_vblank_{get,put}()
Date: Mon,  6 Jun 2016 11:41:45 -0300
Message-Id: <1465224105-21485-14-git-send-email-gustavo@padovan.org>
In-Reply-To: <1465224105-21485-1-git-send-email-gustavo@padovan.org>
References: <1465224105-21485-1-git-send-email-gustavo@padovan.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Replace the legacy drm_vblank_{get,put}() with the new helper functions.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index 1e154fc..6547b1d 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -441,7 +441,7 @@ void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc)
 	scrtc->event = NULL;
 	if (event) {
 		drm_crtc_send_vblank_event(&scrtc->crtc, event);
-		drm_vblank_put(dev, 0);
+		drm_crtc_vblank_put(&scrtc->crtc);
 	}
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
@@ -467,7 +467,7 @@ static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
 
 	if (event) {
 		event->pipe = 0;
-		drm_vblank_get(dev, 0);
+		drm_crtc_vblank_get(&scrtc->crtc);
 		spin_lock_irqsave(&dev->event_lock, flags);
 		scrtc->event = event;
 		spin_unlock_irqrestore(&dev->event_lock, flags);
-- 
2.5.5
