Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Only unwindow as necessary on probe failure
Date: Wed,  6 Apr 2016 11:45:52 +0200
Message-Id: <1459935952-4639-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Simply calling rcar_du_remove on any error can cause unbalanced calls to
various functions (e.g. drm_connector_register/unregister,
drm_dev_register/drm_dev_unref).

This can be seen at bootup of my Porter boards with current next:

[    2.789322] rcar-du feb00000.display: failed to initialize DRM/KMS (-517)
[    2.796267] ------------[ cut here ]------------
[    2.800996] WARNING: CPU: 1 PID: 1 at include/drm/drm_crtc.h:2623 drm_connector_unregister_all+0x60/0x68
[    2.810689] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.6.0-rc2-next-20160405-dirty #11
[    2.818864] Hardware name: Generic R8A7791 (Flattened Device Tree)
[    2.825174] Backtrace:
[    2.827699] [<c010aa2c>] (dump_backtrace) from [<c010abd8>] (show_stack+0x18/0x1c)
[    2.835430]  r7:c042da78 r6:00000009 r5:60000013 r4:00000000
[    2.841251] [<c010abc0>] (show_stack) from [<c0379244>] (dump_stack+0x84/0xa4)
[    2.848632] [<c03791c0>] (dump_stack) from [<c011c3b0>] (__warn+0xd0/0x100)
[    2.855739]  r5:00000000 r4:00000000
[    2.859409] [<c011c2e0>] (__warn) from [<c011c498>] (warn_slowpath_null+0x28/0x30)
[    2.867139]  r9:00000001 r8:ef1dc610 r7:ef114010 r6:ef1dc600 r5:ef114010 r4:ef2f2400
[    2.875096] [<c011c470>] (warn_slowpath_null) from [<c042da78>] (drm_connector_unregister_all+0x60/0x68)
[    2.884785] [<c042da18>] (drm_connector_unregister_all) from [<c0440ac8>] (rcar_du_remove+0x1c/0x5c)
[    2.894111]  r5:ef114010 r4:ef2f2400
[    2.897780] [<c0440aac>] (rcar_du_remove) from [<c0440d50>] (rcar_du_probe+0x1d0/0x210)
[    2.905953]  r5:ef2f2400 r4:fffffdfb
[    2.909625] [<c0440b80>] (rcar_du_probe) from [<c044c1d4>] (platform_drv_probe+0x58/0xa8)
[    2.917976]  r9:00000000 r8:c0a1cca4 r7:c0a71a48 r6:c0a1cca4 r5:ef1dc610 r4:c0440b80

Adjust the code to only unwind as necessary on probe failures

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

---

 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 644db36..deb75fa 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -333,7 +333,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 	rcdu->mmio = devm_ioremap_resource(&pdev->dev, mem);
 	if (IS_ERR(rcdu->mmio)) {
 		ret = PTR_ERR(rcdu->mmio);
-		goto error;
+		goto error_dev;
 	}
 
 	/* Initialize vertical blanking interrupts handling. Start with vblank
@@ -342,14 +342,17 @@ static int rcar_du_probe(struct platform_device *pdev)
 	ret = drm_vblank_init(ddev, (1 << rcdu->info->num_crtcs) - 1);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to initialize vblank\n");
-		goto error;
+		goto error_dev;
 	}
 
 	/* DRM/KMS objects */
 	ret = rcar_du_modeset_init(rcdu);
 	if (ret < 0) {
+		/* modeset_init could have failed partway through and doesn't
+		 * do its own cleanup, so needs to be completely undone.
+		 */
 		dev_err(&pdev->dev, "failed to initialize DRM/KMS (%d)\n", ret);
-		goto error;
+		goto error_modeset;
 	}
 
 	ddev->irq_enabled = 1;
@@ -359,7 +362,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 	 */
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
-		goto error;
+		goto error_modeset;
 
 	mutex_lock(&ddev->mode_config.mutex);
 	drm_for_each_connector(connector, ddev) {
@@ -369,15 +372,30 @@ static int rcar_du_probe(struct platform_device *pdev)
 	}
 	mutex_unlock(&ddev->mode_config.mutex);
 
+	/* One or more connects could have been registered, so unregister all
+	 * connectors.
+	 */
 	if (ret < 0)
-		goto error;
+		goto error_connector;
 
 	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
 
 	return 0;
 
-error:
-	rcar_du_remove(pdev);
+error_connector:
+	drm_connector_unregister_all(ddev);
+	drm_dev_unregister(ddev);
+
+error_modeset:
+	if (rcdu->fbdev)
+		drm_fbdev_cma_fini(rcdu->fbdev);
+
+	drm_kms_helper_poll_fini(ddev);
+	drm_mode_config_cleanup(ddev);
+	drm_vblank_cleanup(ddev);
+
+error_dev:
+	drm_dev_unref(ddev);
 
 	return ret;
 }
-- 
2.8.0.rc3
