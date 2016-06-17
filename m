Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34180 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753942AbcFQIZk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 04:25:40 -0400
Received: by mail-wm0-f65.google.com with SMTP id 187so14868281wmz.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2016 01:25:39 -0700 (PDT)
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Airlie <airlied@linux.ie>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 7/7] drm/rcar-du: Remove redundant calls to drm_connector_register_all()
Date: Fri, 17 Jun 2016 09:25:23 +0100
Message-Id: <1466151923-1572-8-git-send-email-chris@chris-wilson.co.uk>
In-Reply-To: <1466151923-1572-1-git-send-email-chris@chris-wilson.co.uk>
References: <1466151923-1572-1-git-send-email-chris@chris-wilson.co.uk>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Up to now, the recommendation was for drivers to call drm_dev_register()
followed by drm_connector_register_all(). Now that
drm_connector_register() is safe against multiple invocations, we can
move drm_connector_register_all() to drm_dev_register() and not suffer
from any backwards compatibility issues with drivers not following the
more rigorous init ordering.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 48ec4b6e8b26..36d390093c92 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -278,7 +278,6 @@ static int rcar_du_remove(struct platform_device *pdev)
 	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
 	struct drm_device *ddev = rcdu->ddev;
 
-	drm_connector_unregister_all(ddev);
 	drm_dev_unregister(ddev);
 
 	if (rcdu->fbdev)
@@ -360,10 +359,6 @@ static int rcar_du_probe(struct platform_device *pdev)
 	if (ret)
 		goto error;
 
-	ret = drm_connector_register_all(ddev);
-	if (ret < 0)
-		goto error;
-
 	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
 
 	return 0;
-- 
2.8.1
