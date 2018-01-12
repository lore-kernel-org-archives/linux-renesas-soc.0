Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39270 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964844AbeALVkO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 16:40:14 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] drm: rcar-du: lvds: Fix LVDS clock frequency range
Date: Fri, 12 Jan 2018 23:40:10 +0200
Message-Id: <20180112214010.7139-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to the latest versions of both the Gen2 and Gen3 datasheets,
the operating range for the LVDS clock is 31 MHz to 148.5 MHz on all
SoCs. Update the driver accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
index 553bab7b3b1e..abbb7b25129a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -201,17 +201,11 @@ int rcar_du_lvdsenc_enable(struct rcar_du_lvdsenc *lvds, struct drm_crtc *crtc,
 void rcar_du_lvdsenc_atomic_check(struct rcar_du_lvdsenc *lvds,
 				  struct drm_display_mode *mode)
 {
-	struct rcar_du_device *rcdu = lvds->dev;
-
 	/*
 	 * The internal LVDS encoder has a restricted clock frequency operating
-	 * range (30MHz to 150MHz on Gen2, 25.175MHz to 148.5MHz on Gen3). Clamp
-	 * the clock accordingly.
+	 * range (31MHz to 148.5MHz). Clamp the clock accordingly.
 	 */
-	if (rcdu->info->gen < 3)
-		mode->clock = clamp(mode->clock, 30000, 150000);
-	else
-		mode->clock = clamp(mode->clock, 25175, 148500);
+	mode->clock = clamp(mode->clock, 31000, 148500);
 }
 
 void rcar_du_lvdsenc_set_mode(struct rcar_du_lvdsenc *lvds,
-- 
Regards,

Laurent Pinchart
