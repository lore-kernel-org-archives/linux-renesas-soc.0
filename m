Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:33848 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752089AbeBIPRv (ORCPT
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
Subject: [PATCH/RFC 4/5] vfio: No-IOMMU mode support
Date: Fri,  9 Feb 2018 16:17:35 +0100
Message-Id: <1518189456-2873-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>

Add qemu support for the newly introduced VFIO No-IOMMU driver.

We need to add special handling for:
- Group character device is /dev/vfio/noiommu-$GROUP.
- No-IOMMU does not rely on a memory listener.
- No IOMMU will be set for its group, so no need to call
  vfio_kvm_device_add_group.

Signed-off-by: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
[geert: Rebase]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 hw/vfio/common.c              | 61 ++++++++++++++++++++++++++++++++++---------
 include/hw/vfio/vfio-common.h |  2 ++
 2 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f895e3c3359af779..2ee94a3304202a74 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1019,6 +1019,33 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->fd = fd;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
+    container->noiommu = group->noiommu;
+
+    if (container->noiommu) {
+        ret = ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &fd);
+        if (ret) {
+            error_report("vfio: failed to set group container: %m");
+            ret = -errno;
+            goto free_container_exit;
+        }
+
+        ret = ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_NOIOMMU_IOMMU);
+        if (!ret) {
+            error_report("vfio: No available IOMMU models");
+            ret = -EINVAL;
+            goto free_container_exit;
+        }
+
+        ret = ioctl(fd, VFIO_SET_IOMMU, VFIO_NOIOMMU_IOMMU);
+        if (ret) {
+            error_report("vfio: failed to set iommu for container: %m");
+            ret = -errno;
+            goto free_container_exit;
+        }
+
+        goto listener_register;
+    }
+
     if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) ||
         ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
         bool v2 = !!ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU);
@@ -1151,15 +1178,16 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     group->container = container;
     QLIST_INSERT_HEAD(&container->group_list, group, container_next);
 
-    container->listener = vfio_memory_listener;
-
-    memory_listener_register(&container->listener, container->space->as);
-
-    if (container->error) {
-        ret = container->error;
-        error_setg_errno(errp, -ret,
-                         "memory listener initialization failed for container");
-        goto listener_release_exit;
+listener_register:
+    if (!container->noiommu) {
+        container->listener = vfio_memory_listener;
+        memory_listener_register(&container->listener, container->space->as);
+        if (container->error) {
+            ret = container->error;
+            error_setg_errno(errp, -ret,
+                    "memory listener initialization failed for container");
+            goto listener_release_exit;
+        }
     }
 
     container->initialized = true;
@@ -1169,7 +1197,9 @@ listener_release_exit:
     QLIST_REMOVE(group, container_next);
     QLIST_REMOVE(container, next);
     vfio_kvm_device_del_group(group);
-    vfio_listener_release(container);
+    if (!container->noiommu) {
+        vfio_listener_release(container);
+    }
 
 free_container_exit:
     g_free(container);
@@ -1195,7 +1225,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
      * since unset may destroy the backend container if it's the last
      * group.
      */
-    if (QLIST_EMPTY(&container->group_list)) {
+    if (QLIST_EMPTY(&container->group_list) && !container->noiommu) {
         vfio_listener_release(container);
     }
 
@@ -1249,8 +1279,13 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
     snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
     group->fd = qemu_open(path, O_RDWR);
     if (group->fd < 0) {
-        error_setg_errno(errp, errno, "failed to open %s", path);
-        goto free_group_exit;
+        snprintf(path, sizeof(path), "/dev/vfio/noiommu-%d", groupid);
+        group->fd = qemu_open(path, O_RDWR);
+        if (group->fd < 0) {
+            error_setg_errno(errp, errno, "failed to open %s", path);
+            goto free_group_exit;
+        }
+        group->noiommu = 1;
     }
 
     if (ioctl(group->fd, VFIO_GROUP_GET_STATUS, &status)) {
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index f3a2ac9fee02066f..aca2e33efb9b118c 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -77,6 +77,7 @@ struct VFIOGroup;
 typedef struct VFIOContainer {
     VFIOAddressSpace *space;
     int fd; /* /dev/vfio/vfio, empowered by the attached groups */
+    bool noiommu;
     MemoryListener listener;
     MemoryListener prereg_listener;
     unsigned iommu_type;
@@ -136,6 +137,7 @@ struct VFIODeviceOps {
 typedef struct VFIOGroup {
     int fd;
     int groupid;
+    bool noiommu;
     VFIOContainer *container;
     QLIST_HEAD(, VFIODevice) device_list;
     QLIST_ENTRY(VFIOGroup) next;
-- 
2.7.4
