Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:39602 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729115AbeG1RER (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 28 Jul 2018 13:04:17 -0400
Date: Sat, 28 Jul 2018 21:10:07 +0530
From: Souptick Joarder <jrdr.linux@gmail.com>
To: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        ajitn.linux@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, daniel@ffwll.ch
Subject: [PATCH] drm/rcar-du: Convert drm_atomic_helper_suspend/resume()
Message-ID: <20180728154007.GA28426@jordon-HP-15-Notebook-PC>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

convert drm_atomic_helper_suspend/resume() to use
drm_mode_config_helper_suspend/resume().

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Signed-off-by: Ajit Negi <ajitn.linux@gmail.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

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
 
-- 
1.9.1
