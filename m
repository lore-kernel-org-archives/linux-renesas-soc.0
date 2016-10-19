Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35152 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752030AbcJSO07 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2016 10:26:59 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: rcar-du: Simplify and fix probe error handling
Date: Wed, 19 Oct 2016 17:26:53 +0300
Message-Id: <1476887213-24901-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

It isn't safe to call drm_dev_unregister() without first initializing
mode setting with drm_mode_config_init(). This leads to a crash if
either IO memory can't be remapped or vblank initialization fails.

Fix this by reordering the initialization sequence. Move vblank
initialization after the drm_mode_config_init() call, and move IO
remapping before drm_dev_alloc() to avoid the need to perform clean up
in case of failure.

While at it remove the explicit drm_vblank_cleanup() call from
rcar_du_remove() as the drm_dev_unregister() function already cleans up
vblank.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 30 ++++++++++--------------------
 drivers/gpu/drm/rcar-du/rcar_du_kms.c |  7 +++++++
 2 files changed, 17 insertions(+), 20 deletions(-)

(Resent with the proper dri-devel mailing list address, sorry for the noise)

I wonder whether it's safe to call drm_dev_unregister() without a previous
call to drm_dev_register(), or if it only works at the time being by chance.
The function is convenient to implement error handlers without having to
resort go lots of goto's or manual tests.

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 16ef919f316f..5968c2fa8e33 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -334,7 +334,6 @@ static int rcar_du_remove(struct platform_device *pdev)
 
 	drm_kms_helper_poll_fini(ddev);
 	drm_mode_config_cleanup(ddev);
-	drm_vblank_cleanup(ddev);
 
 	drm_dev_unref(ddev);
 
@@ -348,7 +347,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 	struct resource *mem;
 	int ret;
 
-	/* Allocate and initialize the DRM and R-Car device structures. */
+	/* Allocate and initialize the R-Car device structure. */
 	rcdu = devm_kzalloc(&pdev->dev, sizeof(*rcdu), GFP_KERNEL);
 	if (rcdu == NULL)
 		return -ENOMEM;
@@ -358,31 +357,22 @@ static int rcar_du_probe(struct platform_device *pdev)
 	rcdu->dev = &pdev->dev;
 	rcdu->info = of_match_device(rcar_du_of_table, rcdu->dev)->data;
 
-	ddev = drm_dev_alloc(&rcar_du_driver, &pdev->dev);
-	if (IS_ERR(ddev))
-		return PTR_ERR(ddev);
-
-	rcdu->ddev = ddev;
-	ddev->dev_private = rcdu;
-
 	platform_set_drvdata(pdev, rcdu);
 
 	/* I/O resources */
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	rcdu->mmio = devm_ioremap_resource(&pdev->dev, mem);
-	if (IS_ERR(rcdu->mmio)) {
-		ret = PTR_ERR(rcdu->mmio);
-		goto error;
-	}
-
-	/* Initialize vertical blanking interrupts handling. Start with vblank
-	 * disabled for all CRTCs.
-	 */
-	ret = drm_vblank_init(ddev, (1 << rcdu->info->num_crtcs) - 1);
-	if (ret < 0)
-		goto error;
+	if (IS_ERR(rcdu->mmio))
+		return PTR_ERR(rcdu->mmio);
 
 	/* DRM/KMS objects */
+	ddev = drm_dev_alloc(&rcar_du_driver, &pdev->dev);
+	if (IS_ERR(ddev))
+		return PTR_ERR(ddev);
+
+	rcdu->ddev = ddev;
+	ddev->dev_private = rcdu;
+
 	ret = rcar_du_modeset_init(rcdu);
 	if (ret < 0) {
 		if (ret != -EPROBE_DEFER)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 1f9f13a80f85..57437e3372a6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -526,6 +526,13 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	if (ret < 0)
 		return ret;
 
+	/* Initialize vertical blanking interrupts handling. Start with vblank
+	 * disabled for all CRTCs.
+	 */
+	ret = drm_vblank_init(dev, (1 << rcdu->info->num_crtcs) - 1);
+	if (ret < 0)
+		return ret;
+
 	/* Initialize the groups. */
 	num_groups = DIV_ROUND_UP(rcdu->num_crtcs, 2);
 
-- 
Regards,

Laurent Pinchart
