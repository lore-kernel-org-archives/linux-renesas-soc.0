Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45376 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729998AbeIRWJQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 18:09:16 -0400
Date: Tue, 18 Sep 2018 22:09:03 +0530
From: Souptick Joarder <jrdr.linux@gmail.com>
To: gustavo@padovan.org, maarten.lankhorst@linux.intel.com,
        sean@poorly.run, airlied@linux.ie,
        laurent.pinchart@ideasonboard.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/rcar-du: Convert drm_atomic_helper_suspend/resume()
Message-ID: <20180918163903.GA11172@jordon-HP-15-Notebook-PC>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

convert drm_atomic_helper_suspend/resume() to use
drm_mode_config_helper_suspend/resume().

remove suspend_state field from the rcar_du_device
structure as it is no more required.

With this conversion, also drm_fbdev_cma_set_suspend_unlocked()
will left with no consumer. So this function can be removed.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/drm_fb_cma_helper.c   | 18 ------------------
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 21 ++-------------------
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  1 -
 include/drm/drm_fb_cma_helper.h       |  2 --
 4 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
index 47e0e2f..96efc88 100644
--- a/drivers/gpu/drm/drm_fb_cma_helper.c
+++ b/drivers/gpu/drm/drm_fb_cma_helper.c
@@ -224,21 +224,3 @@ void drm_fbdev_cma_hotplug_event(struct drm_fbdev_cma *fbdev_cma)
 		drm_fb_helper_hotplug_event(&fbdev_cma->fb_helper);
 }
 EXPORT_SYMBOL_GPL(drm_fbdev_cma_hotplug_event);
-
-/**
- * drm_fbdev_cma_set_suspend_unlocked - wrapper around
- *                                      drm_fb_helper_set_suspend_unlocked
- * @fbdev_cma: The drm_fbdev_cma struct, may be NULL
- * @state: desired state, zero to resume, non-zero to suspend
- *
- * Calls drm_fb_helper_set_suspend, which is a wrapper around
- * fb_set_suspend implemented by fbdev core.
- */
-void drm_fbdev_cma_set_suspend_unlocked(struct drm_fbdev_cma *fbdev_cma,
-					bool state)
-{
-	if (fbdev_cma)
-		drm_fb_helper_set_suspend_unlocked(&fbdev_cma->fb_helper,
-						   state);
-}
-EXPORT_SYMBOL(drm_fbdev_cma_set_suspend_unlocked);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 02aee6c..288220f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -357,32 +357,15 @@ static void rcar_du_lastclose(struct drm_device *dev)
 static int rcar_du_pm_suspend(struct device *dev)
 {
 	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
-	struct drm_atomic_state *state;
 
-	drm_kms_helper_poll_disable(rcdu->ddev);
-	drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev, true);
-
-	state = drm_atomic_helper_suspend(rcdu->ddev);
-	if (IS_ERR(state)) {
-		drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev, false);
-		drm_kms_helper_poll_enable(rcdu->ddev);
-		return PTR_ERR(state);
-	}
-
-	rcdu->suspend_state = state;
-
-	return 0;
+	return drm_mode_config_helper_suspend(rcdu->ddev);
 }
 
 static int rcar_du_pm_resume(struct device *dev)
 {
 	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
 
-	drm_atomic_helper_resume(rcdu->ddev, rcdu->suspend_state);
-	drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev, false);
-	drm_kms_helper_poll_enable(rcdu->ddev);
-
-	return 0;
+	return drm_mode_config_helper_resume(rcdu->ddev);
 }
 #endif
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index b3a25e8..ff25c8d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -78,7 +78,6 @@ struct rcar_du_device {
 
 	struct drm_device *ddev;
 	struct drm_fbdev_cma *fbdev;
-	struct drm_atomic_state *suspend_state;
 
 	struct rcar_du_crtc crtcs[RCAR_DU_MAX_CRTCS];
 	unsigned int num_crtcs;
diff --git a/include/drm/drm_fb_cma_helper.h b/include/drm/drm_fb_cma_helper.h
index 4a65f0d..8dbbe1e 100644
--- a/include/drm/drm_fb_cma_helper.h
+++ b/include/drm/drm_fb_cma_helper.h
@@ -26,8 +26,6 @@ struct drm_fbdev_cma *drm_fbdev_cma_init(struct drm_device *dev,
 
 void drm_fbdev_cma_restore_mode(struct drm_fbdev_cma *fbdev_cma);
 void drm_fbdev_cma_hotplug_event(struct drm_fbdev_cma *fbdev_cma);
-void drm_fbdev_cma_set_suspend_unlocked(struct drm_fbdev_cma *fbdev_cma,
-					bool state);
 
 struct drm_gem_cma_object *drm_fb_cma_get_gem_obj(struct drm_framebuffer *fb,
 	unsigned int plane);
-- 
1.9.1
