Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46828 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727405AbeHaWVo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 18:21:44 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 3/3] drm: rcar-du: Update framebuffer pitch and alignment limits for Gen3
Date: Fri, 31 Aug 2018 19:12:59 +0100
Message-Id: <20180831181259.29529-4-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20180831181259.29529-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180831181259.29529-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The framebuffer pitch and alignment constraints reflect the limitations
of the Gen2 DU hardware. On Gen3, the DU has no memory interface and
thus doesn't impose any constraint. The limitations come instead from
the VSP that has a limit of 65535 bytes for the pitch and no alignment
constraint. Update the checks accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 35 ++++++++++++++++++---------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index d1bd174ec893..1d5f49503b93 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -204,7 +204,6 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 	const struct rcar_du_format_info *format;
 	unsigned int max_pitch;
 	unsigned int align;
-	unsigned int bpp;
 	unsigned int i;
 
 	format = rcar_du_format_info(mode_cmd->pixel_format);
@@ -214,20 +213,32 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		return ERR_PTR(-EINVAL);
 	}
 
-	/*
-	 * The pitch and alignment constraints are expressed in pixels on the
-	 * hardware side and in bytes in the DRM API.
-	 */
-	bpp = format->planes == 1 ? format->bpp / 8 : 1;
-	max_pitch =  4096 * bpp;
+	if (rcdu->info->gen < 3) {
+		/*
+		 * On Gen2 the DU limits the pitch to 4095 pixels and requires
+		 * buffers to be aligned to a 16 pixels boundary (or 128 bytes
+		 * on some platforms).
+		 */
+		unsigned int bpp = format->planes == 1 ? format->bpp / 8 : 1;
 
-	if (rcar_du_needs(rcdu, RCAR_DU_QUIRK_ALIGN_128B))
-		align = 128;
-	else
-		align = 16 * bpp;
+		max_pitch = 4095 * bpp;
+
+		if (rcar_du_needs(rcdu, RCAR_DU_QUIRK_ALIGN_128B))
+			align = 128;
+		else
+			align = 16 * bpp;
+	} else {
+		/*
+		 * On Gen3 the memory interface is handled by the VSP that
+		 * limits the pitch to 65535 bytes and has no alignment
+		 * constraint.
+		 */
+		max_pitch = 65535;
+		align = 1;
+	}
 
 	if (mode_cmd->pitches[0] & (align - 1) ||
-	    mode_cmd->pitches[0] >= max_pitch) {
+	    mode_cmd->pitches[0] > max_pitch) {
 		dev_dbg(dev->dev, "invalid pitch value %u\n",
 			mode_cmd->pitches[0]);
 		return ERR_PTR(-EINVAL);
-- 
2.17.1
