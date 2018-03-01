Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:44374 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033798AbeCASKU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Mar 2018 13:10:20 -0500
Received: by mail-lf0-f65.google.com with SMTP id v9so9589979lfa.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Mar 2018 10:10:19 -0800 (PST)
Subject: [PATCH v2 2/2] drm: rcar-du: lvds: add R8A77970 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <df9de4e7-cf72-cdb5-5111-9fd616f51509@cogentembedded.com>
Message-ID: <5b92565f-3857-af0f-a953-3588cfbe331d@cogentembedded.com>
Date: Thu, 1 Mar 2018 21:10:16 +0300
MIME-Version: 1.0
In-Reply-To: <df9de4e7-cf72-cdb5-5111-9fd616f51509@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for the R-Car V3M (R8A77970) SoC to the LVDS encoder driver.
Note that there are some differences with the other R-Car gen3 SoCs, e.g.
LVDPLLCR has the same layout as in the R-Car gen2 SoCs...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- shortened the comment to #define RCAR_LVDS_QUIRK_GEN2_PLLCR and applied this
  quitk to all R-Car gen2 SoCs, thus simplifying the check for the gen2 LVDPLLCR
  layout;
- renamed RCAR_LVDS_QUIRK_PHY to RCAR_LVDS_QUIRK_GEN3_LVEN, reworded the comment
  to this #define;
- removed the 'quirks' variable from rcar_lvds_enable();
- resolved rejects atop of the recent version of the LVDS driver.

 drivers/gpu/drm/rcar-du/rcar_lvds.c |   20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

Index: linux/drivers/gpu/drm/rcar-du/rcar_lvds.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -32,6 +32,9 @@ enum rcar_lvds_mode {
 };
 
 #define RCAR_LVDS_QUIRK_LANES	(1 << 0)	/* LVDS lanes 1 and 3 inverted */
+#define RCAR_LVDS_QUIRK_GEN2_PLLCR (1 << 1)	/* LVDPLLCR has gen2 layout */
+#define RCAR_LVDS_QUIRK_GEN3_LVEN (1 << 2)	/* LVEN bit needs to be set */
+						/* on R8A77970/R8A7799x */
 
 struct rcar_lvds_device_info {
 	unsigned int gen;
@@ -191,7 +194,7 @@ static void rcar_lvds_enable(struct drm_
 	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
 
 	/* PLL clock configuration. */
-	if (lvds->info->gen < 3)
+	if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN2_PLLCR)
 		lvdpllcr = rcar_lvds_lvdpllcr_gen2(mode->clock);
 	else
 		lvdpllcr = rcar_lvds_lvdpllcr_gen3(mode->clock);
@@ -224,6 +227,12 @@ static void rcar_lvds_enable(struct drm_
 		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
 	}
 
+	if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
+		/* Turn on the LVDS PHY. */
+		lvdcr0 |= LVDCR0_LVEN;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
+
 	/* Wait for the startup delay. */
 	usleep_range(100, 150);
 
@@ -485,17 +494,23 @@ static int rcar_lvds_remove(struct platf
 
 static const struct rcar_lvds_device_info rcar_lvds_gen2_info = {
 	.gen = 2,
+	.quirks = RCAR_LVDS_QUIRK_GEN2_PLLCR,
 };
 
 static const struct rcar_lvds_device_info rcar_lvds_r8a7790_info = {
 	.gen = 2,
-	.quirks = RCAR_LVDS_QUIRK_LANES,
+	.quirks = RCAR_LVDS_QUIRK_GEN2_PLLCR | RCAR_LVDS_QUIRK_LANES,
 };
 
 static const struct rcar_lvds_device_info rcar_lvds_gen3_info = {
 	.gen = 3,
 };
 
+static const struct rcar_lvds_device_info rcar_lvds_r8a77970_info = {
+	.gen = 3,
+	.quirks = RCAR_LVDS_QUIRK_GEN2_PLLCR | RCAR_LVDS_QUIRK_GEN3_LVEN,
+};
+
 static const struct of_device_id rcar_lvds_of_table[] = {
 	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
@@ -503,6 +518,7 @@ static const struct of_device_id rcar_lv
 	{ .compatible = "renesas,r8a7793-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a7796-lvds", .data = &rcar_lvds_gen3_info },
+	{ .compatible = "renesas,r8a77970-lvds", .data = &rcar_lvds_r8a77970_info },
 	{ }
 };
 
