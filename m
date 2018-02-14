Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58702 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161772AbeBNSNY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 13:13:24 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 3/3] drm: rcar-du: lvds: Refactor LVDS startup
Date: Wed, 14 Feb 2018 20:13:48 +0200
Message-Id: <20180214181348.16258-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180214181348.16258-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180214181348.16258-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

After the recent corrections to the R-Car gen2/3 LVDS startup code, already
similar enough at their ends rcar_lvds_enable_gen{2|3}() started asking for
a merge and it's becoming actually necessary with the addition of the R-Car
V3M (R8A77970) support -- this gen3 SoC has gen2-like LVDPLLCR layout.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c | 132 ++++++++++++------------------
 1 file changed, 51 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
index 01ef0f728e94..4defa8123eb2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -39,102 +39,37 @@ static void rcar_lvds_write(struct rcar_du_lvdsenc *lvds, u32 reg, u32 data)
 	iowrite32(data, lvds->mmio + reg);
 }
 
-static void rcar_du_lvdsenc_start_gen2(struct rcar_du_lvdsenc *lvds,
-				       struct rcar_du_crtc *rcrtc)
+static u32 rcar_lvds_lvdpllcr_gen2(unsigned int freq)
 {
-	const struct drm_display_mode *mode = &rcrtc->crtc.mode;
-	unsigned int freq = mode->clock;
-	u32 lvdcr0;
-	u32 pllcr;
-
-	/* PLL clock configuration */
 	if (freq < 39000)
-		pllcr = LVDPLLCR_CEEN | LVDPLLCR_COSEL | LVDPLLCR_PLLDLYCNT_38M;
+		return LVDPLLCR_CEEN | LVDPLLCR_COSEL | LVDPLLCR_PLLDLYCNT_38M;
 	else if (freq < 61000)
-		pllcr = LVDPLLCR_CEEN | LVDPLLCR_COSEL | LVDPLLCR_PLLDLYCNT_60M;
+		return LVDPLLCR_CEEN | LVDPLLCR_COSEL | LVDPLLCR_PLLDLYCNT_60M;
 	else if (freq < 121000)
-		pllcr = LVDPLLCR_CEEN | LVDPLLCR_COSEL | LVDPLLCR_PLLDLYCNT_121M;
+		return LVDPLLCR_CEEN | LVDPLLCR_COSEL | LVDPLLCR_PLLDLYCNT_121M;
 	else
-		pllcr = LVDPLLCR_PLLDLYCNT_150M;
-
-	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
-
-	/* Select the input and set the LVDS mode. */
-	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
-	if (rcrtc->index == 2)
-		lvdcr0 |= LVDCR0_DUSEL;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
-
-	/* Turn all the channels on. */
-	rcar_lvds_write(lvds, LVDCR1,
-			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
-			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
-
-	/* Enable LVDS operation and turn bias circuitry on. */
-	lvdcr0 |= LVDCR0_BEN | LVDCR0_LVEN;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
-
-	/*
-	 * Turn the PLL on, wait for the startup delay, and turn the output
-	 * on.
-	 */
-	lvdcr0 |= LVDCR0_PLLON;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
-
-	usleep_range(100, 150);
-
-	lvdcr0 |= LVDCR0_LVRES;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+		return LVDPLLCR_PLLDLYCNT_150M;
 }
 
-static void rcar_du_lvdsenc_start_gen3(struct rcar_du_lvdsenc *lvds,
-				       struct rcar_du_crtc *rcrtc)
+static u32 rcar_lvds_lvdpllcr_gen3(unsigned int freq)
 {
-	const struct drm_display_mode *mode = &rcrtc->crtc.mode;
-	unsigned int freq = mode->clock;
-	u32 lvdcr0;
-	u32 pllcr;
-
-	/* Set the PLL clock configuration and LVDS mode. */
 	if (freq < 42000)
-		pllcr = LVDPLLCR_PLLDIVCNT_42M;
+		return LVDPLLCR_PLLDIVCNT_42M;
 	else if (freq < 85000)
-		pllcr = LVDPLLCR_PLLDIVCNT_85M;
+		return LVDPLLCR_PLLDIVCNT_85M;
 	else if (freq < 128000)
-		pllcr = LVDPLLCR_PLLDIVCNT_128M;
+		return LVDPLLCR_PLLDIVCNT_128M;
 	else
-		pllcr = LVDPLLCR_PLLDIVCNT_148M;
-
-	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
-
-	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
-
-	/* Turn all the channels on. */
-	rcar_lvds_write(lvds, LVDCR1,
-			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
-			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
-
-	/*
-	 * Turn the PLL on, set it to LVDS normal mode, wait for the startup
-	 * delay and turn the output on.
-	 */
-	lvdcr0 |= LVDCR0_PLLON;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
-
-	lvdcr0 |= LVDCR0_PWD;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
-
-	usleep_range(100, 150);
-
-	lvdcr0 |= LVDCR0_LVRES;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+		return LVDPLLCR_PLLDIVCNT_148M;
 }
 
 static int rcar_du_lvdsenc_start(struct rcar_du_lvdsenc *lvds,
 				 struct rcar_du_crtc *rcrtc)
 {
+	const struct drm_display_mode *mode = &rcrtc->crtc.mode;
+	u32 lvdpllcr;
 	u32 lvdhcr;
+	u32 lvdcr0;
 	int ret;
 
 	if (lvds->enabled)
@@ -165,11 +100,46 @@ static int rcar_du_lvdsenc_start(struct rcar_du_lvdsenc *lvds,
 
 	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
 
-	/* Perform generation-specific initialization. */
+	/* PLL clock configuration. */
 	if (lvds->dev->info->gen < 3)
-		rcar_du_lvdsenc_start_gen2(lvds, rcrtc);
+		lvdpllcr = rcar_lvds_lvdpllcr_gen2(mode->clock);
 	else
-		rcar_du_lvdsenc_start_gen3(lvds, rcrtc);
+		lvdpllcr = rcar_lvds_lvdpllcr_gen3(mode->clock);
+	rcar_lvds_write(lvds, LVDPLLCR, lvdpllcr);
+
+	/* Set the LVDS mode and select the input. */
+	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
+	if (rcrtc->index == 2)
+		lvdcr0 |= LVDCR0_DUSEL;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+
+	/* Turn all the channels on. */
+	rcar_lvds_write(lvds, LVDCR1,
+			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
+			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
+
+	if (lvds->dev->info->gen < 3) {
+		/* Enable LVDS operation and turn the bias circuitry on. */
+		lvdcr0 |= LVDCR0_BEN | LVDCR0_LVEN;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
+
+	/* Turn the PLL on. */
+	lvdcr0 |= LVDCR0_PLLON;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+
+	if (lvds->dev->info->gen > 2) {
+		/* Set LVDS normal mode. */
+		lvdcr0 |= LVDCR0_PWD;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
+
+	/* Wait for the startup delay. */
+	usleep_range(100, 150);
+
+	/* Turn the output on. */
+	lvdcr0 |= LVDCR0_LVRES;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
 
 	lvds->enabled = true;
 
-- 
Regards,

Laurent Pinchart
