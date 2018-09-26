Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:59582 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727677AbeIZSIG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 14:08:06 -0400
From: Thomas Zimmermann <tzimmermann@suse.de>
To: laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [RESEND PATCH] drm/shmobile: Replace drm_dev_unref with drm_dev_put
Date: Wed, 26 Sep 2018 13:55:25 +0200
Message-Id: <20180926115525.24500-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch unifies the naming of DRM functions for reference counting
of struct drm_device. The resulting code is more aligned with the rest
of the Linux kernel interfaces.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 6ececad6f845..8554102a6ead 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -194,7 +194,7 @@ static int shmob_drm_remove(struct platform_device *pdev)
 	drm_kms_helper_poll_fini(ddev);
 	drm_mode_config_cleanup(ddev);
 	drm_irq_uninstall(ddev);
-	drm_dev_unref(ddev);
+	drm_dev_put(ddev);

 	return 0;
 }
@@ -290,7 +290,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	drm_kms_helper_poll_fini(ddev);
 	drm_mode_config_cleanup(ddev);
 err_free_drm_dev:
-	drm_dev_unref(ddev);
+	drm_dev_put(ddev);

 	return ret;
 }
--
2.19.0
