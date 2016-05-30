Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34317 "EHLO
	mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161220AbcE3QBB (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:01:01 -0400
Received: by mail-lf0-f66.google.com with SMTP id 65so14284639lfq.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:01:00 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC 12/21] drm: rcar-du: Add pixel format support
Date: Mon, 30 May 2016 18:00:11 +0200
Message-Id: <1464624020-27709-13-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

This patch supports pixel format of RGB332, ARGB4444, XRGB4444,
BGR888, RGB888, BGRA8888, BGRX8888, YVYU and NV61.
VYUY format is not supported by H/W.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 58 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_kms.h |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 49 +++++++++++++++++++++++++++++
 3 files changed, 106 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index baac8c9..a8c59c3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -95,6 +95,40 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.planes = 2,
 		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
 		.edf = PnDDCR4_EDF_NONE,
+	}, {
+		.fourcc = DRM_FORMAT_NV61,
+		.bpp = 16,
+		.planes = 2,
+		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
+		.edf = PnDDCR4_EDF_NONE,
+	},
+};
+
+static const struct rcar_du_format_info rcar_vsp_format_infos[] = {
+	{
+		.fourcc = DRM_FORMAT_RGB332,
+		.bpp = 8,
+	}, {
+		.fourcc = DRM_FORMAT_ARGB4444,
+		.bpp = 16,
+	}, {
+		.fourcc = DRM_FORMAT_XRGB4444,
+		.bpp = 16,
+	}, {
+		.fourcc = DRM_FORMAT_BGR888,
+		.bpp = 24,
+	}, {
+		.fourcc = DRM_FORMAT_RGB888,
+		.bpp = 24,
+	}, {
+		.fourcc = DRM_FORMAT_BGRA8888,
+		.bpp = 32,
+	}, {
+		.fourcc = DRM_FORMAT_BGRX8888,
+		.bpp = 32,
+	}, {
+		.fourcc = DRM_FORMAT_YVYU,
+		.bpp = 16,
 	},
 	/* The following formats are not supported on Gen2 and thus have no
 	 * associated .pnmr or .edf settings.
@@ -142,6 +176,18 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
 	return NULL;
 }
 
+const struct rcar_du_format_info *rcar_vsp_format_info(u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rcar_vsp_format_infos); ++i) {
+		if (rcar_vsp_format_infos[i].fourcc == fourcc)
+			return &rcar_vsp_format_infos[i];
+	}
+
+	return NULL;
+}
+
 /* -----------------------------------------------------------------------------
  * Frame buffer
  */
@@ -178,6 +224,15 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 	unsigned int i;
 
 	format = rcar_du_format_info(mode_cmd->pixel_format);
+
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE) &&
+		(format == NULL)) {
+		format = rcar_vsp_format_info(mode_cmd->pixel_format);
+	}
+
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE) && (format != NULL))
+		goto done;
+
 	if (format == NULL) {
 		dev_dbg(dev->dev, "unsupported pixel format %08x\n",
 			mode_cmd->pixel_format);
@@ -210,7 +265,7 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 			return ERR_PTR(-EINVAL);
 		}
 	}
-
+done:
 	return drm_fb_cma_create(dev, file_priv, mode_cmd);
 }
 
@@ -278,7 +333,6 @@ static void rcar_du_atomic_work(struct work_struct *work)
 {
 	struct rcar_du_commit *commit =
 		container_of(work, struct rcar_du_commit, work);
-
 	rcar_du_atomic_complete(commit);
 }
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
index 07951d5..10eb51a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
@@ -30,6 +30,7 @@ struct rcar_du_format_info {
 };
 
 const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc);
+const struct rcar_du_format_info *rcar_vsp_format_info(u32 fourcc);
 
 int rcar_du_modeset_init(struct rcar_du_device *rcdu);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 89176e6..94e9181 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -143,6 +143,28 @@ static const u32 formats_v4l2[] = {
 	V4L2_PIX_FMT_YVU444M,
 };
 
+static const u32 formats_xlate[][2] = {
+	{ DRM_FORMAT_RGB332, V4L2_PIX_FMT_RGB332 },
+	{ DRM_FORMAT_ARGB4444, V4L2_PIX_FMT_ARGB444 },
+	{ DRM_FORMAT_XRGB4444, V4L2_PIX_FMT_XRGB444 },
+	{ DRM_FORMAT_ARGB1555, V4L2_PIX_FMT_ARGB555 },
+	{ DRM_FORMAT_XRGB1555, V4L2_PIX_FMT_XRGB555 },
+	{ DRM_FORMAT_RGB565, V4L2_PIX_FMT_RGB565 },
+	{ DRM_FORMAT_BGR888, V4L2_PIX_FMT_RGB24 },
+	{ DRM_FORMAT_RGB888, V4L2_PIX_FMT_BGR24 },
+	{ DRM_FORMAT_BGRA8888, V4L2_PIX_FMT_ARGB32 },
+	{ DRM_FORMAT_BGRX8888, V4L2_PIX_FMT_XRGB32 },
+	{ DRM_FORMAT_ARGB8888, V4L2_PIX_FMT_ABGR32 },
+	{ DRM_FORMAT_XRGB8888, V4L2_PIX_FMT_XBGR32 },
+	{ DRM_FORMAT_UYVY, V4L2_PIX_FMT_UYVY },
+	{ DRM_FORMAT_YUYV, V4L2_PIX_FMT_YUYV },
+	{ DRM_FORMAT_YVYU, V4L2_PIX_FMT_YVYU },
+	{ DRM_FORMAT_NV12, V4L2_PIX_FMT_NV12M },
+	{ DRM_FORMAT_NV21, V4L2_PIX_FMT_NV21M },
+	{ DRM_FORMAT_NV16, V4L2_PIX_FMT_NV16M },
+	{ DRM_FORMAT_NV61, V4L2_PIX_FMT_NV61M },
+};
+
 static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 {
 	struct rcar_du_vsp_plane_state *state =
@@ -202,6 +224,11 @@ static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
 	}
 
 	rstate->format = rcar_du_format_info(state->fb->pixel_format);
+
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE) &&
+			 (rstate->format == NULL))
+		rstate->format = rcar_vsp_format_info(state->fb->pixel_format);
+
 	if (rstate->format == NULL) {
 		dev_dbg(rcdu->dev, "%s: unsupported format %08x\n", __func__,
 			state->fb->pixel_format);
@@ -320,6 +347,28 @@ static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
 	.atomic_get_property = rcar_du_vsp_plane_atomic_get_property,
 };
 
+static const uint32_t formats[] = {
+	DRM_FORMAT_RGB332,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+};
+
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp)
 {
 	struct rcar_du_device *rcdu = vsp->dev;
-- 
2.7.4
