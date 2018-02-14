Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58701 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161770AbeBNSNY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 13:13:24 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 2/3] drm: rcar-du: lvds: Fix LVDS startup on R-Car Gen3
Date: Wed, 14 Feb 2018 20:13:47 +0200
Message-Id: <20180214181348.16258-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180214181348.16258-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180214181348.16258-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

According to the latest revisions of the R-Car Gen3 manual, the LVDS mode
must be set before the LVDS I/O pins are enabled, not after -- fix the
Gen3 LVDS startup sequence accordingly.

Fixes: e947eccbeba4 ("drm: rcar-du: Add support for LVDS mode selection")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
[Updated comment in rcar_du_lvdsenc_start_gen3()]
[Moved Gen2 startup comment update to separate commit]
[Fixed =| typo]
Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
index dcffd3b59b69..01ef0f728e94 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -95,7 +95,7 @@ static void rcar_du_lvdsenc_start_gen3(struct rcar_du_lvdsenc *lvds,
 	u32 lvdcr0;
 	u32 pllcr;
 
-	/* PLL clock configuration */
+	/* Set the PLL clock configuration and LVDS mode. */
 	if (freq < 42000)
 		pllcr = LVDPLLCR_PLLDIVCNT_42M;
 	else if (freq < 85000)
@@ -107,6 +107,9 @@ static void rcar_du_lvdsenc_start_gen3(struct rcar_du_lvdsenc *lvds,
 
 	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
 
+	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+
 	/* Turn all the channels on. */
 	rcar_lvds_write(lvds, LVDCR1,
 			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
@@ -116,7 +119,7 @@ static void rcar_du_lvdsenc_start_gen3(struct rcar_du_lvdsenc *lvds,
 	 * Turn the PLL on, set it to LVDS normal mode, wait for the startup
 	 * delay and turn the output on.
 	 */
-	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_PLLON;
+	lvdcr0 |= LVDCR0_PLLON;
 	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
 
 	lvdcr0 |= LVDCR0_PWD;
-- 
Regards,

Laurent Pinchart
