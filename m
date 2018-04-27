Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:38262 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753569AbeD0WWD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 18:22:03 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        geert@glider.be
Subject: [PATCH v3 5/5] drm: rcar-du: Add R8A77965 support
Date: Fri, 27 Apr 2018 23:21:54 +0100
Message-Id: <20180427222154.21664-6-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20180427222154.21664-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180427222154.21664-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R8A77965 (M3-N) SoC provides RGB, HDMI and LVDS output.

This platform is unusual in that the RGB is connected to DU3 leaving DU2
unpopulated. This is reflected by the channels_mask accordingly.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
--
v2:
 - Corrected bit ordering to be LE
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 2aa392b03e73..02aee6cb0e53 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -246,6 +246,34 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 	.dpll_ch =  BIT(1),
 };
 
+static const struct rcar_du_device_info rcar_du_r8a77965_info = {
+	.gen = 3,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
+		  | RCAR_DU_FEATURE_VSP1_SOURCE,
+	.channels_mask = BIT(3) | BIT(1) | BIT(0),
+	.routes = {
+		/*
+		 * R8A77965 has one RGB output, one LVDS output and one HDMI
+		 * output.
+		 */
+		[RCAR_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(2),
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_HDMI0] = {
+			.possible_crtcs = BIT(1),
+			.port = 1,
+		},
+		[RCAR_DU_OUTPUT_LVDS0] = {
+			.possible_crtcs = BIT(0),
+			.port = 2,
+		},
+	},
+	.num_lvds = 1,
+	.dpll_ch =  BIT(1),
+};
+
 static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 	.gen = 3,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
@@ -277,6 +305,7 @@ static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7794", .data = &rcar_du_r8a7794_info },
 	{ .compatible = "renesas,du-r8a7795", .data = &rcar_du_r8a7795_info },
 	{ .compatible = "renesas,du-r8a7796", .data = &rcar_du_r8a7796_info },
+	{ .compatible = "renesas,du-r8a77965", .data = &rcar_du_r8a77965_info },
 	{ .compatible = "renesas,du-r8a77970", .data = &rcar_du_r8a77970_info },
 	{ }
 };
-- 
2.17.0
