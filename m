Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60507 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752532AbcLLVIW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 16:08:22 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: shmobile: Perform initialization/cleanup at probe/remove time
Date: Mon, 12 Dec 2016 23:08:48 +0200
Message-Id: <1481576928-13623-1-git-send-email-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The drm driver .load() operation is prone to race conditions as it
initializes the driver after registering the device nodes. Its usage is
deprecated, inline it in the probe function and call drm_dev_alloc() and
drm_dev_register() explicitly.

For consistency inline the .unload() handler in the remove function as
well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 206 +++++++++++++++----------------
 1 file changed, 103 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 38dd55f4af81..ec7a5eb809a2 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -104,102 +104,6 @@ static int shmob_drm_setup_clocks(struct shmob_drm_device *sdev,
  * DRM operations
  */
 
-static int shmob_drm_unload(struct drm_device *dev)
-{
-	drm_kms_helper_poll_fini(dev);
-	drm_mode_config_cleanup(dev);
-	drm_vblank_cleanup(dev);
-	drm_irq_uninstall(dev);
-
-	dev->dev_private = NULL;
-
-	return 0;
-}
-
-static int shmob_drm_load(struct drm_device *dev, unsigned long flags)
-{
-	struct shmob_drm_platform_data *pdata = dev->dev->platform_data;
-	struct platform_device *pdev = dev->platformdev;
-	struct shmob_drm_device *sdev;
-	struct resource *res;
-	unsigned int i;
-	int ret;
-
-	if (pdata == NULL) {
-		dev_err(dev->dev, "no platform data\n");
-		return -EINVAL;
-	}
-
-	sdev = devm_kzalloc(&pdev->dev, sizeof(*sdev), GFP_KERNEL);
-	if (sdev == NULL) {
-		dev_err(dev->dev, "failed to allocate private data\n");
-		return -ENOMEM;
-	}
-
-	sdev->dev = &pdev->dev;
-	sdev->pdata = pdata;
-	spin_lock_init(&sdev->irq_lock);
-
-	sdev->ddev = dev;
-	dev->dev_private = sdev;
-
-	/* I/O resources and clocks */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res == NULL) {
-		dev_err(&pdev->dev, "failed to get memory resource\n");
-		return -EINVAL;
-	}
-
-	sdev->mmio = devm_ioremap_nocache(&pdev->dev, res->start,
-					  resource_size(res));
-	if (sdev->mmio == NULL) {
-		dev_err(&pdev->dev, "failed to remap memory resource\n");
-		return -ENOMEM;
-	}
-
-	ret = shmob_drm_setup_clocks(sdev, pdata->clk_source);
-	if (ret < 0)
-		return ret;
-
-	ret = shmob_drm_init_interface(sdev);
-	if (ret < 0)
-		return ret;
-
-	ret = shmob_drm_modeset_init(sdev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to initialize mode setting\n");
-		return ret;
-	}
-
-	for (i = 0; i < 4; ++i) {
-		ret = shmob_drm_plane_create(sdev, i);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to create plane %u\n", i);
-			goto done;
-		}
-	}
-
-	ret = drm_vblank_init(dev, 1);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to initialize vblank\n");
-		goto done;
-	}
-
-	ret = drm_irq_install(dev, platform_get_irq(dev->platformdev, 0));
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to install IRQ handler\n");
-		goto done;
-	}
-
-	platform_set_drvdata(pdev, sdev);
-
-done:
-	if (ret)
-		shmob_drm_unload(dev);
-
-	return ret;
-}
-
 static irqreturn_t shmob_drm_irq(int irq, void *arg)
 {
 	struct drm_device *dev = arg;
@@ -255,8 +159,6 @@ static const struct file_operations shmob_drm_fops = {
 static struct drm_driver shmob_drm_driver = {
 	.driver_features	= DRIVER_HAVE_IRQ | DRIVER_GEM | DRIVER_MODESET
 				| DRIVER_PRIME,
-	.load			= shmob_drm_load,
-	.unload			= shmob_drm_unload,
 	.irq_handler		= shmob_drm_irq,
 	.get_vblank_counter	= drm_vblank_no_hw_counter,
 	.enable_vblank		= shmob_drm_enable_vblank,
@@ -319,18 +221,116 @@ static const struct dev_pm_ops shmob_drm_pm_ops = {
  * Platform driver
  */
 
-static int shmob_drm_probe(struct platform_device *pdev)
+static int shmob_drm_remove(struct platform_device *pdev)
 {
-	return drm_platform_init(&shmob_drm_driver, pdev);
+	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
+	struct drm_device *ddev = sdev->ddev;
+
+	drm_dev_unregister(ddev);
+	drm_kms_helper_poll_fini(ddev);
+	drm_mode_config_cleanup(ddev);
+	drm_irq_uninstall(ddev);
+	drm_dev_unref(ddev);
+
+	return 0;
 }
 
-static int shmob_drm_remove(struct platform_device *pdev)
+static int shmob_drm_probe(struct platform_device *pdev)
 {
-	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
+	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
+	struct shmob_drm_device *sdev;
+	struct drm_device *ddev;
+	struct resource *res;
+	unsigned int i;
+	int ret;
+
+	if (pdata == NULL) {
+		dev_err(&pdev->dev, "no platform data\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Allocate and initialize the driver private data, I/O resources and
+	 * clocks.
+	 */
+	sdev = devm_kzalloc(&pdev->dev, sizeof(*sdev), GFP_KERNEL);
+	if (sdev == NULL)
+		return -ENOMEM;
+
+	sdev->dev = &pdev->dev;
+	sdev->pdata = pdata;
+	spin_lock_init(&sdev->irq_lock);
+
+	platform_set_drvdata(pdev, sdev);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	sdev->mmio = devm_ioremap_resource(&pdev->dev, res);
+	if (sdev->mmio == NULL)
+		return -ENOMEM;
+
+	ret = shmob_drm_setup_clocks(sdev, pdata->clk_source);
+	if (ret < 0)
+		return ret;
 
-	drm_put_dev(sdev->ddev);
+	ret = shmob_drm_init_interface(sdev);
+	if (ret < 0)
+		return ret;
+
+	/* Allocate and initialize the DRM device. */
+	ddev = drm_dev_alloc(&shmob_drm_driver, &pdev->dev);
+	if (IS_ERR(ddev))
+		return PTR_ERR(ddev);
+
+	sdev->ddev = ddev;
+	ddev->dev_private = sdev;
+
+	ret = shmob_drm_modeset_init(sdev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to initialize mode setting\n");
+		goto err_free_drm_dev;
+	}
+
+	for (i = 0; i < 4; ++i) {
+		ret = shmob_drm_plane_create(sdev, i);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to create plane %u\n", i);
+			goto err_modeset_cleanup;
+		}
+	}
+
+	ret = drm_vblank_init(ddev, 1);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to initialize vblank\n");
+		goto err_modeset_cleanup;
+	}
+
+	ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to install IRQ handler\n");
+		goto err_vblank_cleanup;
+	}
+
+	/*
+	 * Register the DRM device with the core and the connectors with
+	 * sysfs.
+	 */
+	ret = drm_dev_register(ddev, 0);
+	if (ret < 0)
+		goto err_irq_uninstall;
 
 	return 0;
+
+err_irq_uninstall:
+	drm_irq_uninstall(ddev);
+err_vblank_cleanup:
+	drm_vblank_cleanup(ddev);
+err_modeset_cleanup:
+	drm_kms_helper_poll_fini(ddev);
+	drm_mode_config_cleanup(ddev);
+err_free_drm_dev:
+	drm_dev_unref(ddev);
+
+	return ret;
 }
 
 static struct platform_driver shmob_drm_platform_driver = {
-- 
Regards,

Laurent Pinchart
