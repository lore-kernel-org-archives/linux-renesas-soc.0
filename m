Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39540 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965260AbeALXKG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 18:10:06 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 2/2] drm: rcar-du: lvds: Fix LVDS startup on R-Car gen2
Date: Sat, 13 Jan 2018 01:10:02 +0200
Message-Id: <20180112231002.26213-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <11845752.a3eY2rs97p@avalon>
References: <11845752.a3eY2rs97p@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

According to the latest revision 2.00 of the R-Car gen2 manual, the LVDS
must be enabled and the bias crcuit enabled after the LVDS I/O pins are
enabled, not before. Fix the gen2 LVDS startup sequence accordingly.

While at it, also fix the comment preceding the first LVDCR0 write that
still talks about hardcoding the LVDS mode 0.

Fixes: 90374b5c25c9 ("drm/rcar-du: Add internal LVDS encoder support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
[Set the mode and input at the same time as the BEN and LVEN bits]
Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

Hi Sergei,

For your convenience (and if you agree with bundling mode setup with the first
write as explained in my review of patch 1/2), here's the updated version of
patch 2/2 that I have taken in my development branch. If you're fine with it
I'll keep it, otherwise we can continue the review discussion.

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
index abbb7b25129a..b37c255c3d93 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -59,20 +59,20 @@ static void rcar_du_lvdsenc_start_gen2(struct rcar_du_lvdsenc *lvds,
 
 	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
 
+	/* Turn all the channels on. */
+	rcar_lvds_write(lvds, LVDCR1,
+			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
+			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
+
 	/*
-	 * Select the input, hardcode mode 0, enable LVDS operation and turn
-	 * bias circuitry on.
+	 * Set the  LVDS mode, select the input, enable LVDS operation,
+	 * and turn bias circuitry on.
 	 */
 	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_BEN | LVDCR0_LVEN;
 	if (rcrtc->index == 2)
 		lvdcr0 |= LVDCR0_DUSEL;
 	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
 
-	/* Turn all the channels on. */
-	rcar_lvds_write(lvds, LVDCR1,
-			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
-			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
-
 	/*
 	 * Turn the PLL on, wait for the startup delay, and turn the output
 	 * on.
-- 
Regards,

Laurent Pinchart
