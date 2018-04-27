Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:38262 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759307AbeD0WWC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 18:22:02 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        geert@glider.be
Subject: [PATCH v3 3/5] drm: rcar-du: Split CRTC handling to support hardware indexing
Date: Fri, 27 Apr 2018 23:21:52 +0100
Message-Id: <20180427222154.21664-4-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20180427222154.21664-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180427222154.21664-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The DU CRTC driver does not support distinguishing between a hardware
index, and a software (CRTC) index in the event that a DU channel might
not be populated by the hardware.

Support this by adapting the rcar_du_device_info structure to store a
bitmask of available channels rather than a count of CRTCs. The count
can then be obtained by determining the hamming weight of the bitmask.

This allows the rcar_du_crtc_create() function to distinguish between
both index types, and non-populated DU channels will be skipped without
leaving a gap in the software CRTC indexes.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v2:
 - devm_clk_get error message adapted to display Du channel
 - rgrp->planes for gen2 now uses swindex instead of hwindex
 - channel_mask -> channels_mask
 - channel_mask set in LE bit order.
 - (.dpll_ch corrected to LE bit order)

v3:
 - update channels_mask description to 'available' channels instead of
   supported channels
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 26 ++++++++++++++------------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  3 ++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 22 +++++++++++-----------
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  4 ++--
 drivers/gpu/drm/rcar-du/rcar_du_kms.c  | 18 +++++++++++++-----
 5 files changed, 42 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index c4420538ec85..f2a0bd1e5119 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -767,7 +767,8 @@ static irqreturn_t rcar_du_crtc_irq(int irq, void *arg)
  * Initialization
  */
 
-int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int index)
+int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
+			unsigned int hwindex)
 {
 	static const unsigned int mmio_offsets[] = {
 		DU0_REG_OFFSET, DU1_REG_OFFSET, DU2_REG_OFFSET, DU3_REG_OFFSET
@@ -775,7 +776,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int index)
 
 	struct rcar_du_device *rcdu = rgrp->dev;
 	struct platform_device *pdev = to_platform_device(rcdu->dev);
-	struct rcar_du_crtc *rcrtc = &rcdu->crtcs[index];
+	struct rcar_du_crtc *rcrtc = &rcdu->crtcs[swindex];
 	struct drm_crtc *crtc = &rcrtc->crtc;
 	struct drm_plane *primary;
 	unsigned int irqflags;
@@ -787,7 +788,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int index)
 
 	/* Get the CRTC clock and the optional external clock. */
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CRTC_IRQ_CLOCK)) {
-		sprintf(clk_name, "du.%u", index);
+		sprintf(clk_name, "du.%u", hwindex);
 		name = clk_name;
 	} else {
 		name = NULL;
@@ -795,16 +796,16 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int index)
 
 	rcrtc->clock = devm_clk_get(rcdu->dev, name);
 	if (IS_ERR(rcrtc->clock)) {
-		dev_err(rcdu->dev, "no clock for CRTC %u\n", index);
+		dev_err(rcdu->dev, "no clock for DU channel %u\n", hwindex);
 		return PTR_ERR(rcrtc->clock);
 	}
 
-	sprintf(clk_name, "dclkin.%u", index);
+	sprintf(clk_name, "dclkin.%u", hwindex);
 	clk = devm_clk_get(rcdu->dev, clk_name);
 	if (!IS_ERR(clk)) {
 		rcrtc->extclock = clk;
 	} else if (PTR_ERR(rcrtc->clock) == -EPROBE_DEFER) {
-		dev_info(rcdu->dev, "can't get external clock %u\n", index);
+		dev_info(rcdu->dev, "can't get external clock %u\n", hwindex);
 		return -EPROBE_DEFER;
 	}
 
@@ -813,13 +814,13 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int index)
 	spin_lock_init(&rcrtc->vblank_lock);
 
 	rcrtc->group = rgrp;
-	rcrtc->mmio_offset = mmio_offsets[index];
-	rcrtc->index = index;
+	rcrtc->mmio_offset = mmio_offsets[hwindex];
+	rcrtc->index = hwindex;
 
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
 		primary = &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;
 	else
-		primary = &rgrp->planes[index % 2].plane;
+		primary = &rgrp->planes[swindex % 2].plane;
 
 	ret = drm_crtc_init_with_planes(rcdu->ddev, crtc, primary,
 					NULL, &crtc_funcs, NULL);
@@ -833,7 +834,8 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int index)
 
 	/* Register the interrupt handler. */
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CRTC_IRQ_CLOCK)) {
-		irq = platform_get_irq(pdev, index);
+		/* The IRQ's are associated with the CRTC (sw)index. */
+		irq = platform_get_irq(pdev, swindex);
 		irqflags = 0;
 	} else {
 		irq = platform_get_irq(pdev, 0);
@@ -841,7 +843,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int index)
 	}
 
 	if (irq < 0) {
-		dev_err(rcdu->dev, "no IRQ for CRTC %u\n", index);
+		dev_err(rcdu->dev, "no IRQ for CRTC %u\n", swindex);
 		return irq;
 	}
 
@@ -849,7 +851,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int index)
 			       dev_name(rcdu->dev), rcrtc);
 	if (ret < 0) {
 		dev_err(rcdu->dev,
-			"failed to register IRQ for CRTC %u\n", index);
+			"failed to register IRQ for CRTC %u\n", swindex);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index fdc2bf99bda1..84b5e23a85b1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -80,7 +80,8 @@ enum rcar_du_output {
 	RCAR_DU_OUTPUT_MAX,
 };
 
-int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int index);
+int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
+			unsigned int hwindex);
 void rcar_du_crtc_suspend(struct rcar_du_crtc *rcrtc);
 void rcar_du_crtc_resume(struct rcar_du_crtc *rcrtc);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 3917d839c04c..2aa392b03e73 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -40,7 +40,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 	.gen = 2,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
-	.num_crtcs = 2,
+	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
 		 * R8A7743 has one RGB output and one LVDS output
@@ -61,7 +61,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 	.gen = 2,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
-	.num_crtcs = 2,
+	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
 		 * R8A7745 has two RGB outputs
@@ -80,7 +80,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 static const struct rcar_du_device_info rcar_du_r8a7779_info = {
 	.gen = 2,
 	.features = 0,
-	.num_crtcs = 2,
+	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
 		 * R8A7779 has two RGB outputs and one (currently unsupported)
@@ -102,7 +102,7 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
 	.quirks = RCAR_DU_QUIRK_ALIGN_128B,
-	.num_crtcs = 3,
+	.channels_mask = BIT(2) | BIT(1) | BIT(0),
 	.routes = {
 		/*
 		 * R8A7790 has one RGB output, two LVDS outputs and one
@@ -129,7 +129,7 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 	.gen = 2,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
-	.num_crtcs = 2,
+	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
 		 * R8A779[13] has one RGB output, one LVDS output and one
@@ -151,7 +151,7 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 	.gen = 2,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
-	.num_crtcs = 2,
+	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/* R8A7792 has two RGB outputs. */
 		[RCAR_DU_OUTPUT_DPAD0] = {
@@ -169,7 +169,7 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 	.gen = 2,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
-	.num_crtcs = 2,
+	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
 		 * R8A7794 has two RGB outputs and one (currently unsupported)
@@ -191,7 +191,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
 		  | RCAR_DU_FEATURE_VSP1_SOURCE,
-	.num_crtcs = 4,
+	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
 	.routes = {
 		/*
 		 * R8A7795 has one RGB output, two HDMI outputs and one
@@ -215,7 +215,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 		},
 	},
 	.num_lvds = 1,
-	.dpll_ch =  BIT(1) | BIT(2),
+	.dpll_ch =  BIT(2) | BIT(1),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7796_info = {
@@ -223,7 +223,7 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
 		  | RCAR_DU_FEATURE_VSP1_SOURCE,
-	.num_crtcs = 3,
+	.channels_mask = BIT(2) | BIT(1) | BIT(0),
 	.routes = {
 		/*
 		 * R8A7796 has one RGB output, one LVDS output and one HDMI
@@ -251,7 +251,7 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
 		  | RCAR_DU_FEATURE_VSP1_SOURCE,
-	.num_crtcs = 1,
+	.channels_mask = BIT(0),
 	.routes = {
 		/* R8A77970 has one RGB output and one LVDS output. */
 		[RCAR_DU_OUTPUT_DPAD0] = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 5c7ec15818c7..5385bb5f6d00 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -52,7 +52,7 @@ struct rcar_du_output_routing {
  * @gen: device generation (2 or 3)
  * @features: device features (RCAR_DU_FEATURE_*)
  * @quirks: device quirks (RCAR_DU_QUIRK_*)
- * @num_crtcs: total number of CRTCs
+ * @channels_mask: bit mask of available DU channels
  * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
  * @num_lvds: number of internal LVDS encoders
  */
@@ -60,7 +60,7 @@ struct rcar_du_device_info {
 	unsigned int gen;
 	unsigned int features;
 	unsigned int quirks;
-	unsigned int num_crtcs;
+	unsigned int channels_mask;
 	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
 	unsigned int num_lvds;
 	unsigned int dpll_ch;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 0c8b7e5686bb..b5e331cb0d1c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -520,6 +520,8 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	struct drm_fbdev_cma *fbdev;
 	unsigned int num_encoders;
 	unsigned int num_groups;
+	unsigned int swindex;
+	unsigned int hwindex;
 	unsigned int i;
 	int ret;
 
@@ -532,7 +534,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
 	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
 
-	rcdu->num_crtcs = rcdu->info->num_crtcs;
+	rcdu->num_crtcs = hweight8(rcdu->info->channels_mask);
 
 	ret = rcar_du_properties_init(rcdu);
 	if (ret < 0)
@@ -542,7 +544,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	 * Initialize vertical blanking interrupts handling. Start with vblank
 	 * disabled for all CRTCs.
 	 */
-	ret = drm_vblank_init(dev, (1 << rcdu->info->num_crtcs) - 1);
+	ret = drm_vblank_init(dev, (1 << rcdu->num_crtcs) - 1);
 	if (ret < 0)
 		return ret;
 
@@ -584,10 +586,16 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	}
 
 	/* Create the CRTCs. */
-	for (i = 0; i < rcdu->num_crtcs; ++i) {
-		struct rcar_du_group *rgrp = &rcdu->groups[i / 2];
+	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
+		struct rcar_du_group *rgrp;
+
+		/* Skip unpopulated DU channels. */
+		if (!(rcdu->info->channels_mask & BIT(hwindex)))
+			continue;
+
+		rgrp = &rcdu->groups[hwindex / 2];
 
-		ret = rcar_du_crtc_create(rgrp, i);
+		ret = rcar_du_crtc_create(rgrp, swindex++, hwindex);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.17.0
