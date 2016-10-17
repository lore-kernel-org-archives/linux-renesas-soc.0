Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57299 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932221AbcJQUnK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Oct 2016 16:43:10 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: rcar-du: Add R8A7796 device support
Date: Mon, 17 Oct 2016 23:43:03 +0300
Message-Id: <1476736983-30324-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the R8A7796-specific DT bindings and support them in the
driver. The HDMI output is currently not supported.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/display/renesas,du.txt     |  4 +++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              | 25 ++++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index 0d30e42e40be..abc986202fa2 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -9,6 +9,7 @@ Required Properties:
     - "renesas,du-r8a7793" for R8A7793 (R-Car M2-N) compatible DU
     - "renesas,du-r8a7794" for R8A7794 (R-Car E2) compatible DU
     - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
+    - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
 
   - reg: A list of base address and length of each memory resource, one for
     each entry in the reg-names property.
@@ -25,7 +26,7 @@ Required Properties:
   - clock-names: Name of the clocks. This property is model-dependent.
     - R8A7779 uses a single functional clock. The clock doesn't need to be
       named.
-    - R8A779[01345] use one functional clock per channel and one clock per LVDS
+    - R8A779[013456] use one functional clock per channel and one clock per LVDS
       encoder (if available). The functional clocks must be named "du.x" with
       "x" being the channel numerical index. The LVDS clocks must be named
       "lvds.x" with "x" being the LVDS encoder numerical index.
@@ -50,6 +51,7 @@ corresponding to each DU output.
  R8A7793 (M2-N)	DPAD		LVDS 0		-		-
  R8A7794 (E2)	DPAD 0		DPAD 1		-		-
  R8A7795 (H3)	DPAD		HDMI 0		HDMI 1		LVDS
+ R8A7796 (M3-W)	DPAD		HDMI		LVDS		-
 
 
 Example: R8A7790 (R-Car H2) DU
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 73c971e39b1c..1a29e0b8b551 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -157,6 +157,30 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	.num_lvds = 1,
 };
 
+static const struct rcar_du_device_info rcar_du_r8a7796_info = {
+	.gen = 3,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
+		  | RCAR_DU_FEATURE_VSP1_SOURCE,
+	.num_crtcs = 3,
+	.routes = {
+		/* R8A7796 has one RGB output, one LVDS output and one
+		 * (currently unsupported) HDMI output.
+		 */
+		[RCAR_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(2),
+			.encoder_type = DRM_MODE_ENCODER_NONE,
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_LVDS0] = {
+			.possible_crtcs = BIT(0),
+			.encoder_type = DRM_MODE_ENCODER_LVDS,
+			.port = 2,
+		},
+	},
+	.num_lvds = 1,
+};
+
 static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7779", .data = &rcar_du_r8a7779_info },
 	{ .compatible = "renesas,du-r8a7790", .data = &rcar_du_r8a7790_info },
@@ -164,6 +188,7 @@ static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7793", .data = &rcar_du_r8a7791_info },
 	{ .compatible = "renesas,du-r8a7794", .data = &rcar_du_r8a7794_info },
 	{ .compatible = "renesas,du-r8a7795", .data = &rcar_du_r8a7795_info },
+	{ .compatible = "renesas,du-r8a7796", .data = &rcar_du_r8a7796_info },
 	{ }
 };
 
-- 
Regards,

Laurent Pinchart
