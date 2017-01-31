Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 31 Jan 2017 15:42:10 +0000
From: Brian Starkey <brian.starkey@arm.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, daniel.vetter@intel.com,
        jani.nikula@linux.intel.com, seanpaul@chromium.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drm: Connect live source to framebuffers
Message-ID: <20170131154210.GD11506@e106950-lin.cambridge.arm.com>
References: <1542778.dcWpka5Jpx@wasted.cogentembedded.com>
 <4381980.kUHGeUXACq@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4381980.kUHGeUXACq@wasted.cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 26, 2017 at 12:36:55AM +0300, Sergei Shtylyov wrote:
>From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
>Introduce a new live source flag for framebuffers. When a framebuffer is
>created with that flag set, a live source is associated with the
>framebuffer instead of buffer objects. The framebuffer can then be used
>with a plane to connect it with the live source.
>
>[Sergei: ported to the modern kernel.]
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
>---
>Changes in version 3:
>- ported the patch to the modern kernel;
>- added my signoff.
>
> drivers/gpu/drm/drm_framebuffer.c |  134 ++++++++++++++++++++++++++++++--------
> include/uapi/drm/drm_mode.h       |    7 +
> 2 files changed, 113 insertions(+), 28 deletions(-)
>
>Index: linux/drivers/gpu/drm/drm_framebuffer.c
>===================================================================
>--- linux.orig/drivers/gpu/drm/drm_framebuffer.c
>+++ linux/drivers/gpu/drm/drm_framebuffer.c
>@@ -126,34 +126,18 @@ int drm_mode_addfb(struct drm_device *de
> 	return 0;
> }
>
>-static int framebuffer_check(const struct drm_mode_fb_cmd2 *r)
>+static int framebuffer_check_buffers(const struct drm_mode_fb_cmd2 *r,
>+				     int hsub, int vsub)
> {
>-	const struct drm_format_info *info;
>-	int i;
>+	int num_planes, i;
>+	unsigned int cpp;
>
>-	info = __drm_format_info(r->pixel_format & ~DRM_FORMAT_BIG_ENDIAN);
>-	if (!info) {
>-		struct drm_format_name_buf format_name;
>-		DRM_DEBUG_KMS("bad framebuffer format %s\n",
>-		              drm_get_format_name(r->pixel_format,
>-		                                  &format_name));
>-		return -EINVAL;
>-	}
>-
>-	if (r->width == 0 || r->width % info->hsub) {
>-		DRM_DEBUG_KMS("bad framebuffer width %u\n", r->width);
>-		return -EINVAL;
>-	}
>-
>-	if (r->height == 0 || r->height % info->vsub) {
>-		DRM_DEBUG_KMS("bad framebuffer height %u\n", r->height);
>-		return -EINVAL;
>-	}
>+ 	num_planes = drm_format_num_planes(r->pixel_format);
>+	cpp = drm_format_plane_cpp(r->pixel_format, 0);

You can pass in the drm_format_info and use it instead of looking it
up again here. That also saves the hsub/vsub arguments.

>
>-	for (i = 0; i < info->num_planes; i++) {
>-		unsigned int width = r->width / (i != 0 ? info->hsub : 1);
>-		unsigned int height = r->height / (i != 0 ? info->vsub : 1);
>-		unsigned int cpp = info->cpp[i];
>+	for (i = 0; i < num_planes; i++) {
>+		unsigned int width = r->width / (i != 0 ? hsub : 1);
>+		unsigned int height = r->height / (i != 0 ? vsub : 1);
>
> 		if (!r->handles[i]) {
> 			DRM_DEBUG_KMS("no buffer object handle for plane %d\n", i);
>@@ -203,7 +187,7 @@ static int framebuffer_check(const struc
> 		}
> 	}
>
>-	for (i = info->num_planes; i < 4; i++) {
>+	for (i = num_planes; i < 4; i++) {
> 		if (r->modifier[i]) {
> 			DRM_DEBUG_KMS("non-zero modifier for unused plane %d\n", i);
> 			return -EINVAL;
>@@ -232,6 +216,99 @@ static int framebuffer_check(const struc
> 	return 0;
> }
>
>+static int framebuffer_check_sources(struct drm_device *dev,
>+				     const struct drm_mode_fb_cmd2 *r)
>+{
>+	struct drm_mode_object *obj;
>+	struct drm_live_source *src;
>+	unsigned int cpp;
>+	unsigned int i;
>+
>+	/*
>+	 * Ensure that userspace has zeroed unused handles, pitches, offsets and
>+	 * modifiers to allow future API extensions.
>+	 */
>+	if (r->offsets[0] || r->modifier[0])
>+		return -EINVAL;
>+
>+	for (i = 1; i < ARRAY_SIZE(r->handles); ++i) {
>+		if (r->handles[i] || r->pitches[i] ||
>+		    r->offsets[i] || r->modifier[i])
>+			return -EINVAL;
>+	}
>+
>+	/* Validate width, height and pitch. */
>+	cpp = drm_format_plane_cpp(r->pixel_format, 0);

Same comment about passing in the drm_format_info instead of looking
it up again.

>+
>+	if ((uint64_t) r->width * cpp > UINT_MAX)
>+		return -ERANGE;
>+
>+	if ((uint64_t) r->height * r->pitches[0] > UINT_MAX)
>+		return -ERANGE;
>+
>+	if (r->pitches[0] != r->width * cpp) {
>+		DRM_DEBUG_KMS("bad pitch %u for plane %d\n", r->pitches[0], i);
>+		return -EINVAL;
>+	}
>+
>+	/*
>+	 * Find the live source and check whether it supports the requested
>+	 * pixel format.
>+	 */

Is it out-of-scope to check with the source subsystem (v4l2) that its
format is configured the same way? And/or inform it of the live-source
format so that it can validate such things.

-Brian
>+
>+	obj = drm_mode_object_find(dev, r->handles[0],
>+				   DRM_MODE_OBJECT_LIVE_SOURCE);
>+	if (!obj) {
>+		DRM_DEBUG_KMS("bad framebuffer source ID %u\n", r->handles[0]);
>+		return -EINVAL;
>+	}
>+
>+	src = obj_to_live_source(obj);
>+
>+	for (i = 0; i < src->format_count; i++) {
>+		if (r->pixel_format == src->format_types[i])
>+			break;
>+	}
>+
>+	if (i == src->format_count) {
>+		DRM_DEBUG_KMS("bad framebuffer pixel format 0x%08x for source %u\n",
>+			      r->pixel_format, r->handles[0]);
>+		return -EINVAL;
>+	}
>+
>+	return 0;
>+}
>+
>+static int framebuffer_check(struct drm_device *dev,
>+			     const struct drm_mode_fb_cmd2 *r)
>+{
>+	const struct drm_format_info *info;
>+
>+	info = __drm_format_info(r->pixel_format & ~DRM_FORMAT_BIG_ENDIAN);
>+	if (!info) {
>+		struct drm_format_name_buf format_name;
>+		DRM_DEBUG_KMS("bad framebuffer format %s\n",
>+		              drm_get_format_name(r->pixel_format,
>+		                                  &format_name));
>+		return -EINVAL;
>+	}
>+
>+	if (r->width == 0 || r->width % info->hsub) {
>+		DRM_DEBUG_KMS("bad framebuffer width %u\n", r->width);
>+		return -EINVAL;
>+	}
>+
>+	if (r->height == 0 || r->height % info->vsub) {
>+		DRM_DEBUG_KMS("bad framebuffer height %u\n", r->height);
>+		return -EINVAL;
>+	}
>+
>+	if (r->flags & DRM_MODE_FB_LIVE_SOURCE)
>+		return framebuffer_check_sources(dev, r);
>+	else
>+		return framebuffer_check_buffers(r, info->hsub, info->vsub);
>+}
>+
> struct drm_framebuffer *
> drm_internal_framebuffer_create(struct drm_device *dev,
> 				const struct drm_mode_fb_cmd2 *r,
>@@ -241,7 +318,8 @@ drm_internal_framebuffer_create(struct d
> 	struct drm_framebuffer *fb;
> 	int ret;
>
>-	if (r->flags & ~(DRM_MODE_FB_INTERLACED | DRM_MODE_FB_MODIFIERS)) {
>+	if (r->flags & ~(DRM_MODE_FB_INTERLACED | DRM_MODE_FB_MODIFIERS |
>+			 DRM_MODE_FB_LIVE_SOURCE)) {
> 		DRM_DEBUG_KMS("bad framebuffer flags 0x%08x\n", r->flags);
> 		return ERR_PTR(-EINVAL);
> 	}
>@@ -263,7 +341,7 @@ drm_internal_framebuffer_create(struct d
> 		return ERR_PTR(-EINVAL);
> 	}
>
>-	ret = framebuffer_check(r);
>+	ret = framebuffer_check(dev, r);
> 	if (ret)
> 		return ERR_PTR(ret);
>
>Index: linux/include/uapi/drm/drm_mode.h
>===================================================================
>--- linux.orig/include/uapi/drm/drm_mode.h
>+++ linux/include/uapi/drm/drm_mode.h
>@@ -405,6 +405,7 @@ struct drm_mode_fb_cmd {
>
> #define DRM_MODE_FB_INTERLACED	(1<<0) /* for interlaced framebuffers */
> #define DRM_MODE_FB_MODIFIERS	(1<<1) /* enables ->modifer[] */
>+#define DRM_MODE_FB_LIVE_SOURCE	(1<<2) /* connected to a live source */
>
> struct drm_mode_fb_cmd2 {
> 	__u32 fb_id;
>@@ -436,6 +437,12 @@ struct drm_mode_fb_cmd2 {
> 	 * Thus all combinations of different data layouts for
> 	 * multi plane formats must be enumerated as separate
> 	 * modifiers.
>+	 *
>+	 * If the DRM_MODE_FB_LIVE_SOURCE flag is set the frame buffer input
>+	 * comes from a live source instead of from memory. The handles[0]
>+	 * field contains the ID of the connected live source object. All other
>+	 * handles and all pitches, offsets and modifiers are then ignored by
>+	 * the kernel and must be set to zero by applications.
> 	 */
> 	__u32 handles[4];
> 	__u32 pitches[4]; /* pitch for each plane */
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
