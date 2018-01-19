Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:38438 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755940AbeASSfy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 13:35:54 -0500
Received: by mail-lf0-f67.google.com with SMTP id g72so3208683lfg.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 10:35:53 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180119183549.043204666@cogentembedded.com>
Date: Fri, 19 Jan 2018 21:29:19 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: devicetree@vger.kernel.org
Subject: [PATCH 1/3] drm: rcar-du: lvds: refactor LVDS startup
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=drm-rcar-du-lvds-refactor-LVDS-startup.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

After the recent corrections to the R-Car gen2/3 LVDS startup code, already
similar enough at their ends rcar_lvds_enable_gen{2|3}() started asking for
a merge and it's becoming actually necessary with the addition of the R-Car
V3M (R8A77970) support -- this gen3 SoC has gen2-like LVDPLLCR layout.

BTW, such a merge saves 64 bytes of the object code with AArch64 gcc 4.8.5.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/gpu/drm/rcar-du/rcar_lvds.c |  137 +++++++++++++++---------------------
 1 file changed, 59 insertions(+), 78 deletions(-)

Index: linux/drivers/gpu/drm/rcar-du/rcar_lvds.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -125,98 +125,46 @@ static const struct drm_connector_funcs
  * Bridge
  */
 
-static void rcar_lvds_enable_gen2(struct rcar_lvds *lvds)
+static u32 rcar_lvds_lvdpllcr_gen2(unsigned int freq)
 {
-	const struct drm_display_mode *mode = &lvds->display_mode;
-	/*
-	 * FIXME: We should really retrieve this through the state, but how do
-	 * we get a state pointer?
-	 */
-	struct drm_crtc *crtc = lvds->bridge.encoder->crtc;
-	unsigned int freq = mode->clock;
-	u32 lvdcr0;
-	u32 pllcr;
+	u32 lvdpllcr;
 
-	/* PLL clock configuration */
 	if (freq < 39000)
-		pllcr = LVDPLLCR_CEEN | LVDPLLCR_COSEL | LVDPLLCR_PLLDLYCNT_38M;
+		lvdpllcr = LVDPLLCR_PLLDLYCNT_38M;
 	else if (freq < 61000)
-		pllcr = LVDPLLCR_CEEN | LVDPLLCR_COSEL | LVDPLLCR_PLLDLYCNT_60M;
+		lvdpllcr = LVDPLLCR_PLLDLYCNT_60M;
 	else if (freq < 121000)
-		pllcr = LVDPLLCR_CEEN | LVDPLLCR_COSEL | LVDPLLCR_PLLDLYCNT_121M;
+		lvdpllcr = LVDPLLCR_PLLDLYCNT_121M;
 	else
-		pllcr = LVDPLLCR_PLLDLYCNT_150M;
-
-	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
-
-	/* Turn all the channels on. */
-	rcar_lvds_write(lvds, LVDCR1, LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
-			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
-
-	/*
-	 * Set the  LVDS mode, select the input, enable LVDS operation,
-	 * and turn bias circuitry on.
-	 */
-	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_BEN | LVDCR0_LVEN;
-	if (drm_crtc_index(crtc) == 2)
-		lvdcr0 |= LVDCR0_DUSEL;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
-
-	/*
-	 * Turn the PLL on, wait for the startup delay, and turn the output
-	 * on.
-	 */
-	lvdcr0 |= LVDCR0_PLLON;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+		return LVDPLLCR_PLLDLYCNT_150M;
 
-	usleep_range(100, 150);
-
-	lvdcr0 |= LVDCR0_LVRES;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	return lvdpllcr | LVDPLLCR_CEEN | LVDPLLCR_COSEL;
 }
 
-static void rcar_lvds_enable_gen3(struct rcar_lvds *lvds)
+static u32 rcar_lvds_lvdpllcr_gen3(unsigned int freq)
 {
-	const struct drm_display_mode *mode = &lvds->display_mode;
-	unsigned int freq = mode->clock;
-	u32 lvdcr0;
-	u32 pllcr;
-
-	/* PLL clock configuration */
 	if (freq < 42000)
-		pllcr = LVDPLLCR_PLLDIVCNT_42M;
+		return LVDPLLCR_PLLDIVCNT_42M;
 	else if (freq < 85000)
-		pllcr = LVDPLLCR_PLLDIVCNT_85M;
+		return LVDPLLCR_PLLDIVCNT_85M;
 	else if (freq < 128000)
-		pllcr = LVDPLLCR_PLLDIVCNT_128M;
-	else
-		pllcr = LVDPLLCR_PLLDIVCNT_148M;
-
-	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
-
-	/* Turn all the channels on. */
-	rcar_lvds_write(lvds, LVDCR1, LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
-			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
+		return LVDPLLCR_PLLDIVCNT_128M;
 
-	/*
-	 * Turn the PLL on, set it to LVDS normal mode, wait for the startup
-	 * delay and turn the output on.
-	 */
-	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_PLLON;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
-
-	lvdcr0 |= LVDCR0_PWD;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
-
-	usleep_range(100, 150);
-
-	lvdcr0 |= LVDCR0_LVRES;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	return LVDPLLCR_PLLDIVCNT_148M;
 }
 
 static void rcar_lvds_enable(struct drm_bridge *bridge)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
+	/*
+	 * FIXME: We should really retrieve this through the state, but how do
+	 * we get a state pointer?
+	 */
+	struct drm_crtc *crtc = lvds->bridge.encoder->crtc;
+	const struct drm_display_mode *mode = &lvds->display_mode;
+	unsigned int gen = lvds->info->gen;
+	u32 lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
+	u32 lvdpllcr;
 	u32 lvdhcr;
 	int ret;
 
@@ -244,14 +192,47 @@ static void rcar_lvds_enable(struct drm_
 	else
 		lvdhcr = LVDCHCR_CHSEL_CH(0, 0) | LVDCHCR_CHSEL_CH(1, 1)
 		       | LVDCHCR_CHSEL_CH(2, 2) | LVDCHCR_CHSEL_CH(3, 3);
-
 	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
 
-	/* Perform generation-specific initialization. */
-	if (lvds->info->gen < 3)
-		rcar_lvds_enable_gen2(lvds);
+	/* PLL clock configuration */
+	if (gen < 3)
+		lvdpllcr = rcar_lvds_lvdpllcr_gen2(mode->clock);
 	else
-		rcar_lvds_enable_gen3(lvds);
+		lvdpllcr = rcar_lvds_lvdpllcr_gen3(mode->clock);
+	rcar_lvds_write(lvds, LVDPLLCR, lvdpllcr);
+
+	/* Turn all the channels on. */
+	rcar_lvds_write(lvds, LVDCR1,
+			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
+			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
+
+	if (gen < 3) {
+		/*
+		 * Select the input, enable LVDS operation, and turn
+		 * the bias circuitry on.
+		 */
+		lvdcr0 |= LVDCR0_BEN | LVDCR0_LVEN;
+		if (drm_crtc_index(crtc) == 2)
+			lvdcr0 |= LVDCR0_DUSEL;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
+
+	/* Turn the PLL on. */
+	lvdcr0 |= LVDCR0_PLLON;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+
+	if (gen > 2) {
+		/* Turn on the LVDS normal mode. */
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
 
 	if (lvds->panel) {
 		drm_panel_prepare(lvds->panel);
