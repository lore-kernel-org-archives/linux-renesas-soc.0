Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] drm: rcar-du - use generic drm_connector_plug_all() helper
Date: Fri, 18 Mar 2016 13:01:44 +0300
Message-Id: <1458295304-5528-4-git-send-email-abrodkin@synopsys.com>
In-Reply-To: <1458295304-5528-1-git-send-email-abrodkin@synopsys.com>
References: <1458295304-5528-1-git-send-email-abrodkin@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Now when generic drm_connector_plug_all() helper exists we may safely
substiture with it driver-specific implementation of connectors plugging in
sysfs.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index ed6006b..d5ec674 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -364,14 +364,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 	if (ret)
 		goto error;
 
-	mutex_lock(&ddev->mode_config.mutex);
-	drm_for_each_connector(connector, ddev) {
-		ret = drm_connector_register(connector);
-		if (ret < 0)
-			break;
-	}
-	mutex_unlock(&ddev->mode_config.mutex);
-
+	ret = drm_connector_plug_all(ddev);
 	if (ret < 0)
 		goto error;
 
-- 
2.5.0
