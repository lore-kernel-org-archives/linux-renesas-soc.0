Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58698 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161664AbeBNSNW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 13:13:22 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 1/3] drm: rcar-du: lvds: Fix LVDS startup on R-Car Gen2
Date: Wed, 14 Feb 2018 20:13:46 +0200
Message-Id: <20180214181348.16258-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180214181348.16258-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180214181348.16258-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

According to the latest revision 2.00 of the R-Car Gen2 manual, the LVDS
and the bias circuit must be enabled after the LVDS I/O pins are
enabled, not before. Fix the Gen2 LVDS startup sequence accordingly.

While at it, also fix the comment preceding the first LVDCR0 write that
still talks about hardcoding the LVDS mode 0.

Fixes: 90374b5c25c9 ("drm/rcar-du: Add internal LVDS encoder support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
index abbb7b25129a..dcffd3b59b69 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -59,11 +59,8 @@ static void rcar_du_lvdsenc_start_gen2(struct rcar_du_lvdsenc *lvds,
 
 	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
 
-	/*
-	 * Select the input, hardcode mode 0, enable LVDS operation and turn
-	 * bias circuitry on.
-	 */
-	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_BEN | LVDCR0_LVEN;
+	/* Select the input and set the LVDS mode. */
+	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
 	if (rcrtc->index == 2)
 		lvdcr0 |= LVDCR0_DUSEL;
 	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
@@ -73,6 +70,10 @@ static void rcar_du_lvdsenc_start_gen2(struct rcar_du_lvdsenc *lvds,
 			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
 			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
 
+	/* Enable LVDS operation and turn bias circuitry on. */
+	lvdcr0 |= LVDCR0_BEN | LVDCR0_LVEN;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+
 	/*
 	 * Turn the PLL on, wait for the startup delay, and turn the output
 	 * on.
-- 
Regards,

Laurent Pinchart
