Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36372 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032182AbeBOAD4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 19:03:56 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 12/12] arm64: dts: renesas: r8a7796: Convert to new LVDS DT bindings
Date: Thu, 15 Feb 2018 02:04:15 +0200
Message-Id: <20180215000415.19077-13-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The internal LVDS encoder now has DT bindings separate from the DU. Port
the device tree over to the new model.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Fixed LVDS compatible string

Changes since v1:

- Remove the DU reg-names property
---
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts     |  3 +-
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  3 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 34 ++++++++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |  7 -----
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |  3 --
 drivers/gpu/drm/rcar-du/rcar_du_group.c            | 13 ++++++++-
 6 files changed, 42 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index daee1f1a3f68..21bd679062f3 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -33,10 +33,9 @@
 	clocks = <&cpg CPG_MOD 724>,
 		 <&cpg CPG_MOD 723>,
 		 <&cpg CPG_MOD 722>,
-		 <&cpg CPG_MOD 727>,
 		 <&versaclock5 1>,
 		 <&versaclock5 3>,
 		 <&versaclock5 2>;
-	clock-names = "du.0", "du.1", "du.2", "lvds.0",
+	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index 4088bea8d62c..ecbfbcb65df3 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -32,11 +32,10 @@
 	clocks = <&cpg CPG_MOD 724>,
 		 <&cpg CPG_MOD 723>,
 		 <&cpg CPG_MOD 722>,
-		 <&cpg CPG_MOD 727>,
 		 <&versaclock5 1>,
 		 <&x21_clk>,
 		 <&versaclock5 2>;
-	clock-names = "du.0", "du.1", "du.2", "lvds.0",
+	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index f2b2e40c655e..86f4bead3c0b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1826,17 +1826,14 @@
 
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7796";
-			reg = <0 0xfeb00000 0 0x70000>,
-			      <0 0xfeb90000 0 0x14>;
-			reg-names = "du", "lvds.0";
+			reg = <0 0xfeb00000 0 0x70000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 724>,
 				 <&cpg CPG_MOD 723>,
-				 <&cpg CPG_MOD 722>,
-				 <&cpg CPG_MOD 727>;
-			clock-names = "du.0", "du.1", "du.2", "lvds.0";
+				 <&cpg CPG_MOD 722>;
+			clock-names = "du.0", "du.1", "du.2";
 			status = "disabled";
 
 			vsps = <&vspd0 &vspd1 &vspd2>;
@@ -1859,6 +1856,31 @@
 				port@2 {
 					reg = <2>;
 					du_out_lvds0: endpoint {
+						remote-endpoint = <&lvds0_in>;
+					};
+				};
+			};
+		};
+
+		lvds0: lvds@feb90000 {
+			compatible = "renesas,r8a7796-lvds";
+			reg = <0 0xfeb90000 0 0x14>;
+			clocks = <&cpg CPG_MOD 727>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds0_in: endpoint {
+						remote-endpoint = <&du_out_lvds0>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					lvds0_out: endpoint {
 					};
 				};
 			};
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index c4420538ec85..c296db68eddb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -321,12 +321,6 @@ void rcar_du_crtc_route_output(struct drm_crtc *crtc,
 	struct rcar_du_device *rcdu = rcrtc->group->dev;
 
 	/*
-	 * Store the route from the CRTC output to the DU output. The DU will be
-	 * configured when starting the CRTC.
-	 */
-	rcrtc->outputs |= BIT(output);
-
-	/*
 	 * Store RGB routing to DPAD0, the hardware will be configured when
 	 * starting the CRTC.
 	 */
@@ -637,7 +631,6 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 	spin_unlock_irq(&crtc->dev->event_lock);
 
 	rcrtc->initialized = false;
-	rcrtc->outputs = 0;
 }
 
 static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index fdc2bf99bda1..fa6872ca8b45 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -38,7 +38,6 @@ struct rcar_du_vsp;
  * @vblank_lock: protects vblank_wait and vblank_count
  * @vblank_wait: wait queue used to signal vertical blanking
  * @vblank_count: number of vertical blanking interrupts to wait for
- * @outputs: bitmask of the outputs (enum rcar_du_output) driven by this CRTC
  * @group: CRTC group this CRTC belongs to
  * @vsp: VSP feeding video to this CRTC
  * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
@@ -60,8 +59,6 @@ struct rcar_du_crtc {
 	wait_queue_head_t vblank_wait;
 	unsigned int vblank_count;
 
-	unsigned int outputs;
-
 	struct rcar_du_group *group;
 	struct rcar_du_vsp *vsp;
 	unsigned int vsp_pipe;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 2f37ea901873..18d0fff691d5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -31,6 +31,7 @@
 #include <linux/io.h>
 
 #include "rcar_du_drv.h"
+#include "rcar_du_encoder.h"
 #include "rcar_du_group.h"
 #include "rcar_du_regs.h"
 
@@ -245,7 +246,17 @@ int rcar_du_set_dpad0_vsp1_routing(struct rcar_du_device *rcdu)
 int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
 {
 	struct rcar_du_crtc *crtc0 = &rgrp->dev->crtcs[rgrp->index * 2];
+	struct drm_encoder *encoder;
 	u32 dorcr = rcar_du_group_read(rgrp, DORCR);
+	bool crtc0_dpad1 = false;
+
+	drm_for_each_encoder_mask(encoder, rgrp->dev->ddev,
+				  crtc0->crtc.state->encoder_mask) {
+		struct rcar_du_encoder *renc = to_rcar_encoder(encoder);
+
+		if (renc->output == RCAR_DU_OUTPUT_DPAD1)
+			crtc0_dpad1 = true;
+	}
 
 	dorcr &= ~(DORCR_PG2T | DORCR_DK2S | DORCR_PG2D_MASK);
 
@@ -254,7 +265,7 @@ int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
 	 * CRTC 1 in all other cases to avoid cloning CRTC 0 to DPAD0 and DPAD1
 	 * by default.
 	 */
-	if (crtc0->outputs & BIT(RCAR_DU_OUTPUT_DPAD1))
+	if (crtc0_dpad1)
 		dorcr |= DORCR_PG2D_DS1;
 	else
 		dorcr |= DORCR_PG2T | DORCR_DK2S | DORCR_PG2D_DS2;
-- 
Regards,

Laurent Pinchart
