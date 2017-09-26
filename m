Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54386 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965482AbdIZKGX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:23 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 44CFE2150C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:07 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 13/13] v4l: vsp1: Add support for near-lossless compression (FCNL) in the RPF
Date: Tue, 26 Sep 2017 13:06:05 +0300
Message-Id: <20170926100605.2313-16-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Visual near-lossless compression is a technique used to lower the memory
bandwidth consumption by transparently (de)compressing frames when
reading them from or writing them to memory.

When reading frames from memory the DDR controller can transparently
decompress them using FCNL. Implement support for it on the read side of
the VSP.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_rwpf.c  |  50 +++++++++++
 drivers/media/platform/vsp1/vsp1_video.c |  22 ++++-
 drivers/media/platform/vsp1/vsp1_wpf.c   | 150 +++++++++++--------------------
 3 files changed, 121 insertions(+), 101 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_rwpf.c b/drivers/media/platform/vsp1/vsp1_rwpf.c
index cfd8f1904fa6..e71399761eed 100644
--- a/drivers/media/platform/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/vsp1/vsp1_rwpf.c
@@ -257,12 +257,42 @@ const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
  * Controls
  */
 
+#define V4L2_CID_VSP1_FCNL			(V4L2_CID_USER_BASE | 0x1001)
+
+static int vsp1_rwpf_set_compression(struct vsp1_rwpf *rwpf, bool fcnl)
+{
+	struct vsp1_video *video = rwpf->video;
+	int ret = 0;
+
+	if (fcnl == rwpf->fcnl)
+		return 0;
+
+	/* FCNL can't be changed when buffers are allocated. */
+	mutex_lock(&video->lock);
+
+	if (vb2_is_busy(&video->queue)) {
+		ret = -EBUSY;
+		goto done;
+	}
+
+	mutex_lock(&rwpf->entity.lock);
+	rwpf->fcnl = fcnl;
+	mutex_unlock(&rwpf->entity.lock);
+
+done:
+	mutex_unlock(&video->lock);
+	return ret;
+}
+
 static int vsp1_rwpf_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct vsp1_rwpf *rwpf =
 		container_of(ctrl->handler, struct vsp1_rwpf, ctrls);
 
 	switch (ctrl->id) {
+	case V4L2_CID_VSP1_FCNL:
+		return vsp1_rwpf_set_compression(rwpf, ctrl->val);
+
 	case V4L2_CID_ALPHA_COMPONENT:
 		rwpf->alpha = ctrl->val;
 		break;
@@ -275,12 +305,32 @@ static const struct v4l2_ctrl_ops vsp1_rwpf_ctrl_ops = {
 	.s_ctrl = vsp1_rwpf_s_ctrl,
 };
 
+static const struct v4l2_ctrl_config vsp1_rwpf_fcnl_ctrl = {
+	.ops = &vsp1_rwpf_ctrl_ops,
+	.id = V4L2_CID_VSP1_FCNL,
+	.name = "Near-Lossless Compression",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.min = 0,
+	.max = 1,
+	.step = 1,
+	.def = 0,
+};
+
 int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols)
 {
+	struct vsp1_device *vsp1 = rwpf->entity.vsp1;
+
+	if (vsp1->info->features & VSP1_HAS_FCNL)
+		ncontrols++;
+
 	v4l2_ctrl_handler_init(&rwpf->ctrls, ncontrols + 1);
+
 	v4l2_ctrl_new_std(&rwpf->ctrls, &vsp1_rwpf_ctrl_ops,
 			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
 
+	if (vsp1->info->features & VSP1_HAS_FCNL)
+		v4l2_ctrl_new_custom(&rwpf->ctrls, &vsp1_rwpf_fcnl_ctrl, NULL);
+
 	rwpf->entity.subdev.ctrl_handler = &rwpf->ctrls;
 
 	return rwpf->ctrls.error;
diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
index c2d3b8f0f487..b188780dfc69 100644
--- a/drivers/media/platform/vsp1/vsp1_video.c
+++ b/drivers/media/platform/vsp1/vsp1_video.c
@@ -20,6 +20,7 @@
 #include <linux/wait.h>
 
 #include <media/media-entity.h>
+#include <media/rcar-fcp.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-fh.h>
 #include <media/v4l2-ioctl.h>
@@ -728,7 +729,10 @@ vsp1_video_queue_setup(struct vb2_queue *vq,
 		       unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct vsp1_video *video = vb2_get_drv_priv(vq);
+	struct vsp1_device *vsp1 = video->vsp1;
 	const struct v4l2_pix_format_mplane *format = &video->rwpf->format;
+	const struct vsp1_format_info *fmtinfo = video->rwpf->fmtinfo;
+	struct device *alloc_dev;
 	unsigned int i;
 
 	if (*nplanes) {
@@ -741,10 +745,26 @@ vsp1_video_queue_setup(struct vb2_queue *vq,
 		return 0;
 	}
 
+	/*
+	 * Select the appropriate allocation device. Perform FCNL decompression
+	 * on the RPF if requested by the user, supported by the format, and
+	 * supported by the FCP.
+	 */
+	if (video->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
+	    video->rwpf->fcnl && fmtinfo->fcnl) {
+		alloc_dev = rcar_fcp_get_bus_master(vsp1->fcp, fmtinfo->fcnl);
+		if (!alloc_dev)
+			return -EINVAL;
+	} else {
+		alloc_dev = video->vsp1->bus_master;
+	}
+
 	*nplanes = format->num_planes;
 
-	for (i = 0; i < format->num_planes; ++i)
+	for (i = 0; i < format->num_planes; ++i) {
 		sizes[i] = format->plane_fmt[i].sizeimage;
+		alloc_devs[i] = alloc_dev;
+	}
 
 	return 0;
 }
diff --git a/drivers/media/platform/vsp1/vsp1_wpf.c b/drivers/media/platform/vsp1/vsp1_wpf.c
index fafb11ceaf3f..c0e50eb7eca2 100644
--- a/drivers/media/platform/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/vsp1/vsp1_wpf.c
@@ -40,53 +40,23 @@ static inline void vsp1_wpf_write(struct vsp1_rwpf *wpf,
  * Controls
  */
 
-#define V4L2_CID_VSP1_FCNL			(V4L2_CID_USER_BASE | 0x1001)
-
 enum wpf_flip_ctrl {
 	WPF_CTRL_VFLIP = 0,
 	WPF_CTRL_HFLIP = 1,
 };
 
-static int vsp1_wpf_set_compression(struct vsp1_rwpf *wpf, bool fcnl)
-{
-	struct vsp1_video *video = wpf->video;
-	int ret = 0;
-
-	if (fcnl == wpf->fcnl)
-		return 0;
-
-	/* FCNL can't be changed when buffers are allocated. */
-	mutex_lock(&video->lock);
-
-	if (vb2_is_busy(&video->queue)) {
-		ret = -EBUSY;
-		goto done;
-	}
-
-	mutex_lock(&wpf->entity.lock);
-	wpf->fcnl = fcnl;
-	mutex_unlock(&wpf->entity.lock);
-
-done:
-	mutex_unlock(&video->lock);
-	return ret;
-}
-
-static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf)
+static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf, unsigned int rotation)
 {
 	struct vsp1_video *video = wpf->video;
 	struct v4l2_mbus_framefmt *sink_format;
 	struct v4l2_mbus_framefmt *source_format;
-	unsigned int rotation;
 	bool rotate;
-	u32 flip = 0;
+	int ret = 0;
 
 	/*
-	 * Update the rotation. Only consider the 0°/180° from/to 90°/270°
-	 * modifications, the rest is taken care of by the flipping
-	 * configuration.
+	 * Only consider the 0°/180° from/to 90°/270° modifications, the rest
+	 * is taken care of by the flipping configuration.
 	 */
-	rotation = wpf->flip.ctrls.rotate ? wpf->flip.ctrls.rotate->val : 0;
 	rotate = rotation == 90 || rotation == 270;
 	if (rotate == wpf->flip.rotate)
 		return 0;
@@ -95,8 +65,8 @@ static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf)
 	mutex_lock(&video->lock);
 
 	if (vb2_is_busy(&video->queue)) {
-		mutex_unlock(&video->lock);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto done;
 	}
 
 	sink_format = vsp1_entity_get_pad_format(&wpf->entity,
@@ -119,7 +89,25 @@ static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf)
 	wpf->flip.rotate = rotate;
 
 	mutex_unlock(&wpf->entity.lock);
+
+done:
 	mutex_unlock(&video->lock);
+	return ret;
+}
+
+static int vsp1_wpf_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vsp1_rwpf *wpf =
+		container_of(ctrl->handler, struct vsp1_rwpf, ctrls);
+	unsigned int rotation;
+	u32 flip = 0;
+	int ret;
+
+	/* Update the rotation. */
+	rotation = wpf->flip.ctrls.rotate ? wpf->flip.ctrls.rotate->val : 0;
+	ret = vsp1_wpf_set_rotation(wpf, rotation);
+	if (ret < 0)
+		return ret;
 
 	/*
 	 * Compute the flip value resulting from all three controls, with
@@ -143,86 +131,46 @@ static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf)
 	return 0;
 }
 
-static int vsp1_wpf_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct vsp1_rwpf *wpf =
-		container_of(ctrl->handler, struct vsp1_rwpf, ctrls);
-
-	/*
-	 * TODO: Handle the interactions between rotation and FCNL, when FCNL
-	 * and rotation are both enabled the output format is restricted to
-	 * ARGB888.
-	 */
-	switch (ctrl->id) {
-	case V4L2_CID_VSP1_FCNL:
-		return vsp1_wpf_set_compression(wpf, ctrl->val);
-
-	case V4L2_CID_VFLIP:
-	case V4L2_CID_HFLIP:
-	case V4L2_CID_ROTATE:
-	default:
-		return vsp1_wpf_set_rotation(wpf);
-	}
-}
-
 static const struct v4l2_ctrl_ops vsp1_wpf_ctrl_ops = {
 	.s_ctrl = vsp1_wpf_s_ctrl,
 };
 
-static const struct v4l2_ctrl_config vsp1_wpf_fcnl_ctrl = {
-	.ops = &vsp1_wpf_ctrl_ops,
-	.id = V4L2_CID_VSP1_FCNL,
-	.name = "Near-Lossless Compression",
-	.type = V4L2_CTRL_TYPE_BOOLEAN,
-	.min = 0,
-	.max = 1,
-	.step = 1,
-	.def = 0,
-};
-
 static int wpf_init_controls(struct vsp1_rwpf *wpf)
 {
 	struct vsp1_device *vsp1 = wpf->entity.vsp1;
-	unsigned int num_ctrls = 0;
-	bool vflip = false;
-	bool hflip = false;
+	unsigned int num_flip_ctrls;
 
 	spin_lock_init(&wpf->flip.lock);
 
-	if (wpf->entity.index == 0) {
+	if (wpf->entity.index != 0) {
 		/* Only WPF0 supports flipping. */
-		if (vsp1->info->features & VSP1_HAS_WPF_HFLIP) {
-			/*
-			 * When horizontal flip is supported the WPF implements
-			 * three controls (horizontal flip, vertical flip and
-			 * rotation).
-			 */
-			vflip = true;
-			hflip = true;
-			num_ctrls += 3;
-		} else if (vsp1->info->features & VSP1_HAS_WPF_VFLIP) {
-			/*
-			 * When only vertical flip is supported the WPF
-			 * implements a single control (vertical flip).
-			 */
-			vflip = true;
-			hflip = false;
-			num_ctrls += 1;
-		}
+		num_flip_ctrls = 0;
+	} else if (vsp1->info->features & VSP1_HAS_WPF_HFLIP) {
+		/*
+		 * When horizontal flip is supported the WPF implements three
+		 * controls (horizontal flip, vertical flip and rotation).
+		 */
+		num_flip_ctrls = 3;
+	} else if (vsp1->info->features & VSP1_HAS_WPF_VFLIP) {
+		/*
+		 * When only vertical flip is supported the WPF implements a
+		 * single control (vertical flip).
+		 */
+		num_flip_ctrls = 1;
+	} else {
+		/* Otherwise flipping is not supported. */
+		num_flip_ctrls = 0;
 	}
 
-	if (vsp1->info->features & VSP1_HAS_FCNL)
-		num_ctrls++;
+	vsp1_rwpf_init_ctrls(wpf, num_flip_ctrls);
 
-	vsp1_rwpf_init_ctrls(wpf, num_ctrls);
-
-	if (vflip) {
+	if (num_flip_ctrls >= 1) {
 		wpf->flip.ctrls.vflip =
 			v4l2_ctrl_new_std(&wpf->ctrls, &vsp1_wpf_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
 	}
 
-	if (hflip) {
+	if (num_flip_ctrls == 3) {
 		wpf->flip.ctrls.hflip =
 			v4l2_ctrl_new_std(&wpf->ctrls, &vsp1_wpf_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
@@ -232,9 +180,6 @@ static int wpf_init_controls(struct vsp1_rwpf *wpf)
 		v4l2_ctrl_cluster(3, &wpf->flip.ctrls.vflip);
 	}
 
-	if (vsp1->info->features & VSP1_HAS_FCNL)
-		v4l2_ctrl_new_custom(&wpf->ctrls, &vsp1_wpf_fcnl_ctrl, NULL);
-
 	if (wpf->ctrls.error) {
 		dev_err(vsp1->dev, "wpf%u: failed to initialize controls\n",
 			wpf->entity.index);
@@ -454,6 +399,11 @@ static void wpf_configure(struct vsp1_entity *entity,
 
 		outfmt = fmtinfo->hwfmt << VI6_WPF_OUTFMT_WRFMT_SHIFT;
 
+		/*
+		 * TODO: Handle the interactions between rotation and FCNL, when
+		 * FCNL and rotation are both enabled the output format is
+		 * restricted to ARGB888.
+		 */
 		if (wpf->flip.rotate)
 			outfmt |= VI6_WPF_OUTFMT_ROT;
 
-- 
Regards,

Laurent Pinchart
