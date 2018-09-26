Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58212 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726841AbeIZSFw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 14:05:52 -0400
From: Thomas Zimmermann <tzimmermann@suse.de>
To: laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [RESEND PATCH] drm/rcar-du: Replace drm_dev_unref with drm_dev_put
Date: Wed, 26 Sep 2018 13:53:12 +0200
Message-Id: <20180926115312.24158-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch unifies the naming of DRM functions for reference counting
of struct drm_device. The resulting code is more aligned with the rest
of the Linux kernel interfaces.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 0954ecd2f943..476d4d427044 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -413,7 +413,7 @@ static int rcar_du_remove(struct platform_device *pdev)
 	drm_kms_helper_poll_fini(ddev);
 	drm_mode_config_cleanup(ddev);

-	drm_dev_unref(ddev);
+	drm_dev_put(ddev);

 	return 0;
 }
--
2.19.0
