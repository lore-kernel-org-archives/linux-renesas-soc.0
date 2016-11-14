Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36833 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753133AbcKNQjL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 11:39:11 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: [PATCH 4/4] drm: rcar-du: Fix LVDS start sequence on Gen3
Date: Mon, 14 Nov 2016 18:39:12 +0200
Message-Id: <1479141552-8509-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1479141552-8509-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479141552-8509-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

According to the latest revision of the datasheet, the LVDS I/O pins
must be enabled before starting the PLL. Fix it.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
index b74105a80a6e..e3a4985f6f3f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -104,7 +104,14 @@ static void rcar_du_lvdsenc_start_gen3(struct rcar_du_lvdsenc *lvds,
 
 	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
 
-	/* Turn the PLL on, set it to LVDS normal mode, wait for the startup
+	/* Turn all the channels on. */
+	rcar_lvds_write(lvds, LVDCR1,
+			LVDCR1_CHSTBY_GEN3(3) | LVDCR1_CHSTBY_GEN3(2) |
+			LVDCR1_CHSTBY_GEN3(1) | LVDCR1_CHSTBY_GEN3(0) |
+			LVDCR1_CLKSTBY_GEN3);
+
+	/*
+	 * Turn the PLL on, set it to LVDS normal mode, wait for the startup
 	 * delay and turn the output on.
 	 */
 	lvdcr0 = LVDCR0_PLLON;
@@ -117,12 +124,6 @@ static void rcar_du_lvdsenc_start_gen3(struct rcar_du_lvdsenc *lvds,
 
 	lvdcr0 |= LVDCR0_LVRES;
 	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
-
-	/* Turn all the channels on. */
-	rcar_lvds_write(lvds, LVDCR1,
-			LVDCR1_CHSTBY_GEN3(3) | LVDCR1_CHSTBY_GEN3(2) |
-			LVDCR1_CHSTBY_GEN3(1) | LVDCR1_CHSTBY_GEN3(0) |
-			LVDCR1_CLKSTBY_GEN3);
 }
 
 static int rcar_du_lvdsenc_start(struct rcar_du_lvdsenc *lvds,
-- 
Regards,

Laurent Pinchart
