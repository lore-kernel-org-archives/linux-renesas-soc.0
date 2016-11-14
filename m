Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36834 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754061AbcKNQjK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 11:39:10 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: [PATCH 2/4] drm: rcar-du: Fix display timing controller parameter
Date: Mon, 14 Nov 2016 18:39:10 +0200
Message-Id: <1479141552-8509-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1479141552-8509-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479141552-8509-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

There is a bug in the setting of the DES (Display Enable Signal)
register. This current setting occurs 1 dot left shift. The DES
register should be set minus one value about the specifying value
with H/W specification. This patch corrects it.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 7316fc7fa0bd..aca26eed93b1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -172,7 +172,7 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 					mode->crtc_vsync_start - 1);
 	rcar_du_crtc_write(rcrtc, VCR,  mode->crtc_vtotal - 1);
 
-	rcar_du_crtc_write(rcrtc, DESR,  mode->htotal - mode->hsync_start);
+	rcar_du_crtc_write(rcrtc, DESR,  mode->htotal - mode->hsync_start - 1);
 	rcar_du_crtc_write(rcrtc, DEWR,  mode->hdisplay);
 }
 
-- 
Regards,

Laurent Pinchart
