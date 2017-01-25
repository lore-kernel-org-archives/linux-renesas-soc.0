Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:35800 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752103AbdAYVff (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 16:35:35 -0500
Received: by mail-lf0-f44.google.com with SMTP id n124so135785982lfd.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2017 13:35:34 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, daniel.vetter@intel.com,
        jani.nikula@linux.intel.com, seanpaul@chromium.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] drm: Add live source object
Date: Thu, 26 Jan 2017 00:35:30 +0300
Message-ID: <2140645.srHrqXCQUP@wasted.cogentembedded.com>
In-Reply-To: <1542778.dcWpka5Jpx@wasted.cogentembedded.com>
References: <1542778.dcWpka5Jpx@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Live sources represent a hardware connection between a video stream
source and a CRTC, going through a plane. The kernel API lets driver
register live sources, and the userspace API lets applications enumerate
them.

[Sergei: ported to the modern kernel.]

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 3:
- moved drm_live_source_{init|cleanup}() from drm_crtc.c to drm_plane.c and
  their prototypes from <drm/drm_crtc.h> to <drm/drm_plane.h> (along with
  *struct* drm_live_source[_funcs]);
- moved drm_mode_getsource[_res]() prototypes from <drm/drm_crtc.h> to
  drm_crtc_internal.h;
- updated the ioctl() numbers;
- generally followed the upstream source code moves;
- added my signoff.

 drivers/gpu/drm/drm_crtc.c          |   93 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h |    4 +
 drivers/gpu/drm/drm_ioctl.c         |    2 
 drivers/gpu/drm/drm_mode_config.c   |    7 ++
 drivers/gpu/drm/drm_plane.c         |   62 ++++++++++++++++++++++++
 include/drm/drm_mode_config.h       |    2 
 include/drm/drm_plane.h             |   29 +++++++++++
 include/uapi/drm/drm.h              |    3 +
 include/uapi/drm/drm_mode.h         |   17 ++++++
 9 files changed, 219 insertions(+)

Index: linux/drivers/gpu/drm/drm_crtc.c
===================================================================
--- linux.orig/drivers/gpu/drm/drm_crtc.c
+++ linux/drivers/gpu/drm/drm_crtc.c
@@ -415,6 +415,99 @@ int drm_mode_getcrtc(struct drm_device *
 }
 
 /**
+ * drm_mode_getsource_res - get live source info
+ * @dev: DRM device
+ * @data: ioctl data
+ * @file_priv: DRM file info
+ *
+ * Return a live source and set of IDs.
+ */
+int drm_mode_getsource_res(struct drm_device *dev, void *data,
+			   struct drm_file *file_priv)
+{
+	struct drm_mode_get_live_source_res *src_resp = data;
+	struct drm_mode_config *config;
+	struct drm_live_source *src;
+	uint32_t __user *src_ptr;
+	int copied = 0, ret = 0;
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		return -EINVAL;
+
+	drm_modeset_lock_all(dev);
+	config = &dev->mode_config;
+
+	/*
+	 * This ioctl is called twice, once to determine how much space is
+	 * needed, and the 2nd time to fill it.
+	 */
+	if (config->num_live_source &&
+	    (src_resp->count_sources >= config->num_live_source)) {
+		src_ptr = (uint32_t __user *)(unsigned long)src_resp->source_id_ptr;
+
+		list_for_each_entry(src, &config->live_source_list, head) {
+			if (put_user(src->base.id, src_ptr + copied)) {
+				ret = -EFAULT;
+				goto out;
+			}
+			copied++;
+		}
+	}
+	src_resp->count_sources = config->num_live_source;
+
+out:
+	drm_modeset_unlock_all(dev);
+	return ret;
+}
+
+/**
+ * drm_mode_getsource - get live source info
+ * @dev: DRM device
+ * @data: ioctl data
+ * @file_priv: DRM file info
+ *
+ * Return live source info, including formats supported, ...
+ */
+int drm_mode_getsource(struct drm_device *dev, void *data,
+		       struct drm_file *file_priv)
+{
+	struct drm_mode_get_live_source *src_resp = data;
+	struct drm_mode_object *obj;
+	struct drm_live_source *src;
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		return -EINVAL;
+
+	obj = drm_mode_object_find(dev, src_resp->source_id,
+				   DRM_MODE_OBJECT_LIVE_SOURCE);
+	if (!obj)
+		return -ENOENT;
+	src = obj_to_live_source(obj);
+
+	src_resp->source_id = src->base.id;
+	strlcpy(src_resp->name, src->name, DRM_SOURCE_NAME_LEN);
+	src_resp->possible_planes = src->possible_planes;
+
+	/*
+	 * This ioctl is called twice, once to determine how much space is
+	 * needed, and the 2nd time to fill it.
+	 */
+	if (src->format_count &&
+	    (src_resp->count_format_types >= src->format_count)) {
+		uint32_t __user *format_ptr;
+
+		format_ptr = (uint32_t __user *)(unsigned long)src_resp->format_type_ptr;
+		if (copy_to_user(format_ptr, src->format_types,
+				 sizeof(uint32_t) * src->format_count)) {
+			return -EFAULT;
+		}
+	}
+	src_resp->count_format_types = src->format_count;
+
+	return 0;
+}
+
+/**
  * drm_mode_set_config_internal - helper to call ->set_config
  * @set: modeset config to set
  *
Index: linux/drivers/gpu/drm/drm_crtc_internal.h
===================================================================
--- linux.orig/drivers/gpu/drm/drm_crtc_internal.h
+++ linux/drivers/gpu/drm/drm_crtc_internal.h
@@ -50,6 +50,10 @@ int drm_mode_getcrtc(struct drm_device *
 		     void *data, struct drm_file *file_priv);
 int drm_mode_setcrtc(struct drm_device *dev,
 		     void *data, struct drm_file *file_priv);
+int drm_mode_getsource_res(struct drm_device *dev, void *data,
+			   struct drm_file *file_priv);
+int drm_mode_getsource(struct drm_device *dev, void *data,
+		       struct drm_file *file_priv);
 
 
 /* drm_mode_config.c */
Index: linux/drivers/gpu/drm/drm_ioctl.c
===================================================================
--- linux.orig/drivers/gpu/drm/drm_ioctl.c
+++ linux/drivers/gpu/drm/drm_ioctl.c
@@ -612,10 +612,12 @@ static const struct drm_ioctl_desc drm_i
 	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_FD_TO_HANDLE, drm_prime_fd_to_handle_ioctl, DRM_AUTH|DRM_UNLOCKED|DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPLANERESOURCES, drm_mode_getplane_res, DRM_CONTROL_ALLOW|DRM_UNLOCKED),
+	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETSOURCERESOURCES, drm_mode_getsource_res, DRM_CONTROL_ALLOW|DRM_UNLOCKED),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCRTC, drm_mode_getcrtc, DRM_CONTROL_ALLOW|DRM_UNLOCKED),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETCRTC, drm_mode_setcrtc, DRM_MASTER|DRM_CONTROL_ALLOW|DRM_UNLOCKED),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPLANE, drm_mode_getplane, DRM_CONTROL_ALLOW|DRM_UNLOCKED),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETPLANE, drm_mode_setplane, DRM_MASTER|DRM_CONTROL_ALLOW|DRM_UNLOCKED),
+	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETSOURCE, drm_mode_getsource, DRM_CONTROL_ALLOW|DRM_UNLOCKED),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CURSOR, drm_mode_cursor_ioctl, DRM_MASTER|DRM_CONTROL_ALLOW|DRM_UNLOCKED),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETGAMMA, drm_mode_gamma_get_ioctl, DRM_UNLOCKED),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETGAMMA, drm_mode_gamma_set_ioctl, DRM_MASTER|DRM_UNLOCKED),
Index: linux/drivers/gpu/drm/drm_mode_config.c
===================================================================
--- linux.orig/drivers/gpu/drm/drm_mode_config.c
+++ linux/drivers/gpu/drm/drm_mode_config.c
@@ -366,6 +366,7 @@ void drm_mode_config_init(struct drm_dev
 	INIT_LIST_HEAD(&dev->mode_config.property_list);
 	INIT_LIST_HEAD(&dev->mode_config.property_blob_list);
 	INIT_LIST_HEAD(&dev->mode_config.plane_list);
+	INIT_LIST_HEAD(&dev->mode_config.live_source_list);
 	idr_init(&dev->mode_config.crtc_idr);
 	idr_init(&dev->mode_config.tile_idr);
 	ida_init(&dev->mode_config.connector_ida);
@@ -406,6 +407,7 @@ void drm_mode_config_cleanup(struct drm_
 	struct drm_property *property, *pt;
 	struct drm_property_blob *blob, *bt;
 	struct drm_plane *plane, *plt;
+	struct drm_live_source *src, *psrc;
 
 	list_for_each_entry_safe(encoder, enct, &dev->mode_config.encoder_list,
 				 head) {
@@ -433,6 +435,11 @@ void drm_mode_config_cleanup(struct drm_
 		plane->funcs->destroy(plane);
 	}
 
+	list_for_each_entry_safe(src, psrc, &dev->mode_config.live_source_list,
+				 head) {
+		src->funcs->destroy(src);
+	}
+
 	list_for_each_entry_safe(crtc, ct, &dev->mode_config.crtc_list, head) {
 		crtc->funcs->destroy(crtc);
 	}
Index: linux/drivers/gpu/drm/drm_plane.c
===================================================================
--- linux.orig/drivers/gpu/drm/drm_plane.c
+++ linux/drivers/gpu/drm/drm_plane.c
@@ -248,6 +248,68 @@ void drm_plane_cleanup(struct drm_plane
 }
 EXPORT_SYMBOL(drm_plane_cleanup);
 
+int drm_live_source_init(struct drm_device *dev, struct drm_live_source *src,
+			 const char *name, unsigned long possible_planes,
+			 const uint32_t *formats, uint32_t format_count,
+			 const struct drm_live_source_funcs *funcs)
+{
+	unsigned int i;
+	int ret;
+
+	/* Multi-planar live sources are not supported for now. */
+	for (i = 0; i < format_count; ++i) {
+		if (drm_format_num_planes(formats[i]) != 1) {
+			DRM_DEBUG_KMS("multiplanar live sources unsupported\n");
+			return -EINVAL;
+		}
+	}
+
+	drm_modeset_lock_all(dev);
+
+	ret = drm_mode_object_get(dev, &src->base, DRM_MODE_OBJECT_LIVE_SOURCE);
+	if (ret)
+		goto out;
+
+	src->dev = dev;
+	src->funcs = funcs;
+	if (name)
+		strlcpy(src->name, name, DRM_SOURCE_NAME_LEN);
+	src->possible_planes = possible_planes;
+
+	src->format_types = kmalloc_array(format_count,
+					  sizeof(*src->format_types),
+					  GFP_KERNEL);
+	if (!src->format_types) {
+		DRM_DEBUG_KMS("out of memory when allocating source foramts\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	memcpy(src->format_types, formats,
+	       format_count * sizeof(*src->format_types));
+	src->format_count = format_count;
+
+	list_add_tail(&src->head, &dev->mode_config.live_source_list);
+	dev->mode_config.num_live_source++;
+
+ out:
+	drm_modeset_unlock_all(dev);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_live_source_init);
+
+void drm_live_source_cleanup(struct drm_live_source *src)
+{
+	struct drm_device *dev = src->dev;
+
+	drm_modeset_lock_all(dev);
+	list_del(&src->head);
+	dev->mode_config.num_live_source--;
+	drm_modeset_unlock_all(dev);
+}
+EXPORT_SYMBOL(drm_live_source_cleanup);
+
 /**
  * drm_plane_from_index - find the registered plane at an index
  * @dev: DRM device
Index: linux/include/drm/drm_mode_config.h
===================================================================
--- linux.orig/include/drm/drm_mode_config.h
+++ linux/include/drm/drm_mode_config.h
@@ -396,6 +396,8 @@ struct drm_mode_config {
 	int num_overlay_plane;
 	int num_total_plane;
 	struct list_head plane_list;
+	int num_live_source;
+	struct list_head live_source_list;
 
 	int num_crtc;
 	struct list_head crtc_list;
Index: linux/include/drm/drm_plane.h
===================================================================
--- linux.orig/include/drm/drm_plane.h
+++ linux/include/drm/drm_plane.h
@@ -29,6 +29,7 @@
 
 struct drm_crtc;
 struct drm_printer;
+struct drm_live_source;
 
 /**
  * struct drm_plane_state - mutable plane state
@@ -527,6 +528,34 @@ extern int drm_plane_init(struct drm_dev
 			  bool is_primary);
 extern void drm_plane_cleanup(struct drm_plane *plane);
 
+struct drm_live_source_funcs {
+	void (*destroy)(struct drm_live_source *src);
+};
+
+struct drm_live_source {
+	struct drm_device *dev;
+	struct list_head head;
+
+	struct drm_mode_object base;
+
+	char name[DRM_SOURCE_NAME_LEN];
+
+	uint32_t possible_planes;
+	uint32_t *format_types;
+	uint32_t format_count;
+
+	const struct drm_live_source_funcs *funcs;
+};
+
+#define obj_to_live_source(x) container_of(x, struct drm_live_source, base)
+
+extern int drm_live_source_init(struct drm_device *dev,
+				struct drm_live_source *src, const char *name,
+				unsigned long possible_planes,
+				const uint32_t *formats, uint32_t format_count,
+				const struct drm_live_source_funcs *funcs);
+extern void drm_live_source_cleanup(struct drm_live_source *src);
+
 /**
  * drm_plane_index - find the index of a registered plane
  * @plane: plane to find index for
Index: linux/include/uapi/drm/drm.h
===================================================================
--- linux.orig/include/uapi/drm/drm.h
+++ linux/include/uapi/drm/drm.h
@@ -814,6 +814,9 @@ extern "C" {
 #define DRM_IOCTL_MODE_CREATEPROPBLOB	DRM_IOWR(0xBD, struct drm_mode_create_blob)
 #define DRM_IOCTL_MODE_DESTROYPROPBLOB	DRM_IOWR(0xBE, struct drm_mode_destroy_blob)
 
+#define DRM_IOCTL_MODE_GETSOURCERESOURCES DRM_IOWR(0xBF, struct drm_mode_get_live_source_res)
+#define DRM_IOCTL_MODE_GETSOURCE	DRM_IOWR(0xC0, struct drm_mode_get_live_source)
+
 /**
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
Index: linux/include/uapi/drm/drm_mode.h
===================================================================
--- linux.orig/include/uapi/drm/drm_mode.h
+++ linux/include/uapi/drm/drm_mode.h
@@ -37,6 +37,7 @@ extern "C" {
 #define DRM_CONNECTOR_NAME_LEN	32
 #define DRM_DISPLAY_MODE_LEN	32
 #define DRM_PROP_NAME_LEN	32
+#define DRM_SOURCE_NAME_LEN	32
 
 #define DRM_MODE_TYPE_BUILTIN	(1<<0)
 #define DRM_MODE_TYPE_CLOCK_C	((1<<1) | DRM_MODE_TYPE_BUILTIN)
@@ -214,6 +215,21 @@ struct drm_mode_get_plane_res {
 	__u32 count_planes;
 };
 
+struct drm_mode_get_live_source {
+	__u32 source_id;
+	char name[DRM_SOURCE_NAME_LEN];
+
+	__u32 possible_planes;
+
+	__u32 count_format_types;
+	__u64 format_type_ptr;
+};
+
+struct drm_mode_get_live_source_res {
+	__u64 source_id_ptr;
+	__u32 count_sources;
+};
+
 #define DRM_MODE_ENCODER_NONE	0
 #define DRM_MODE_ENCODER_DAC	1
 #define DRM_MODE_ENCODER_TMDS	2
@@ -352,6 +368,7 @@ struct drm_mode_connector_set_property {
 #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
 #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
 #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
+#define DRM_MODE_OBJECT_LIVE_SOURCE 0xe1e1e1e1
 #define DRM_MODE_OBJECT_ANY 0
 
 struct drm_mode_obj_get_properties {
