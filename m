Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37521 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732016AbeHWSmg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 14:42:36 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ulrich.hecht+renesas@gmail.com, kieran.bingham@ideasonboard.com,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS)
Subject: [PATCH 2/4] drm: rcar-du: Write OTAR for DPAD channels only
Date: Thu, 23 Aug 2018 17:12:12 +0200
Message-Id: <1535037134-373-3-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1535037134-373-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1535037134-373-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to revision 1.00 of R-Car Gen3 SoC manual, writing to OTAR
register is valid only if the channel is equipped with a digital output
pad (DPAD).

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 7b1c05b..9ba5551 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -315,7 +315,10 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 				   params.escr);
 	}
 
-	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
+	if (rcrtc->index &
+	    rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs)
+		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02,
+				   0);
 
 	/* Signal polarities */
 	dsmr = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DSMR_VSL : 0)
-- 
2.7.4
