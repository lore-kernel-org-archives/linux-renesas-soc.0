Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39858 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728095AbeGQJQx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 05:16:53 -0400
From: Thomas Zimmermann <tzimmermann@suse.de>
To: laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/shmobile: Replace drm_dev_unref with drm_dev_put
Date: Tue, 17 Jul 2018 10:45:18 +0200
Message-Id: <20180717084518.17930-1-tzimmermann@suse.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch unifies the naming of DRM functions for reference counting
of struct drm_device. The resulting code is more aligned with the rest
of the Linux kernel interfaces.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 592572554eb0..8d1ff596c774 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -198,7 +198,7 @@ static int shmob_drm_remove(struct platform_device *pdev)
 	drm_kms_helper_poll_fini(ddev);
 	drm_mode_config_cleanup(ddev);
 	drm_irq_uninstall(ddev);
-	drm_dev_unref(ddev);
+	drm_dev_put(ddev);
 
 	return 0;
 }
@@ -294,7 +294,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	drm_kms_helper_poll_fini(ddev);
 	drm_mode_config_cleanup(ddev);
 err_free_drm_dev:
-	drm_dev_unref(ddev);
+	drm_dev_put(ddev);
 
 	return ret;
 }
-- 
2.18.0
