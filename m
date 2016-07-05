Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Gustavo Padovan <gustavo@padovan.org>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
	Gustavo Padovan <gustavo.padovan@collabora.co.uk>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Airlie <airlied@linux.ie>,
	linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/6] drm/rcar-du: use drm_crtc_handle_vblank()
Date: Mon,  4 Jul 2016 21:04:51 -0300
Message-Id: <1467677092-5089-5-git-send-email-gustavo@padovan.org>
In-Reply-To: <1467677092-5089-1-git-send-email-gustavo@padovan.org>
References: <1467677092-5089-1-git-send-email-gustavo@padovan.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Remove legacy usage of drm_handle_vblank()

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 0d8bdda..e39fcef 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -552,7 +552,7 @@ static irqreturn_t rcar_du_crtc_irq(int irq, void *arg)
 	rcar_du_crtc_write(rcrtc, DSRCR, status & DSRCR_MASK);
 
 	if (status & DSSR_FRM) {
-		drm_handle_vblank(rcrtc->crtc.dev, rcrtc->index);
+		drm_crtc_handle_vblank(&rcrtc->crtc);
 		rcar_du_crtc_finish_page_flip(rcrtc);
 		ret = IRQ_HANDLED;
 	}
-- 
2.5.5
