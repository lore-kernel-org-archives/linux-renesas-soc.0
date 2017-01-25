Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:36843 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751847AbdAYVia (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 16:38:30 -0500
Received: by mail-lf0-f41.google.com with SMTP id z134so136088949lff.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2017 13:38:29 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] drm: rcar-du: Add VSP1 live source support
Date: Thu, 26 Jan 2017 00:38:26 +0300
Message-ID: <2606258.J5UQyLyQ6T@wasted.cogentembedded.com>
In-Reply-To: <1542778.dcWpka5Jpx@wasted.cogentembedded.com>
References: <1542778.dcWpka5Jpx@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Register live sources for VSPD0 and VSPD1 and configure the plane source
at plane setup time to source frames from memory or from the VSP1.

[Sergei: ported to the modern kernel.]

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 3:
- ported the patch to the modern kernel;
- reformatted rcar_du_live_fb_create_handle()/rcar_du_live_fb_create()'s
  parameter lists;
- added my signoff.

 drivers/gpu/drm/rcar-du/rcar_du_drv.c   |    6 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   |   77 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.h   |    3 +
 drivers/gpu/drm/rcar-du/rcar_du_plane.c |   79 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_plane.h |    3 +
 5 files changed, 164 insertions(+), 4 deletions(-)

Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -60,7 +60,8 @@ static const struct rcar_du_device_info
 static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 	.gen = 2,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
-		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
+		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
+		  | RCAR_DU_FEATURE_VSP1_SOURCE,
 	.quirks = RCAR_DU_QUIRK_ALIGN_128B | RCAR_DU_QUIRK_LVDS_LANES,
 	.num_crtcs = 3,
 	.routes = {
@@ -90,7 +91,8 @@ static const struct rcar_du_device_info
 static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 	.gen = 2,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
-		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
+		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
+		  | RCAR_DU_FEATURE_VSP1_SOURCE,
 	.num_crtcs = 2,
 	.routes = {
 		/* R8A779[13] has one RGB output, one LVDS output and one
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_kms.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -166,6 +166,74 @@ int rcar_du_dumb_create(struct drm_file
 	return drm_gem_cma_dumb_create_internal(file, dev, args);
 }
 
+struct rcar_du_live_framebuffer {
+	struct drm_framebuffer fb;
+	struct drm_live_source *src;
+};
+
+#define to_live_fb(fb) container_of(fb, struct rcar_du_live_framebuffer, fb)
+
+struct drm_live_source *rcar_du_live_fb_source(struct drm_framebuffer *fb)
+{
+	return fb->flags & DRM_MODE_FB_LIVE_SOURCE ? to_live_fb(fb)->src : NULL;
+}
+
+static void rcar_du_live_fb_destroy(struct drm_framebuffer *fb)
+{
+	struct rcar_du_live_framebuffer *live_fb = to_live_fb(fb);
+
+	drm_framebuffer_cleanup(fb);
+	kfree(live_fb);
+}
+
+static int rcar_du_live_fb_create_handle(struct drm_framebuffer *fb,
+					 struct drm_file *file_priv,
+					 unsigned int *handle)
+{
+	*handle = 0;
+	return 0;
+}
+
+static struct drm_framebuffer_funcs rcar_du_live_fb_funcs = {
+	.destroy	= rcar_du_live_fb_destroy,
+	.create_handle	= rcar_du_live_fb_create_handle,
+};
+
+static struct drm_framebuffer *
+rcar_du_live_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		       const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct rcar_du_live_framebuffer *fb;
+	struct drm_mode_object *obj;
+	struct drm_live_source *src;
+	int ret;
+
+	obj = drm_mode_object_find(dev, mode_cmd->handles[0],
+				   DRM_MODE_OBJECT_LIVE_SOURCE);
+	if (!obj)
+		return ERR_PTR(-EINVAL);
+
+	src = obj_to_live_source(obj);
+
+	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
+	if (!fb)
+		return ERR_PTR(-ENOMEM);
+
+	drm_helper_mode_fill_fb_struct(dev, &fb->fb, mode_cmd);
+
+	fb->src = src;
+
+	ret = drm_framebuffer_init(dev, &fb->fb, &rcar_du_live_fb_funcs);
+	if (ret) {
+		dev_err(dev->dev, "Failed to initialize framebuffer: %d\n",
+			ret);
+		kfree(fb);
+		return ERR_PTR(ret);
+	}
+
+	return &fb->fb;
+}
+
 static struct drm_framebuffer *
 rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		  const struct drm_mode_fb_cmd2 *mode_cmd)
@@ -177,6 +245,9 @@ rcar_du_fb_create(struct drm_device *dev
 	unsigned int bpp;
 	unsigned int i;
 
+	if (mode_cmd->flags & DRM_MODE_FB_LIVE_SOURCE)
+		return rcar_du_live_fb_create(dev, file_priv, mode_cmd);
+
 	format = rcar_du_format_info(mode_cmd->pixel_format);
 	if (format == NULL) {
 		dev_dbg(dev->dev, "unsupported pixel format %08x\n",
@@ -659,6 +730,12 @@ int rcar_du_modeset_init(struct rcar_du_
 
 	drm_mode_config_reset(dev);
 
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE)) {
+		ret = rcar_du_vsp1_sources_init(rcdu);
+		if (ret < 0)
+			return ret;
+	}
+
 	drm_kms_helper_poll_init(dev);
 
 	if (dev->mode_config.num_connector) {
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_kms.h
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_kms.h
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_kms.h
@@ -18,6 +18,7 @@
 
 struct drm_file;
 struct drm_device;
+struct drm_live_source;
 struct drm_mode_create_dumb;
 struct rcar_du_device;
 
@@ -36,4 +37,6 @@ int rcar_du_modeset_init(struct rcar_du_
 int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args);
 
+struct drm_live_source *rcar_du_live_fb_source(struct drm_framebuffer *fb);
+
 #endif /* __RCAR_DU_KMS_H__ */
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_plane.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -27,6 +27,71 @@
 #include "rcar_du_regs.h"
 
 /* -----------------------------------------------------------------------------
+ * Live Sources
+ */
+
+struct rcar_du_vsp1_source {
+	struct drm_live_source base;
+
+	enum rcar_du_plane_source source;
+};
+
+static inline struct rcar_du_vsp1_source *
+to_rcar_vsp1_source(struct drm_live_source *src)
+{
+	return container_of(src, struct rcar_du_vsp1_source, base);
+}
+
+static const struct drm_live_source_funcs rcar_du_live_source_funcs = {
+	.destroy = drm_live_source_cleanup,
+};
+
+static const uint32_t source_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+int rcar_du_vsp1_sources_init(struct rcar_du_device *rcdu)
+{
+	static const struct {
+		enum rcar_du_plane_source source;
+		unsigned int planes;
+	} sources[] = {
+		{ RCAR_DU_PLANE_VSPD0, BIT(RCAR_DU_NUM_KMS_PLANES - 1) },
+		{ RCAR_DU_PLANE_VSPD1, BIT(RCAR_DU_NUM_KMS_PLANES - 2) |
+				       BIT(2 * RCAR_DU_NUM_KMS_PLANES - 1) },
+	};
+	unsigned int planes_mask;
+	unsigned int num_planes;
+	unsigned int i;
+
+	num_planes = RCAR_DU_NUM_KMS_PLANES * DIV_ROUND_UP(rcdu->num_crtcs, 2);
+	planes_mask = (1 << num_planes) - 1;
+
+	for (i = 0; i < ARRAY_SIZE(sources); ++i) {
+		struct rcar_du_vsp1_source *src;
+		char name[6];
+		int ret;
+
+		src = devm_kzalloc(rcdu->dev, sizeof(*src), GFP_KERNEL);
+		if (src == NULL)
+			return -ENOMEM;
+
+		src->source = sources[i].source;
+
+		sprintf(name, "vspd%u", i);
+		ret = drm_live_source_init(rcdu->ddev, &src->base, name,
+					   sources[i].planes & planes_mask,
+					   source_formats,
+					   ARRAY_SIZE(source_formats),
+					   &rcar_du_live_source_funcs);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
  * Atomic hardware plane allocator
  *
  * The hardware plane allocator is solely based on the atomic plane states
@@ -555,6 +620,7 @@ static int rcar_du_plane_atomic_check(st
 	struct rcar_du_plane_state *rstate = to_rcar_plane_state(state);
 	struct rcar_du_plane *rplane = to_rcar_plane(plane);
 	struct rcar_du_device *rcdu = rplane->group->dev;
+	uint32_t pixel_format;
 
 	if (!state->fb || !state->crtc) {
 		rstate->format = NULL;
@@ -567,13 +633,22 @@ static int rcar_du_plane_atomic_check(st
 		return -EINVAL;
 	}
 
-	rstate->format = rcar_du_format_info(state->fb->format->format);
+	pixel_format = state->fb->format->format;
+	rstate->format = rcar_du_format_info(pixel_format);
 	if (rstate->format == NULL) {
 		dev_dbg(rcdu->dev, "%s: unsupported format %08x\n", __func__,
-			state->fb->format->format);
+			pixel_format);
 		return -EINVAL;
 	}
 
+	if (state->fb->flags & DRM_MODE_FB_LIVE_SOURCE) {
+		struct drm_live_source *src = rcar_du_live_fb_source(state->fb);
+
+		rstate->source = to_rcar_vsp1_source(src)->source;
+	} else {
+		rstate->source = RCAR_DU_PLANE_MEMORY;
+	}
+
 	return 0;
 }
 
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_plane.h
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_plane.h
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_plane.h
@@ -17,6 +17,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 
+struct rcar_du_device;
 struct rcar_du_format_info;
 struct rcar_du_group;
 
@@ -72,6 +73,8 @@ to_rcar_plane_state(struct drm_plane_sta
 int rcar_du_atomic_check_planes(struct drm_device *dev,
 				struct drm_atomic_state *state);
 
+int rcar_du_vsp1_sources_init(struct rcar_du_device *rcdu);
+
 int rcar_du_planes_init(struct rcar_du_group *rgrp);
 
 void __rcar_du_plane_setup(struct rcar_du_group *rgrp,
