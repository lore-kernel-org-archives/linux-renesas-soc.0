Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:41627 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756747AbdLOPQb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:16:31 -0500
Received: by mail-wr0-f193.google.com with SMTP id z18so8334850wrb.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 07:16:31 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 7/7] drm/img-rogue: replace call to obsolete drm_platform_init()
Date: Fri, 15 Dec 2017 16:15:45 +0100
Message-Id: <1513350945-2642-8-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use drm_dev_alloc(), drm_dev_register() and remove the .load and .unload
methods from drm_driver.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 include/drm/pvr_drm.h                            |  2 ++
 kernel/drivers/staging/imgtec/pvr_drm.c          | 23 +----------------------
 kernel/drivers/staging/imgtec/pvr_platform_drv.c | 19 ++++++++++++++++++-
 3 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/include/drm/pvr_drm.h b/include/drm/pvr_drm.h
index 5cd13cc..3308791 100644
--- a/include/drm/pvr_drm.h
+++ b/include/drm/pvr_drm.h
@@ -99,4 +99,6 @@ struct drm_pvr_dbgdrv_cmd {
 #define	DRM_IOCTL_PVR_SRVKM_CMD		DRM_IOWR(DRM_COMMAND_BASE + DRM_PVR_SRVKM_CMD, struct drm_pvr_srvkm_cmd)
 #define	DRM_IOCTL_PVR_DBGDRV_CMD	DRM_IOWR(DRM_COMMAND_BASE + DRM_PVR_DBGDRV_CMD, struct drm_pvr_dbgdrv_cmd)
 
+int pvr_drm_load(struct drm_device *ddev, unsigned long flags);
+
 #endif /* defined(__PVR_DRM_H__) */
diff --git a/kernel/drivers/staging/imgtec/pvr_drm.c b/kernel/drivers/staging/imgtec/pvr_drm.c
index 388943b..c69fec1 100644
--- a/kernel/drivers/staging/imgtec/pvr_drm.c
+++ b/kernel/drivers/staging/imgtec/pvr_drm.c
@@ -93,7 +93,7 @@ const struct dev_pm_ops pvr_pm_ops = {
 };
 
 
-static int pvr_drm_load(struct drm_device *ddev, unsigned long flags)
+int pvr_drm_load(struct drm_device *ddev, unsigned long flags)
 {
 	struct _PVRSRV_DEVICE_NODE_ *dev_node;
 	enum PVRSRV_ERROR srv_err;
@@ -101,13 +101,6 @@ static int pvr_drm_load(struct drm_device *ddev, unsigned long flags)
 
 	DRM_DEBUG_DRIVER("device %p\n", ddev->dev);
 
-	/*
-	 * The equivalent is done for PCI modesetting drivers by
-	 * drm_get_pci_dev()
-	 */
-	if (ddev->platformdev)
-		platform_set_drvdata(ddev->platformdev, ddev);
-
 	srv_err = PVRSRVDeviceCreate(ddev->dev, &dev_node);
 	if (srv_err != PVRSRV_OK) {
 		DRM_ERROR("failed to create device node for device %p (%s)\n",
@@ -134,18 +127,6 @@ err_exit:
 	return err;
 }
 
-static int pvr_drm_unload(struct drm_device *ddev)
-{
-	DRM_DEBUG_DRIVER("device %p\n", ddev->dev);
-
-	PVRSRVCommonDeviceDeinit(ddev->dev_private);
-
-	PVRSRVDeviceDestroy(ddev->dev_private);
-	ddev->dev_private = NULL;
-
-	return 0;
-}
-
 static int pvr_drm_open(struct drm_device *ddev, struct drm_file *dfile)
 {
 	int err;
@@ -237,8 +218,6 @@ const struct drm_driver pvr_drm_generic_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_RENDER,
 
 	.dev_priv_size		= 0,
-	.load			= pvr_drm_load,
-	.unload			= pvr_drm_unload,
 	.open			= pvr_drm_open,
 	.postclose		= pvr_drm_release,
 
diff --git a/kernel/drivers/staging/imgtec/pvr_platform_drv.c b/kernel/drivers/staging/imgtec/pvr_platform_drv.c
index 54a7d02..63b142d 100644
--- a/kernel/drivers/staging/imgtec/pvr_platform_drv.c
+++ b/kernel/drivers/staging/imgtec/pvr_platform_drv.c
@@ -50,6 +50,7 @@ CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 #include "module_common.h"
 #include "pvr_drv.h"
+#include "pvr_drm.h"
 #include "pvrmodule.h"
 #include "sysinfo.h"
 
@@ -149,9 +150,25 @@ static void pvr_devices_unregister(void)
 
 static int pvr_probe(struct platform_device *pdev)
 {
+	struct drm_device *drm;
+	int result;
+
 	DRM_DEBUG_DRIVER("device %p\n", &pdev->dev);
 
-	return drm_platform_init(&pvr_drm_platform_driver, pdev);
+	drm = drm_dev_alloc(&pvr_drm_platform_driver, &pdev->dev);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	platform_set_drvdata(pdev, drm);
+
+	result = pvr_drm_load(drm, 0);
+
+	if (result)
+		return result;
+
+	result = drm_dev_register(drm, 0);
+
+	return result;
 }
 
 static int pvr_remove(struct platform_device *pdev)
-- 
2.7.4
