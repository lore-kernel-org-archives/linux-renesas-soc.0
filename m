Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4 v2] drm: rename drm_connector_unplug_all() to drm_connector_unregister_all()
Date: Mon, 21 Mar 2016 15:28:37 +0300
Message-Id: <1458563320-30541-2-git-send-email-abrodkin@synopsys.com>
In-Reply-To: <1458563320-30541-1-git-send-email-abrodkin@synopsys.com>
References: <1458563320-30541-1-git-send-email-abrodkin@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Current name is a bit misleading because what that helper function
really does it calls drm_connector_unregister() for all connectors.

This all has nothing to do with hotplugging so let's name things
properly.

And while at it remove potentially dangerous locking around
drm_connector_unregister() in rcar_du_remove() as mentioned
in kerneldoc for drm_connector_unregister_all().

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---

Changes v1 -> v2:
 * This patch was only introduced in v2.

 drivers/gpu/drm/drm_crtc.c            | 6 +++---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 +----
 drivers/gpu/drm/udl/udl_drv.c         | 2 +-
 include/drm/drm_crtc.h                | 4 ++--
 4 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 65258ac..76453cd 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -1082,14 +1082,14 @@ EXPORT_SYMBOL(drm_connector_unregister);
 
 
 /**
- * drm_connector_unplug_all - unregister connector userspace interfaces
+ * drm_connector_unregister_all - unregister connector userspace interfaces
  * @dev: drm device
  *
  * This function unregisters all connector userspace interfaces in sysfs. Should
  * be call when the device is disconnected, e.g. from an usb driver's
  * ->disconnect callback.
  */
-void drm_connector_unplug_all(struct drm_device *dev)
+void drm_connector_unregister_all(struct drm_device *dev)
 {
 	struct drm_connector *connector;
 
@@ -1098,7 +1098,7 @@ void drm_connector_unplug_all(struct drm_device *dev)
 		drm_connector_unregister(connector);
 
 }
-EXPORT_SYMBOL(drm_connector_unplug_all);
+EXPORT_SYMBOL(drm_connector_unregister_all);
 
 /**
  * drm_encoder_init - Init a preallocated encoder
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index ed6006b..644db36 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -278,10 +278,7 @@ static int rcar_du_remove(struct platform_device *pdev)
 	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
 	struct drm_device *ddev = rcdu->ddev;
 
-	mutex_lock(&ddev->mode_config.mutex);
-	drm_connector_unplug_all(ddev);
-	mutex_unlock(&ddev->mode_config.mutex);
-
+	drm_connector_unregister_all(ddev);
 	drm_dev_unregister(ddev);
 
 	if (rcdu->fbdev)
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 772ec9e..c204089 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -94,7 +94,7 @@ static void udl_usb_disconnect(struct usb_interface *interface)
 	struct drm_device *dev = usb_get_intfdata(interface);
 
 	drm_kms_helper_poll_disable(dev);
-	drm_connector_unplug_all(dev);
+	drm_connector_unregister_all(dev);
 	udl_fbdev_unplug(dev);
 	udl_drop_usb(dev);
 	drm_unplug_dev(dev);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8c7fb3d..42d9f4d 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -2214,8 +2214,8 @@ void drm_connector_unregister(struct drm_connector *connector);
 
 extern void drm_connector_cleanup(struct drm_connector *connector);
 extern unsigned int drm_connector_index(struct drm_connector *connector);
-/* helper to unplug all connectors from sysfs for device */
-extern void drm_connector_unplug_all(struct drm_device *dev);
+/* helper to unregister all connectors from sysfs for device */
+extern void drm_connector_unregister_all(struct drm_device *dev);
 
 extern int drm_bridge_add(struct drm_bridge *bridge);
 extern void drm_bridge_remove(struct drm_bridge *bridge);
-- 
2.5.0
