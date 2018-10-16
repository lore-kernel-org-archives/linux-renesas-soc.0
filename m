Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:29085 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727007AbeJQAu0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 20:50:26 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 3/5] drm: rcar-du: Add r8a77470 support
Date: Tue, 16 Oct 2018 17:58:59 +0100
Message-Id: <1539709139-20342-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Add RZ/G1C (a.k.a. r8a77470) support to the R-Car DU driver.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v1->v2:
* Added flags RCAR_DU_FEATURE_INTERLACED and RCAR_DU_FEATURE_TVM_SYNC
* Reworked comment

 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 084f58d..d8a02c4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -77,6 +77,33 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 	},
 };
 
+static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
+	.gen = 2,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
+		  | RCAR_DU_FEATURE_INTERLACED
+		  | RCAR_DU_FEATURE_TVM_SYNC,
+	.channels_mask = BIT(1) | BIT(0),
+	.routes = {
+		/*
+		 * R8A77470 has two RGB outputs, one LVDS output, and
+		 * one (currently unsupported) analog video output
+		 */
+		[RCAR_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(0),
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_DPAD1] = {
+			.possible_crtcs = BIT(1),
+			.port = 1,
+		},
+		[RCAR_DU_OUTPUT_LVDS0] = {
+			.possible_crtcs = BIT(0) | BIT(1),
+			.port = 2,
+		},
+	},
+};
+
 static const struct rcar_du_device_info rcar_du_r8a7779_info = {
 	.gen = 2,
 	.features = RCAR_DU_FEATURE_INTERLACED
@@ -342,6 +369,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
 	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
+	{ .compatible = "renesas,du-r8a77470", .data = &rzg1_du_r8a77470_info },
 	{ .compatible = "renesas,du-r8a7779", .data = &rcar_du_r8a7779_info },
 	{ .compatible = "renesas,du-r8a7790", .data = &rcar_du_r8a7790_info },
 	{ .compatible = "renesas,du-r8a7791", .data = &rcar_du_r8a7791_info },
-- 
2.7.4
