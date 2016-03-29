Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3 v4] drm: rcar-du: Use generic drm_connector_register_all() helper
Date: Tue, 29 Mar 2016 13:02:14 +0300
Message-Id: <1459245734-2392-4-git-send-email-abrodkin@synopsys.com>
In-Reply-To: <1459245734-2392-1-git-send-email-abrodkin@synopsys.com>
References: <1459245734-2392-1-git-send-email-abrodkin@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Now that a generic drm_connector_register_all() helper exists we may safely
substitute it for the driver-specific implementation of connectors plugging
in sysfs.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: linux-renesas-soc@vger.kernel.org
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

No changes v3 -> v4.

Changes v2 -> v3:
 * Updated title with capital after colon
 * Updated commit message with fixes of spellos and grammar issues
 * Added ack from Laurent

No changes v1 -> v2.

 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 644db36..0f251dc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -361,14 +361,7 @@ static int rcar_du_probe(struct platform_device *pdev)
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
+	ret = drm_connector_register_all(ddev);
 	if (ret < 0)
 		goto error;
 
-- 
2.5.0
