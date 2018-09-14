Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:36064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728036AbeINSgY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 14:36:24 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Remove packed VYUY support
Date: Fri, 14 Sep 2018 14:21:49 +0100
Message-Id: <20180914132149.26354-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Gen3 VSP used by the DU for display does not support packed the VYUY
pixel format. Gen2 VSP hardware is able to process this format, but it
is not officially supported there either and thus it's output can not be
guaranteed.

Remove the format from the capabilities of the DU driver.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 4480243813ec..4576119e7777 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -126,7 +126,6 @@ static const u32 formats_kms[] = {
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_UYVY,
-	DRM_FORMAT_VYUY,
 	DRM_FORMAT_YUYV,
 	DRM_FORMAT_YVYU,
 	DRM_FORMAT_NV12,
@@ -155,7 +154,6 @@ static const u32 formats_v4l2[] = {
 	V4L2_PIX_FMT_ABGR32,
 	V4L2_PIX_FMT_XBGR32,
 	V4L2_PIX_FMT_UYVY,
-	V4L2_PIX_FMT_VYUY,
 	V4L2_PIX_FMT_YUYV,
 	V4L2_PIX_FMT_YVYU,
 	V4L2_PIX_FMT_NV12M,
-- 
2.17.1
