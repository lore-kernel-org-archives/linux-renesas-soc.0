Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:34918 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751253AbeBIPRv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Feb 2018 10:17:51 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>,
        Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>, Alexander Graf <agraf@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-arm@nongnu.org, qemu-devel@nongnu.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/5] vfio/platform: make the vfio-platform device non abstract
Date: Fri,  9 Feb 2018 16:17:32 +0100
Message-Id: <1518189456-2873-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Auger Eric <eric.auger@redhat.com>

Up to now the vfio-platform device has been abstract and could not be
instantiated. The integration of a new vfio platform device required
to create a dummy derived device which only set the compatibility
string.

Following the few vfio-platform device integration we have seen
the actual requested adaptation happens on device tree node creation
(sysbus-fdt).

So this patch removes the abstract setting and defines 2 new options,
manufacturer and model that are used to build a compatibility string.

This latter will be used to match the device tree node creation
function

sysbus-fdt does not support the instantiation of the vfio-platform
device yet.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
[geert: Rebase, Set user_creatable=true]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 hw/vfio/platform.c              | 20 ++++++++++++++++++--
 include/hw/vfio/vfio-platform.h |  2 ++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 0d4bc0aae8891435..32bed1974e23c569 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -637,7 +637,20 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
     VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(dev);
     SysBusDevice *sbdev = SYS_BUS_DEVICE(dev);
     VFIODevice *vbasedev = &vdev->vbasedev;
-    int i, ret;
+    int i, ret = -EINVAL;
+
+    if (!vdev->compat) {
+        if (!vdev->model) {
+            error_setg(errp, "no usable compatible string");
+            goto out;
+        }
+        if (!vdev->manufacturer) {
+            vdev->compat = g_strdup(vdev->model);
+        } else {
+            vdev->compat = g_strjoin(",", vdev->manufacturer,
+                                     vdev->model, NULL);
+        }
+    }
 
     vbasedev->type = VFIO_DEVICE_TYPE_PLATFORM;
     vbasedev->dev = dev;
@@ -681,6 +694,8 @@ static const VMStateDescription vfio_platform_vmstate = {
 static Property vfio_platform_dev_properties[] = {
     DEFINE_PROP_STRING("host", VFIOPlatformDevice, vbasedev.name),
     DEFINE_PROP_STRING("sysfsdev", VFIOPlatformDevice, vbasedev.sysfsdev),
+    DEFINE_PROP_STRING("manufacturer", VFIOPlatformDevice, manufacturer),
+    DEFINE_PROP_STRING("model", VFIOPlatformDevice, model),
     DEFINE_PROP_BOOL("x-no-mmap", VFIOPlatformDevice, vbasedev.no_mmap, false),
     DEFINE_PROP_UINT32("mmap-timeout-ms", VFIOPlatformDevice,
                        mmap_timeout, 1100),
@@ -699,6 +714,8 @@ static void vfio_platform_class_init(ObjectClass *klass, void *data)
     dc->desc = "VFIO-based platform device assignment";
     sbc->connect_irq_notifier = vfio_start_irqfd_injection;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    /* Supported by TYPE_VIRT_MACHINE */
+    dc->user_creatable = true;
 }
 
 static const TypeInfo vfio_platform_dev_info = {
@@ -707,7 +724,6 @@ static const TypeInfo vfio_platform_dev_info = {
     .instance_size = sizeof(VFIOPlatformDevice),
     .class_init = vfio_platform_class_init,
     .class_size = sizeof(VFIOPlatformDeviceClass),
-    .abstract   = true,
 };
 
 static void register_vfio_platform_dev_type(void)
diff --git a/include/hw/vfio/vfio-platform.h b/include/hw/vfio/vfio-platform.h
index 9baaa2db09b84f3e..31b9a9800f7d9d00 100644
--- a/include/hw/vfio/vfio-platform.h
+++ b/include/hw/vfio/vfio-platform.h
@@ -55,6 +55,8 @@ typedef struct VFIOPlatformDevice {
     /* queue of pending IRQs */
     QSIMPLEQ_HEAD(pending_intp_queue, VFIOINTp) pending_intp_queue;
     char *compat; /* compatibility string */
+    char *manufacturer; /* manufacturer (1st part of the compatible property) */
+    char *model; /* model (2d part of the compatible property) */
     uint32_t mmap_timeout; /* delay to re-enable mmaps after interrupt */
     QEMUTimer *mmap_timer; /* allows fast-path resume after IRQ hit */
     QemuMutex intp_mutex; /* protect the intp_list IRQ state */
-- 
2.7.4
