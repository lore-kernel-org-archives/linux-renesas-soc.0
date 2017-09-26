Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54385 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967968AbdIZKGX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:23 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 119902150B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:07 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 12/13] v4l: vsp1: Add support for near-lossless compression (FCNL) in the WPF
Date: Tue, 26 Sep 2017 13:06:04 +0300
Message-Id: <20170926100605.2313-15-laurent.pinchart+renesas@ideasonboard.com>
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

When writing frames to memory the VSPI, VSPBC and VSPBD (through their
connnected FCP) can transparently compress them using FCNL. Implement
support for it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1.h      |   1 +
 drivers/media/platform/vsp1/vsp1_drv.c  |   6 +-
 drivers/media/platform/vsp1/vsp1_pipe.c |  57 ++++++------
 drivers/media/platform/vsp1/vsp1_pipe.h |   2 +
 drivers/media/platform/vsp1/vsp1_regs.h |   1 +
 drivers/media/platform/vsp1/vsp1_rwpf.h |   1 +
 drivers/media/platform/vsp1/vsp1_wpf.c  | 157 ++++++++++++++++++++++----------
 7 files changed, 147 insertions(+), 78 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1.h b/drivers/media/platform/vsp1/vsp1.h
index 78ef838416b3..1295accca011 100644
--- a/drivers/media/platform/vsp1/vsp1.h
+++ b/drivers/media/platform/vsp1/vsp1.h
@@ -55,6 +55,7 @@ struct vsp1_uds;
 #define VSP1_HAS_HGO		(1 << 7)
 #define VSP1_HAS_HGT		(1 << 8)
 #define VSP1_HAS_BRS		(1 << 9)
+#define VSP1_HAS_FCNL		(1 << 10)
 
 struct vsp1_device_info {
 	u32 version;
diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index 4253a76cc484..d74a2cd37a52 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -693,7 +693,7 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.gen = 3,
 		.features = VSP1_HAS_CLU | VSP1_HAS_HGO | VSP1_HAS_HGT
 			  | VSP1_HAS_LUT | VSP1_HAS_SRU | VSP1_HAS_WPF_HFLIP
-			  | VSP1_HAS_WPF_VFLIP,
+			  | VSP1_HAS_WPF_VFLIP | VSP1_HAS_FCNL,
 		.rpf_count = 1,
 		.uds_count = 1,
 		.wpf_count = 1,
@@ -702,7 +702,7 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.version = VI6_IP_VERSION_MODEL_VSPBD_GEN3,
 		.model = "VSP2-BD",
 		.gen = 3,
-		.features = VSP1_HAS_BRU | VSP1_HAS_WPF_VFLIP,
+		.features = VSP1_HAS_BRU | VSP1_HAS_WPF_VFLIP | VSP1_HAS_FCNL,
 		.rpf_count = 5,
 		.wpf_count = 1,
 		.num_bru_inputs = 5,
@@ -712,7 +712,7 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.model = "VSP2-BC",
 		.gen = 3,
 		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_HGO
-			  | VSP1_HAS_LUT | VSP1_HAS_WPF_VFLIP,
+			  | VSP1_HAS_LUT | VSP1_HAS_WPF_VFLIP | VSP1_HAS_FCNL,
 		.rpf_count = 5,
 		.wpf_count = 1,
 		.num_bru_inputs = 5,
diff --git a/drivers/media/platform/vsp1/vsp1_pipe.c b/drivers/media/platform/vsp1/vsp1_pipe.c
index 44944ac86d9b..a2414266815c 100644
--- a/drivers/media/platform/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/vsp1/vsp1_pipe.c
@@ -17,6 +17,7 @@
 #include <linux/wait.h>
 
 #include <media/media-entity.h>
+#include <media/rcar-fcp.h>
 #include <media/v4l2-subdev.h>
 
 #include "vsp1.h"
@@ -37,113 +38,113 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
 	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 8, 0, 0 }, false, false, 1, 1, false },
+	  1, { 8, 0, 0 }, false, false, 1, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_ARGB444, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_ARGB_4444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS,
-	  1, { 16, 0, 0 }, false, false, 1, 1, true },
+	  1, { 16, 0, 0 }, false, false, 1, 1, true, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_XRGB444, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_XRGB_4444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS,
-	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+	  1, { 16, 0, 0 }, false, false, 1, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_ARGB555, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_ARGB_1555, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS,
-	  1, { 16, 0, 0 }, false, false, 1, 1, true },
+	  1, { 16, 0, 0 }, false, false, 1, 1, true, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_XRGB555, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_XRGB_1555, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS,
-	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+	  1, { 16, 0, 0 }, false, false, 1, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_RGB565, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS,
-	  1, { 16, 0, 0 }, false, false, 1, 1, false },
+	  1, { 16, 0, 0 }, false, false, 1, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_BGR24, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_BGR_888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 24, 0, 0 }, false, false, 1, 1, false },
+	  1, { 24, 0, 0 }, false, false, 1, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_RGB24, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_RGB_888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 24, 0, 0 }, false, false, 1, 1, false },
+	  1, { 24, 0, 0 }, false, false, 1, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_ABGR32, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
-	  1, { 32, 0, 0 }, false, false, 1, 1, true },
+	  1, { 32, 0, 0 }, false, false, 1, 1, true, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_XBGR32, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
-	  1, { 32, 0, 0 }, false, false, 1, 1, false },
+	  1, { 32, 0, 0 }, false, false, 1, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_ARGB32, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 32, 0, 0 }, false, false, 1, 1, true },
+	  1, { 32, 0, 0 }, false, false, 1, 1, true, RCAR_FCP_FCNL_RGB },
 	{ V4L2_PIX_FMT_XRGB32, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 32, 0, 0 }, false, false, 1, 1, false },
+	  1, { 32, 0, 0 }, false, false, 1, 1, false, RCAR_FCP_FCNL_RGB },
 	{ V4L2_PIX_FMT_HSV24, MEDIA_BUS_FMT_AHSV8888_1X32,
 	  VI6_FMT_RGB_888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 24, 0, 0 }, false, false, 1, 1, false },
+	  1, { 24, 0, 0 }, false, false, 1, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_HSV32, MEDIA_BUS_FMT_AHSV8888_1X32,
 	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 32, 0, 0 }, false, false, 1, 1, false },
+	  1, { 32, 0, 0 }, false, false, 1, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_UYVY, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 16, 0, 0 }, false, false, 2, 1, false },
+	  1, { 16, 0, 0 }, false, false, 2, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_VYUY, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 16, 0, 0 }, false, true, 2, 1, false },
+	  1, { 16, 0, 0 }, false, true, 2, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_YUYV, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 16, 0, 0 }, true, false, 2, 1, false },
+	  1, { 16, 0, 0 }, true, false, 2, 1, false, RCAR_FCP_FCNL_YUV_PACKED },
 	{ V4L2_PIX_FMT_YVYU, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 16, 0, 0 }, true, true, 2, 1, false },
+	  1, { 16, 0, 0 }, true, true, 2, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_NV12M, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_Y_UV_420, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  2, { 8, 16, 0 }, false, false, 2, 2, false },
+	  2, { 8, 16, 0 }, false, false, 2, 2, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_NV21M, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_Y_UV_420, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  2, { 8, 16, 0 }, false, true, 2, 2, false },
+	  2, { 8, 16, 0 }, false, true, 2, 2, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_NV16M, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_Y_UV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  2, { 8, 16, 0 }, false, false, 2, 1, false },
+	  2, { 8, 16, 0 }, false, false, 2, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_NV61M, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_Y_UV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  2, { 8, 16, 0 }, false, true, 2, 1, false },
+	  2, { 8, 16, 0 }, false, true, 2, 1, false, RCAR_FCP_UNCOMPRESSED },
 	{ V4L2_PIX_FMT_YUV420M, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_Y_U_V_420, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  3, { 8, 8, 8 }, false, false, 2, 2, false },
+	  3, { 8, 8, 8 }, false, false, 2, 2, false, RCAR_FCP_FCNL_YUV_PLANAR },
 	{ V4L2_PIX_FMT_YVU420M, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_Y_U_V_420, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  3, { 8, 8, 8 }, false, true, 2, 2, false },
+	  3, { 8, 8, 8 }, false, true, 2, 2, false, RCAR_FCP_FCNL_YUV_PLANAR },
 	{ V4L2_PIX_FMT_YUV422M, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_Y_U_V_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  3, { 8, 8, 8 }, false, false, 2, 1, false },
+	  3, { 8, 8, 8 }, false, false, 2, 1, false, RCAR_FCP_FCNL_YUV_PLANAR },
 	{ V4L2_PIX_FMT_YVU422M, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_Y_U_V_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  3, { 8, 8, 8 }, false, true, 2, 1, false },
+	  3, { 8, 8, 8 }, false, true, 2, 1, false, RCAR_FCP_FCNL_YUV_PLANAR },
 	{ V4L2_PIX_FMT_YUV444M, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_Y_U_V_444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  3, { 8, 8, 8 }, false, false, 1, 1, false },
+	  3, { 8, 8, 8 }, false, false, 1, 1, false, RCAR_FCP_FCNL_YUV_PLANAR },
 	{ V4L2_PIX_FMT_YVU444M, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_Y_U_V_444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  3, { 8, 8, 8 }, false, true, 1, 1, false },
+	  3, { 8, 8, 8 }, false, true, 1, 1, false, RCAR_FCP_FCNL_YUV_PLANAR },
 };
 
 /**
diff --git a/drivers/media/platform/vsp1/vsp1_pipe.h b/drivers/media/platform/vsp1/vsp1_pipe.h
index dfff9b5685fe..2665579a70d3 100644
--- a/drivers/media/platform/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/vsp1/vsp1_pipe.h
@@ -36,6 +36,7 @@ struct vsp1_rwpf;
  * @hsub: horizontal subsampling factor
  * @vsub: vertical subsampling factor
  * @alpha: has an alpha channel
+ * @fcnl: the FCNL compression method, UNCOMPRESSED if not supported
  */
 struct vsp1_format_info {
 	u32 fourcc;
@@ -49,6 +50,7 @@ struct vsp1_format_info {
 	unsigned int hsub;
 	unsigned int vsub;
 	bool alpha;
+	unsigned int fcnl;
 };
 
 enum vsp1_pipeline_state {
diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
index 26c4ffad2f46..4fd01d6ae813 100644
--- a/drivers/media/platform/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/vsp1/vsp1_regs.h
@@ -260,6 +260,7 @@
 #define VI6_WPF_OUTFMT_PDV_MASK		(0xff << 24)
 #define VI6_WPF_OUTFMT_PDV_SHIFT	24
 #define VI6_WPF_OUTFMT_PXA		(1 << 23)
+#define VI6_WPF_OUTFMT_FCNL		(1 << 20)
 #define VI6_WPF_OUTFMT_ROT		(1 << 18)
 #define VI6_WPF_OUTFMT_HFLP		(1 << 17)
 #define VI6_WPF_OUTFMT_FLP		(1 << 16)
diff --git a/drivers/media/platform/vsp1/vsp1_rwpf.h b/drivers/media/platform/vsp1/vsp1_rwpf.h
index 58215a7ab631..c6cbb731c036 100644
--- a/drivers/media/platform/vsp1/vsp1_rwpf.h
+++ b/drivers/media/platform/vsp1/vsp1_rwpf.h
@@ -50,6 +50,7 @@ struct vsp1_rwpf {
 	unsigned int bru_input;
 
 	unsigned int alpha;
+	bool fcnl;
 
 	u32 mult_alpha;
 	u32 outfmt;
diff --git a/drivers/media/platform/vsp1/vsp1_wpf.c b/drivers/media/platform/vsp1/vsp1_wpf.c
index f7f3b4b2c2de..fafb11ceaf3f 100644
--- a/drivers/media/platform/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/vsp1/vsp1_wpf.c
@@ -40,23 +40,53 @@ static inline void vsp1_wpf_write(struct vsp1_rwpf *wpf,
  * Controls
  */
 
+#define V4L2_CID_VSP1_FCNL			(V4L2_CID_USER_BASE | 0x1001)
+
 enum wpf_flip_ctrl {
 	WPF_CTRL_VFLIP = 0,
 	WPF_CTRL_HFLIP = 1,
 };
 
-static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf, unsigned int rotation)
+static int vsp1_wpf_set_compression(struct vsp1_rwpf *wpf, bool fcnl)
+{
+	struct vsp1_video *video = wpf->video;
+	int ret = 0;
+
+	if (fcnl == wpf->fcnl)
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
+	mutex_lock(&wpf->entity.lock);
+	wpf->fcnl = fcnl;
+	mutex_unlock(&wpf->entity.lock);
+
+done:
+	mutex_unlock(&video->lock);
+	return ret;
+}
+
+static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf)
 {
 	struct vsp1_video *video = wpf->video;
 	struct v4l2_mbus_framefmt *sink_format;
 	struct v4l2_mbus_framefmt *source_format;
+	unsigned int rotation;
 	bool rotate;
-	int ret = 0;
+	u32 flip = 0;
 
 	/*
-	 * Only consider the 0°/180° from/to 90°/270° modifications, the rest
-	 * is taken care of by the flipping configuration.
+	 * Update the rotation. Only consider the 0°/180° from/to 90°/270°
+	 * modifications, the rest is taken care of by the flipping
+	 * configuration.
 	 */
+	rotation = wpf->flip.ctrls.rotate ? wpf->flip.ctrls.rotate->val : 0;
 	rotate = rotation == 90 || rotation == 270;
 	if (rotate == wpf->flip.rotate)
 		return 0;
@@ -65,8 +95,8 @@ static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf, unsigned int rotation)
 	mutex_lock(&video->lock);
 
 	if (vb2_is_busy(&video->queue)) {
-		ret = -EBUSY;
-		goto done;
+		mutex_unlock(&video->lock);
+		return -EBUSY;
 	}
 
 	sink_format = vsp1_entity_get_pad_format(&wpf->entity,
@@ -89,25 +119,7 @@ static int vsp1_wpf_set_rotation(struct vsp1_rwpf *wpf, unsigned int rotation)
 	wpf->flip.rotate = rotate;
 
 	mutex_unlock(&wpf->entity.lock);
-
-done:
 	mutex_unlock(&video->lock);
-	return ret;
-}
-
-static int vsp1_wpf_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct vsp1_rwpf *wpf =
-		container_of(ctrl->handler, struct vsp1_rwpf, ctrls);
-	unsigned int rotation;
-	u32 flip = 0;
-	int ret;
-
-	/* Update the rotation. */
-	rotation = wpf->flip.ctrls.rotate ? wpf->flip.ctrls.rotate->val : 0;
-	ret = vsp1_wpf_set_rotation(wpf, rotation);
-	if (ret < 0)
-		return ret;
 
 	/*
 	 * Compute the flip value resulting from all three controls, with
@@ -131,46 +143,86 @@ static int vsp1_wpf_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int vsp1_wpf_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vsp1_rwpf *wpf =
+		container_of(ctrl->handler, struct vsp1_rwpf, ctrls);
+
+	/*
+	 * TODO: Handle the interactions between rotation and FCNL, when FCNL
+	 * and rotation are both enabled the output format is restricted to
+	 * ARGB888.
+	 */
+	switch (ctrl->id) {
+	case V4L2_CID_VSP1_FCNL:
+		return vsp1_wpf_set_compression(wpf, ctrl->val);
+
+	case V4L2_CID_VFLIP:
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_ROTATE:
+	default:
+		return vsp1_wpf_set_rotation(wpf);
+	}
+}
+
 static const struct v4l2_ctrl_ops vsp1_wpf_ctrl_ops = {
 	.s_ctrl = vsp1_wpf_s_ctrl,
 };
 
+static const struct v4l2_ctrl_config vsp1_wpf_fcnl_ctrl = {
+	.ops = &vsp1_wpf_ctrl_ops,
+	.id = V4L2_CID_VSP1_FCNL,
+	.name = "Near-Lossless Compression",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.min = 0,
+	.max = 1,
+	.step = 1,
+	.def = 0,
+};
+
 static int wpf_init_controls(struct vsp1_rwpf *wpf)
 {
 	struct vsp1_device *vsp1 = wpf->entity.vsp1;
-	unsigned int num_flip_ctrls;
+	unsigned int num_ctrls = 0;
+	bool vflip = false;
+	bool hflip = false;
 
 	spin_lock_init(&wpf->flip.lock);
 
-	if (wpf->entity.index != 0) {
+	if (wpf->entity.index == 0) {
 		/* Only WPF0 supports flipping. */
-		num_flip_ctrls = 0;
-	} else if (vsp1->info->features & VSP1_HAS_WPF_HFLIP) {
-		/*
-		 * When horizontal flip is supported the WPF implements three
-		 * controls (horizontal flip, vertical flip and rotation).
-		 */
-		num_flip_ctrls = 3;
-	} else if (vsp1->info->features & VSP1_HAS_WPF_VFLIP) {
-		/*
-		 * When only vertical flip is supported the WPF implements a
-		 * single control (vertical flip).
-		 */
-		num_flip_ctrls = 1;
-	} else {
-		/* Otherwise flipping is not supported. */
-		num_flip_ctrls = 0;
+		if (vsp1->info->features & VSP1_HAS_WPF_HFLIP) {
+			/*
+			 * When horizontal flip is supported the WPF implements
+			 * three controls (horizontal flip, vertical flip and
+			 * rotation).
+			 */
+			vflip = true;
+			hflip = true;
+			num_ctrls += 3;
+		} else if (vsp1->info->features & VSP1_HAS_WPF_VFLIP) {
+			/*
+			 * When only vertical flip is supported the WPF
+			 * implements a single control (vertical flip).
+			 */
+			vflip = true;
+			hflip = false;
+			num_ctrls += 1;
+		}
 	}
 
-	vsp1_rwpf_init_ctrls(wpf, num_flip_ctrls);
+	if (vsp1->info->features & VSP1_HAS_FCNL)
+		num_ctrls++;
+
+	vsp1_rwpf_init_ctrls(wpf, num_ctrls);
 
-	if (num_flip_ctrls >= 1) {
+	if (vflip) {
 		wpf->flip.ctrls.vflip =
 			v4l2_ctrl_new_std(&wpf->ctrls, &vsp1_wpf_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
 	}
 
-	if (num_flip_ctrls == 3) {
+	if (hflip) {
 		wpf->flip.ctrls.hflip =
 			v4l2_ctrl_new_std(&wpf->ctrls, &vsp1_wpf_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
@@ -180,6 +232,9 @@ static int wpf_init_controls(struct vsp1_rwpf *wpf)
 		v4l2_ctrl_cluster(3, &wpf->flip.ctrls.vflip);
 	}
 
+	if (vsp1->info->features & VSP1_HAS_FCNL)
+		v4l2_ctrl_new_custom(&wpf->ctrls, &vsp1_wpf_fcnl_ctrl, NULL);
+
 	if (wpf->ctrls.error) {
 		dev_err(vsp1->dev, "wpf%u: failed to initialize controls\n",
 			wpf->entity.index);
@@ -402,6 +457,9 @@ static void wpf_configure(struct vsp1_entity *entity,
 		if (wpf->flip.rotate)
 			outfmt |= VI6_WPF_OUTFMT_ROT;
 
+		if (wpf->fcnl && fmtinfo->fcnl)
+			outfmt |= VI6_WPF_OUTFMT_FCNL;
+
 		if (fmtinfo->alpha)
 			outfmt |= VI6_WPF_OUTFMT_PXA;
 		if (fmtinfo->swap_yc)
@@ -409,14 +467,19 @@ static void wpf_configure(struct vsp1_entity *entity,
 		if (fmtinfo->swap_uv)
 			outfmt |= VI6_WPF_OUTFMT_SPUVS;
 
-		/* Destination stride and byte swapping. */
+		/*
+		 * Destination stride and byte swapping. When FCNL is enabled
+		 * data swapping must be hardcoded to VI6_RPF_DSWAP_P_LLS.
+		 */
 		vsp1_wpf_write(wpf, dl, VI6_WPF_DSTM_STRIDE_Y,
 			       format->plane_fmt[0].bytesperline);
 		if (format->num_planes > 1)
 			vsp1_wpf_write(wpf, dl, VI6_WPF_DSTM_STRIDE_C,
 				       format->plane_fmt[1].bytesperline);
 
-		vsp1_wpf_write(wpf, dl, VI6_WPF_DSWAP, fmtinfo->swap);
+		vsp1_wpf_write(wpf, dl, VI6_WPF_DSWAP,
+			       wpf->fcnl && fmtinfo->fcnl ?
+			       VI6_RPF_DSWAP_P_LLS : fmtinfo->swap);
 
 		if (vsp1->info->features & VSP1_HAS_WPF_HFLIP &&
 		    wpf->entity.index == 0)
-- 
Regards,

Laurent Pinchart
