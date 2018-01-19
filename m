Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:40860 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755940AbeASSgB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 13:36:01 -0500
Received: by mail-lf0-f67.google.com with SMTP id h92so3197124lfi.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 10:36:01 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180119183557.226328412@cogentembedded.com>
Date: Fri, 19 Jan 2018 21:29:21 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: devicetree@vger.kernel.org
Subject: [PATCH 3/3] drm: rcar-du: lvds: add R8A77970 support
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=drm-rcar-du-lvds-add-R8A77970-support.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for the R-Car V3M (R8A77970) SoC to the LVDS encoder driver.
Note that there are some differences with the other R-Car gen3 SoCs, e.g.
LVDPLLCR has the same layout as in the R-Car gen2 SoCs...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/gpu/drm/rcar-du/rcar_lvds.c |   21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

Index: linux/drivers/gpu/drm/rcar-du/rcar_lvds.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -32,6 +32,10 @@ enum rcar_lvds_mode {
 };
 
 #define RCAR_LVDS_QUIRK_LANES	(1 << 0)	/* LVDS lanes 1 and 3 inverted */
+#define RCAR_LVDS_QUIRK_GEN2_PLLCR (1 << 1)	/* LVDPLLCR has gen2-like */
+						/* layout on R8A77970 */
+#define RCAR_LVDS_QUIRK_PHY	(1 << 2)	/* LVDS has PHY on R8A77970 */
+						/* and  R8A7799{0|5} */
 
 struct rcar_lvds_device_info {
 	unsigned int gen;
@@ -162,6 +166,7 @@ static void rcar_lvds_enable(struct drm_
 	 */
 	struct drm_crtc *crtc = lvds->bridge.encoder->crtc;
 	const struct drm_display_mode *mode = &lvds->display_mode;
+	unsigned int quirks = lvds->info->quirks;
 	unsigned int gen = lvds->info->gen;
 	u32 lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
 	u32 lvdpllcr;
@@ -186,7 +191,7 @@ static void rcar_lvds_enable(struct drm_
 			LVDCTRCR_CTR2SEL_DISP | LVDCTRCR_CTR1SEL_VSYNC |
 			LVDCTRCR_CTR0SEL_HSYNC);
 
-	if (lvds->info->quirks & RCAR_LVDS_QUIRK_LANES)
+	if (quirks & RCAR_LVDS_QUIRK_LANES)
 		lvdhcr = LVDCHCR_CHSEL_CH(0, 0) | LVDCHCR_CHSEL_CH(1, 3)
 		       | LVDCHCR_CHSEL_CH(2, 2) | LVDCHCR_CHSEL_CH(3, 1);
 	else
@@ -195,7 +200,7 @@ static void rcar_lvds_enable(struct drm_
 	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
 
 	/* PLL clock configuration */
-	if (gen < 3)
+	if (gen < 3 || quirks & RCAR_LVDS_QUIRK_GEN2_PLLCR)
 		lvdpllcr = rcar_lvds_lvdpllcr_gen2(mode->clock);
 	else
 		lvdpllcr = rcar_lvds_lvdpllcr_gen3(mode->clock);
@@ -227,6 +232,12 @@ static void rcar_lvds_enable(struct drm_
 		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
 	}
 
+	if (quirks & RCAR_LVDS_QUIRK_PHY) {
+		/* Turn on the LVDS PHY. */
+		lvdcr0 |= LVDCR0_LVEN;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
+
 	/* Wait for the startup delay. */
 	usleep_range(100, 150);
 
@@ -499,6 +510,11 @@ static const struct rcar_lvds_device_inf
 	.gen = 3,
 };
 
+static const struct rcar_lvds_device_info rcar_lvds_r8a77970_info = {
+	.gen = 3,
+	.quirks = RCAR_LVDS_QUIRK_GEN2_PLLCR | RCAR_LVDS_QUIRK_PHY,
+};
+
 static const struct of_device_id rcar_lvds_of_table[] = {
 	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
@@ -506,6 +522,7 @@ static const struct of_device_id rcar_lv
 	{ .compatible = "renesas,r8a7793-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a7796-lvds", .data = &rcar_lvds_gen3_info },
+	{ .compatible = "renesas,r8a77970-lvds", .data = &rcar_lvds_r8a77970_info },
 	{ }
 };
 
