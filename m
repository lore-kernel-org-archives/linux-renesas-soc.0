Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39296 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751289AbdBLMcK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Feb 2017 07:32:10 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] drm: rcar-du: Use DRM core's atomic commit helper
Date: Sun, 12 Feb 2017 14:32:29 +0200
Message-Id: <20170212123229.18277-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170212123229.18277-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170212123229.18277-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The DRM core atomic helper now supports asynchronous commits natively.
The custom rcar-du implementation isn't needed anymore, remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 99 ++++-------------------------------
 1 file changed, 9 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index ff61f6032f2c..2e0b35afa69f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -249,18 +249,9 @@ static int rcar_du_atomic_check(struct drm_device *dev,
 	return rcar_du_atomic_check_planes(dev, state);
 }
 
-struct rcar_du_commit {
-	struct work_struct work;
-	struct drm_device *dev;
-	struct drm_atomic_state *state;
-	u32 crtcs;
-};
-
-static void rcar_du_atomic_complete(struct rcar_du_commit *commit)
+static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = commit->dev;
-	struct rcar_du_device *rcdu = dev->dev_private;
-	struct drm_atomic_state *old_state = commit->state;
+	struct drm_device *dev = old_state->dev;
 
 	/* Apply the atomic update. */
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
@@ -268,98 +259,25 @@ static void rcar_du_atomic_complete(struct rcar_du_commit *commit)
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
 
+	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_vblanks(dev, old_state);
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
-
-	drm_atomic_state_put(old_state);
-
-	/* Complete the commit, wake up any waiter. */
-	spin_lock(&rcdu->commit.wait.lock);
-	rcdu->commit.pending &= ~commit->crtcs;
-	wake_up_all_locked(&rcdu->commit.wait);
-	spin_unlock(&rcdu->commit.wait.lock);
-
-	kfree(commit);
-}
-
-static void rcar_du_atomic_work(struct work_struct *work)
-{
-	struct rcar_du_commit *commit =
-		container_of(work, struct rcar_du_commit, work);
-
-	rcar_du_atomic_complete(commit);
-}
-
-static int rcar_du_atomic_commit(struct drm_device *dev,
-				 struct drm_atomic_state *state,
-				 bool nonblock)
-{
-	struct rcar_du_device *rcdu = dev->dev_private;
-	struct rcar_du_commit *commit;
-	struct drm_crtc *crtc;
-	struct drm_crtc_state *crtc_state;
-	unsigned int i;
-	int ret;
-
-	ret = drm_atomic_helper_prepare_planes(dev, state);
-	if (ret)
-		return ret;
-
-	/* Allocate the commit object. */
-	commit = kzalloc(sizeof(*commit), GFP_KERNEL);
-	if (commit == NULL) {
-		ret = -ENOMEM;
-		goto error;
-	}
-
-	INIT_WORK(&commit->work, rcar_du_atomic_work);
-	commit->dev = dev;
-	commit->state = state;
-
-	/* Wait until all affected CRTCs have completed previous commits and
-	 * mark them as pending.
-	 */
-	for_each_crtc_in_state(state, crtc, crtc_state, i)
-		commit->crtcs |= drm_crtc_mask(crtc);
-
-	spin_lock(&rcdu->commit.wait.lock);
-	ret = wait_event_interruptible_locked(rcdu->commit.wait,
-			!(rcdu->commit.pending & commit->crtcs));
-	if (ret == 0)
-		rcdu->commit.pending |= commit->crtcs;
-	spin_unlock(&rcdu->commit.wait.lock);
-
-	if (ret) {
-		kfree(commit);
-		goto error;
-	}
-
-	/* Swap the state, this is the point of no return. */
-	drm_atomic_helper_swap_state(state, true);
-
-	drm_atomic_state_get(state);
-	if (nonblock)
-		schedule_work(&commit->work);
-	else
-		rcar_du_atomic_complete(commit);
-
-	return 0;
-
-error:
-	drm_atomic_helper_cleanup_planes(dev, state);
-	return ret;
 }
 
 /* -----------------------------------------------------------------------------
  * Initialization
  */
 
+static const struct drm_mode_config_helper_funcs rcar_du_mode_config_helper = {
+	.atomic_commit_tail = rcar_du_atomic_commit_tail,
+};
+
 static const struct drm_mode_config_funcs rcar_du_mode_config_funcs = {
 	.fb_create = rcar_du_fb_create,
 	.output_poll_changed = rcar_du_output_poll_changed,
 	.atomic_check = rcar_du_atomic_check,
-	.atomic_commit = rcar_du_atomic_commit,
+	.atomic_commit = drm_atomic_helper_commit,
 };
 
 static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
@@ -561,6 +479,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	dev->mode_config.max_width = 4095;
 	dev->mode_config.max_height = 2047;
 	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
+	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
 
 	rcdu->num_crtcs = rcdu->info->num_crtcs;
 
-- 
Regards,

Laurent Pinchart
