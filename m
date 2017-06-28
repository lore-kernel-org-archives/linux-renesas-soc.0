Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38198 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751523AbdF1Su4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jun 2017 14:50:56 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Setup planes before enabling CRTC to avoid flicker
Date: Wed, 28 Jun 2017 21:50:55 +0300
Message-Id: <20170628185055.16379-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Commit 52055bafa1ff ("drm: rcar-du: Move plane commit code from CRTC
start to CRTC resume") changed the order of the plane commit and CRTC
enable operations to accommodate the runtime PM requirements. However,
this introduced corruption in the first displayed frame, as the CRTC is
now enabled without any plane configured. On Gen2 hardware the first
frame will be black and likely unnoticed, but on Gen3 hardware we end up
starting the display before the VSP compositor, which is more
noticeable.

To fix this, revert the order of the commit operations back, and handle
runtime PM requirements in the CRTC .atomic_begin() and .atomic_enable()
helper operation handlers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 66 ++++++++++++++++++++--------------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  4 +--
 drivers/gpu/drm/rcar-du/rcar_du_kms.c  |  2 +-
 3 files changed, 43 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 6b5219ef0ad2..76cdb88b2b8e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -448,14 +448,8 @@ static void rcar_du_crtc_wait_page_flip(struct rcar_du_crtc *rcrtc)
  * Start/Stop and Suspend/Resume
  */
 
-static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
+static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
 {
-	struct drm_crtc *crtc = &rcrtc->crtc;
-	bool interlaced;
-
-	if (rcrtc->started)
-		return;
-
 	/* Set display off and background to black */
 	rcar_du_crtc_write(rcrtc, DOOR, DOOR_RGB(0, 0, 0));
 	rcar_du_crtc_write(rcrtc, BPOR, BPOR_RGB(0, 0, 0));
@@ -467,6 +461,18 @@ static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
 	/* Start with all planes disabled. */
 	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
 
+	/* Enable the VSP compositor. */
+	if (rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
+		rcar_du_vsp_enable(rcrtc);
+
+	/* Turn vertical blanking interrupt reporting on. */
+	drm_crtc_vblank_on(&rcrtc->crtc);
+}
+
+static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
+{
+	bool interlaced;
+
 	/* Select master sync mode. This enables display operation in master
 	 * sync mode (with the HSYNC and VSYNC signals configured as outputs and
 	 * actively driven).
@@ -477,24 +483,12 @@ static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
 			     DSYSR_TVM_MASTER);
 
 	rcar_du_group_start_stop(rcrtc->group, true);
-
-	/* Enable the VSP compositor. */
-	if (rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
-		rcar_du_vsp_enable(rcrtc);
-
-	/* Turn vertical blanking interrupt reporting back on. */
-	drm_crtc_vblank_on(crtc);
-
-	rcrtc->started = true;
 }
 
 static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
 {
 	struct drm_crtc *crtc = &rcrtc->crtc;
 
-	if (!rcrtc->started)
-		return;
-
 	/* Disable all planes and wait for the change to take effect. This is
 	 * required as the DSnPR registers are updated on vblank, and no vblank
 	 * will occur once the CRTC is stopped. Disabling planes when starting
@@ -525,8 +519,6 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
 	rcar_du_crtc_clr_set(rcrtc, DSYSR, DSYSR_TVM_MASK, DSYSR_TVM_SWITCH);
 
 	rcar_du_group_start_stop(rcrtc->group, false);
-
-	rcrtc->started = false;
 }
 
 void rcar_du_crtc_suspend(struct rcar_du_crtc *rcrtc)
@@ -546,12 +538,10 @@ void rcar_du_crtc_resume(struct rcar_du_crtc *rcrtc)
 		return;
 
 	rcar_du_crtc_get(rcrtc);
-	rcar_du_crtc_start(rcrtc);
+	rcar_du_crtc_setup(rcrtc);
 
 	/* Commit the planes state. */
-	if (rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE)) {
-		rcar_du_vsp_enable(rcrtc);
-	} else {
+	if (!rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE)) {
 		for (i = 0; i < rcrtc->group->num_planes; ++i) {
 			struct rcar_du_plane *plane = &rcrtc->group->planes[i];
 
@@ -563,6 +553,7 @@ void rcar_du_crtc_resume(struct rcar_du_crtc *rcrtc)
 	}
 
 	rcar_du_crtc_update_planes(rcrtc);
+	rcar_du_crtc_start(rcrtc);
 }
 
 /* -----------------------------------------------------------------------------
@@ -574,7 +565,16 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 
-	rcar_du_crtc_get(rcrtc);
+	/*
+	 * If the CRTC has already been setup by the .atomic_begin() handler we
+	 * can skip the setup stage.
+	 */
+	if (!rcrtc->initialized) {
+		rcar_du_crtc_get(rcrtc);
+		rcar_du_crtc_setup(rcrtc);
+		rcrtc->initialized = true;
+	}
+
 	rcar_du_crtc_start(rcrtc);
 }
 
@@ -593,6 +593,7 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 	spin_unlock_irq(&crtc->dev->event_lock);
 
+	rcrtc->initialized = false;
 	rcrtc->outputs = 0;
 }
 
@@ -601,6 +602,19 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
 {
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 
+	WARN_ON(!crtc->state->enable);
+
+	/*
+	 * If a mode set is in progress we can be called with the CRTC disabled.
+	 * We then need to first setup the CRTC in order to configure planes.
+	 * The .atomic_enable() handler will notice and skip the CRTC setup.
+	 */
+	if (!rcrtc->initialized) {
+		rcar_du_crtc_get(rcrtc);
+		rcar_du_crtc_setup(rcrtc);
+		rcrtc->initialized = true;
+	}
+
 	if (rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_atomic_begin(rcrtc);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 0b6d26ecfc38..3cc376826592 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -30,7 +30,7 @@ struct rcar_du_vsp;
  * @extclock: external pixel dot clock (optional)
  * @mmio_offset: offset of the CRTC registers in the DU MMIO block
  * @index: CRTC software and hardware index
- * @started: whether the CRTC has been started and is running
+ * @initialized: whether the CRTC has been initialized and clocks enabled
  * @event: event to post when the pending page flip completes
  * @flip_wait: wait queue used to signal page flip completion
  * @outputs: bitmask of the outputs (enum rcar_du_output) driven by this CRTC
@@ -45,7 +45,7 @@ struct rcar_du_crtc {
 	struct clk *extclock;
 	unsigned int mmio_offset;
 	unsigned int index;
-	bool started;
+	bool initialized;
 
 	struct drm_pending_vblank_event *event;
 	wait_queue_head_t flip_wait;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 82b978a5dae6..c2f382feca07 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -255,9 +255,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 
 	/* Apply the atomic update. */
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
+	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_vblanks(dev, old_state);
-- 
Regards,

Laurent Pinchart
