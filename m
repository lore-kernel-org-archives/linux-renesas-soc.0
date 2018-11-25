Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46220 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbeKZBb2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Nov 2018 20:31:28 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [PATCH 2/5] drm: rcar-du: Move CRTC outputs bitmask to private CRTC state
Date: Sun, 25 Nov 2018 16:40:28 +0200
Message-Id: <20181125144031.4407-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The rcar_du_crtc outputs field stores a bitmask of the outputs driven by
the CRTC. This changes based on the configuration requested by
userspace, and is used for the sole purpose of configuring the hardware.
The field thus belongs to the CRTC state. Move it to the
rcar_du_crtc_state structure.

As a result the rcar_du_crtc_route_output() function loses most of its
purpose. In order to remove it, move dpad0_source calculation to
rcar_du_atomic_commit_tail(), until the field gets moved to a state
structure. In order to simplify the rcar_du_group_set_routing()
implementation, we also store the DPAD1 source in a new dpad1_source
field which will move to a state structure with dpad0_source.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 42 +++++++++++------------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h    |  7 ++--
 drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 10 ------
 drivers/gpu/drm/rcar-du/rcar_du_group.c   |  4 +--
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 22 ++++++++++++
 6 files changed, 47 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 90dacab67be5..40b7f17159b0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -22,6 +22,7 @@
 
 #include "rcar_du_crtc.h"
 #include "rcar_du_drv.h"
+#include "rcar_du_encoder.h"
 #include "rcar_du_kms.h"
 #include "rcar_du_plane.h"
 #include "rcar_du_regs.h"
@@ -316,26 +317,6 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 	rcar_du_crtc_write(rcrtc, DEWR,  mode->hdisplay);
 }
 
-void rcar_du_crtc_route_output(struct drm_crtc *crtc,
-			       enum rcar_du_output output)
-{
-	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
-	struct rcar_du_device *rcdu = rcrtc->group->dev;
-
-	/*
-	 * Store the route from the CRTC output to the DU output. The DU will be
-	 * configured when starting the CRTC.
-	 */
-	rcrtc->outputs |= BIT(output);
-
-	/*
-	 * Store RGB routing to DPAD0, the hardware will be configured when
-	 * starting the CRTC.
-	 */
-	if (output == RCAR_DU_OUTPUT_DPAD0)
-		rcdu->dpad0_source = rcrtc->index;
-}
-
 static unsigned int plane_zpos(struct rcar_du_plane *plane)
 {
 	return plane->plane.state->normalized_zpos;
@@ -655,6 +636,24 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
  * CRTC Functions
  */
 
+static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
+				     struct drm_crtc_state *state)
+{
+	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(state);
+	struct drm_encoder *encoder;
+
+	/* Store the routes from the CRTC output to the DU outputs. */
+	rstate->outputs = 0;
+
+	drm_for_each_encoder_mask(encoder, crtc->dev, state->encoder_mask) {
+		struct rcar_du_encoder *renc = to_rcar_encoder(encoder);
+
+		rstate->outputs |= BIT(renc->output);
+	}
+
+	return 0;
+}
+
 static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 				       struct drm_crtc_state *old_state)
 {
@@ -678,8 +677,6 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 	}
 	spin_unlock_irq(&crtc->dev->event_lock);
-
-	rcrtc->outputs = 0;
 }
 
 static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
@@ -755,6 +752,7 @@ enum drm_mode_status rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
+	.atomic_check = rcar_du_crtc_atomic_check,
 	.atomic_begin = rcar_du_crtc_atomic_begin,
 	.atomic_flush = rcar_du_crtc_atomic_flush,
 	.atomic_enable = rcar_du_crtc_atomic_enable,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 59ac6e7d22c9..ec47f164e69b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -37,7 +37,6 @@ struct rcar_du_vsp;
  * @vblank_lock: protects vblank_wait and vblank_count
  * @vblank_wait: wait queue used to signal vertical blanking
  * @vblank_count: number of vertical blanking interrupts to wait for
- * @outputs: bitmask of the outputs (enum rcar_du_output) driven by this CRTC
  * @group: CRTC group this CRTC belongs to
  * @vsp: VSP feeding video to this CRTC
  * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
@@ -61,8 +60,6 @@ struct rcar_du_crtc {
 	wait_queue_head_t vblank_wait;
 	unsigned int vblank_count;
 
-	unsigned int outputs;
-
 	struct rcar_du_group *group;
 	struct rcar_du_vsp *vsp;
 	unsigned int vsp_pipe;
@@ -77,11 +74,13 @@ struct rcar_du_crtc {
  * struct rcar_du_crtc_state - Driver-specific CRTC state
  * @state: base DRM CRTC state
  * @crc: CRC computation configuration
+ * @outputs: bitmask of the outputs (enum rcar_du_output) driven by this CRTC
  */
 struct rcar_du_crtc_state {
 	struct drm_crtc_state state;
 
 	struct vsp1_du_crc_config crc;
+	unsigned int outputs;
 };
 
 #define to_rcar_crtc_state(s) container_of(s, struct rcar_du_crtc_state, state)
@@ -102,8 +101,6 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 void rcar_du_crtc_suspend(struct rcar_du_crtc *rcrtc);
 void rcar_du_crtc_resume(struct rcar_du_crtc *rcrtc);
 
-void rcar_du_crtc_route_output(struct drm_crtc *crtc,
-			       enum rcar_du_output output);
 void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc);
 
 void rcar_du_crtc_dsysr_clr_set(struct rcar_du_crtc *rcrtc, u32 clr, u32 set);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 8ef9165957cb..8b47b8546fc8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -90,6 +90,7 @@ struct rcar_du_device {
 	} props;
 
 	unsigned int dpad0_source;
+	unsigned int dpad1_source;
 	unsigned int vspd1_sink;
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 1877764bd6d9..a123c28ea6ed 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -22,17 +22,7 @@
  * Encoder
  */
 
-static void rcar_du_encoder_mode_set(struct drm_encoder *encoder,
-				     struct drm_crtc_state *crtc_state,
-				     struct drm_connector_state *conn_state)
-{
-	struct rcar_du_encoder *renc = to_rcar_encoder(encoder);
-
-	rcar_du_crtc_route_output(crtc_state->crtc, renc->output);
-}
-
 static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
-	.atomic_mode_set = rcar_du_encoder_mode_set,
 };
 
 static const struct drm_encoder_funcs encoder_funcs = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 3366cda6086c..7e440f61977f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -289,7 +289,7 @@ int rcar_du_set_dpad0_vsp1_routing(struct rcar_du_device *rcdu)
 
 int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
 {
-	struct rcar_du_crtc *crtc0 = &rgrp->dev->crtcs[rgrp->index * 2];
+	struct rcar_du_device *rcdu = rgrp->dev;
 	u32 dorcr = rcar_du_group_read(rgrp, DORCR);
 
 	dorcr &= ~(DORCR_PG2T | DORCR_DK2S | DORCR_PG2D_MASK);
@@ -299,7 +299,7 @@ int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
 	 * CRTC 1 in all other cases to avoid cloning CRTC 0 to DPAD0 and DPAD1
 	 * by default.
 	 */
-	if (crtc0->outputs & BIT(RCAR_DU_OUTPUT_DPAD1))
+	if (rcdu->dpad1_source == rgrp->index * 2)
 		dorcr |= DORCR_PG2D_DS1;
 	else
 		dorcr |= DORCR_PG2T | DORCR_DK2S | DORCR_PG2D_DS2;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index fe6f65c94eef..bd3c2c5ea66f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -285,6 +285,28 @@ static int rcar_du_atomic_check(struct drm_device *dev,
 static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
+	struct rcar_du_device *rcdu = dev->dev_private;
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	/*
+	 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
+	 * when starting the CRTCs.
+	 */
+	rcdu->dpad1_source = -1;
+
+	for_each_new_crtc_in_state(old_state, crtc, crtc_state, i) {
+		struct rcar_du_crtc_state *rcrtc_state =
+			to_rcar_crtc_state(crtc_state);
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+		if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD0))
+			rcdu->dpad0_source = rcrtc->index;
+
+		if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD1))
+			rcdu->dpad1_source = rcrtc->index;
+	}
 
 	/* Apply the atomic update. */
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
-- 
Regards,

Laurent Pinchart
