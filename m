Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:14788 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732667AbeHNQkv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Aug 2018 12:40:51 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PROTO][PATCH 02/10] drm: rcar-du: Add r8a77995 device support
Date: Tue, 14 Aug 2018 15:49:56 +0200
Message-Id: <1534254604-24204-3-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for the R-Car D3 (R8A77995) SoC to the R-Car DU driver.

Based on patch by Koji Matsuoka <koji.matsuoka.xm@renesas.com>.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 17 ++++++-----------
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c |  3 ++-
 4 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index cd6803a..9153e7a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -53,14 +53,6 @@ static void rcar_du_crtc_clr(struct rcar_du_crtc *rcrtc, u32 reg, u32 clr)
 		      rcar_du_read(rcdu, rcrtc->mmio_offset + reg) & ~clr);
 }
 
-static void rcar_du_crtc_set(struct rcar_du_crtc *rcrtc, u32 reg, u32 set)
-{
-	struct rcar_du_device *rcdu = rcrtc->group->dev;
-
-	rcar_du_write(rcdu, rcrtc->mmio_offset + reg,
-		      rcar_du_read(rcdu, rcrtc->mmio_offset + reg) | set);
-}
-
 static void rcar_du_crtc_clr_set(struct rcar_du_crtc *rcrtc, u32 reg,
 				 u32 clr, u32 set)
 {
@@ -527,7 +519,8 @@ static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
 	 * actively driven).
 	 */
 	interlaced = rcrtc->crtc.mode.flags & DRM_MODE_FLAG_INTERLACE;
-	rcar_du_crtc_clr_set(rcrtc, DSYSR, DSYSR_TVM_MASK | DSYSR_SCM_MASK,
+	rcar_du_crtc_clr_set(rcrtc, DSYSR,
+			     DSYSR_TVM_MASK | DSYSR_SCM_MASK | DSYSR_ILTS,
 			     (interlaced ? DSYSR_SCM_INT_VIDEO : 0) |
 			     DSYSR_TVM_MASTER);
 
@@ -596,7 +589,9 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
 	 * Select switch sync mode. This stops display operation and configures
 	 * the HSYNC and VSYNC signals as inputs.
 	 */
-	rcar_du_crtc_clr_set(rcrtc, DSYSR, DSYSR_TVM_MASK, DSYSR_TVM_SWITCH);
+	rcar_du_crtc_clr_set(rcrtc, DSYSR, DSYSR_TVM_MASK | DSYSR_ILTS,
+		rcar_du_needs(rcrtc->group->dev, RCAR_DU_QUIRK_TVM_MASTER_ONLY) ?
+		DSYSR_TVM_MASTER : DSYSR_TVM_SWITCH);
 
 	rcar_du_group_start_stop(rcrtc->group, false);
 }
@@ -744,7 +739,7 @@ static int rcar_du_crtc_enable_vblank(struct drm_crtc *crtc)
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 
 	rcar_du_crtc_write(rcrtc, DSRCR, DSRCR_VBCL);
-	rcar_du_crtc_set(rcrtc, DIER, DIER_VBE);
+	rcar_du_crtc_clr_set(rcrtc, DIER, DIER_TVE | DIER_FRE, DIER_VBE);
 	rcrtc->vblank_enable = true;
 
 	return 0;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 56f9472..5c2f764 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -294,6 +294,31 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 	.num_lvds = 1,
 };
 
+static const struct rcar_du_device_info rcar_du_r8a77995_info = {
+	.gen = 3,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
+		  | RCAR_DU_FEATURE_VSP1_SOURCE,
+	.quirks = RCAR_DU_QUIRK_TVM_MASTER_ONLY,
+	.channels_mask = BIT(1) | BIT(0),
+	.routes = {
+		/* R8A77995 has two LVDS output and one RGB output. */
+		[RCAR_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(0) | BIT(1),
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_LVDS0] = {
+			.possible_crtcs = BIT(0),
+			.port = 1,
+		},
+		[RCAR_DU_OUTPUT_LVDS1] = {
+			.possible_crtcs = BIT(1),
+			.port = 2,
+		},
+	},
+	.num_lvds = 2,
+};
+
 static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
 	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
@@ -307,6 +332,7 @@ static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7796", .data = &rcar_du_r8a7796_info },
 	{ .compatible = "renesas,du-r8a77965", .data = &rcar_du_r8a77965_info },
 	{ .compatible = "renesas,du-r8a77970", .data = &rcar_du_r8a77970_info },
+	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a77995_info },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index b3a25e8..6257405 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -32,6 +32,7 @@ struct rcar_du_device;
 #define RCAR_DU_FEATURE_VSP1_SOURCE	(1 << 2)	/* Has inputs from VSP1 */
 
 #define RCAR_DU_QUIRK_ALIGN_128B	(1 << 0)	/* Align pitches to 128 bytes */
+#define RCAR_DU_QUIRK_TVM_MASTER_ONLY	(1 << 1)	/* Does not have TV switch/sync modes */
 
 /*
  * struct rcar_du_output_routing - Output routing specification
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index d539cb2..9a0a694 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -178,7 +178,8 @@ void rcar_du_group_put(struct rcar_du_group *rgrp)
 static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
 {
 	rcar_du_group_write(rgrp, DSYSR,
-		(rcar_du_group_read(rgrp, DSYSR) & ~(DSYSR_DRES | DSYSR_DEN)) |
+		(rcar_du_group_read(rgrp, DSYSR) &
+		 ~(DSYSR_DRES | DSYSR_DEN | DSYSR_ILTS)) |
 		(start ? DSYSR_DEN : DSYSR_DRES));
 }
 
-- 
2.7.4
