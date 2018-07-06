Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:51507 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932569AbeGFMqG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 08:46:06 -0400
Received: by mail-wm0-f66.google.com with SMTP id s12-v6so14810725wmc.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jul 2018 05:46:05 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, horms@verge.net.au,
        laurent.pinchart@ideasonboard.com,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2] drm: rcar-du: Add r8a77995 device support
Date: Fri,  6 Jul 2018 14:46:01 +0200
Message-Id: <1530881161-27656-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Add support for the R-Car D3 (R8A77995) SoC to the R-Car DU driver.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
This is a break-out from the "[PATCH 0/5] R-Car D3 LVDS/HDMI support" series.

Changes since v1:
- use the .channels_mask field in rcar_du_r8a77995_info
- make sure that several bits that are marked in the documentation as
  "undefined read" and "write zero" on D3 are forced clear if that is
  not done implicitly
- remove rcar_du_crtc_set(), which has lost its last user to the
  aforementioned change
- add quirk RCAR_DU_QUIRK_TVM_MASTER_ONLY for SoCs that don't
  support other synchronization modes

CU
Uli


 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 17 ++++++-----------
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c |  3 ++-
 4 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index b52b3e8..9bf50a5 100644
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
@@ -526,7 +518,8 @@ static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
 	 * actively driven).
 	 */
 	interlaced = rcrtc->crtc.mode.flags & DRM_MODE_FLAG_INTERLACE;
-	rcar_du_crtc_clr_set(rcrtc, DSYSR, DSYSR_TVM_MASK | DSYSR_SCM_MASK,
+	rcar_du_crtc_clr_set(rcrtc, DSYSR,
+			     DSYSR_TVM_MASK | DSYSR_SCM_MASK | DSYSR_ILTS,
 			     (interlaced ? DSYSR_SCM_INT_VIDEO : 0) |
 			     DSYSR_TVM_MASTER);
 
@@ -595,7 +588,9 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
 	 * Select switch sync mode. This stops display operation and configures
 	 * the HSYNC and VSYNC signals as inputs.
 	 */
-	rcar_du_crtc_clr_set(rcrtc, DSYSR, DSYSR_TVM_MASK, DSYSR_TVM_SWITCH);
+	rcar_du_crtc_clr_set(rcrtc, DSYSR, DSYSR_TVM_MASK | DSYSR_ILTS,
+		rcar_du_needs(rcrtc->group->dev, RCAR_DU_QUIRK_TVM_MASTER_ONLY) ?
+		DSYSR_TVM_MASTER : DSYSR_TVM_SWITCH);
 
 	rcar_du_group_start_stop(rcrtc->group, false);
 }
@@ -743,7 +738,7 @@ static int rcar_du_crtc_enable_vblank(struct drm_crtc *crtc)
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
