Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46826 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727212AbeHaWVp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 18:21:45 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 2/3] drm: rcar-du: Add pixel format support
Date: Fri, 31 Aug 2018 19:12:58 +0100
Message-Id: <20180831181259.29529-3-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20180831181259.29529-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180831181259.29529-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

This patch supports pixel format of RGB332, ARGB4444, XRGB4444,
BGR888, RGB888, BGRA8888, BGRX8888 and YVYU.
VYUY pixel format is not supported by H/W specification.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---

This patch does not remove existing support for multiplanar YVUY, even
though the hardware does not explicitly provide it, because we support
it through software by swapping the plane buffers.

 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 7c7aff8cdf77..d1bd174ec893 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -124,6 +124,38 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.fourcc = DRM_FORMAT_YVU444,
 		.bpp = 24,
 		.planes = 3,
+	}, {
+		.fourcc = DRM_FORMAT_RGB332,
+		.bpp = 8,
+		.planes = 1,
+	}, {
+		.fourcc = DRM_FORMAT_ARGB4444,
+		.bpp = 16,
+		.planes = 1,
+	}, {
+		.fourcc = DRM_FORMAT_XRGB4444,
+		.bpp = 16,
+		.planes = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGR888,
+		.bpp = 24,
+		.planes = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGB888,
+		.bpp = 24,
+		.planes = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGRA8888,
+		.bpp = 32,
+		.planes = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGRX8888,
+		.bpp = 32,
+		.planes = 1,
+	}, {
+		.fourcc = DRM_FORMAT_YVYU,
+		.bpp = 16,
+		.planes = 1,
 	},
 };
 
-- 
2.17.1
