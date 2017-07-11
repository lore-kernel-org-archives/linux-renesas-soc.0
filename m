Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58153 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932686AbdGKU7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2017 16:59:13 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: rcar-du: Use the VBK interrupt for vblank events
Date: Tue, 11 Jul 2017 23:59:11 +0300
Message-Id: <20170711205911.21571-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When implementing support for interlaced modes, the driver switched from
reporting vblank events on the vertical blanking (VBK) interrupt to the
frame end interrupt (FRM). This incorrectly divided the reported refresh
rate by two. Fix it by moving back to the VBK interrupt.

Fixes: 906eff7fcada ("drm: rcar-du: Implement support for interlaced modes")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 98cf446391dc..17fd1cd5212c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -698,7 +698,7 @@ static irqreturn_t rcar_du_crtc_irq(int irq, void *arg)
 	status = rcar_du_crtc_read(rcrtc, DSSR);
 	rcar_du_crtc_write(rcrtc, DSRCR, status & DSRCR_MASK);
 
-	if (status & DSSR_FRM) {
+	if (status & DSSR_VBK) {
 		drm_crtc_handle_vblank(&rcrtc->crtc);
 
 		if (rcdu->info->gen < 3)
-- 
Regards,

Laurent Pinchart
