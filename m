Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:50358 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731864AbeKVI4P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Nov 2018 03:56:15 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [PATCH v2] drm: rcar-du: Reject modes that fail CRTC timing requirements
Date: Thu, 22 Nov 2018 00:20:12 +0200
Message-Id: <20181121222012.11801-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The hardware requires the HDSR and VDSR registers to be set to 1 or
higher. This translates to a minimum combined horizontal sync and back
porch of 20 pixels and a minimum vertical back porch of 3 lines. Reject
modes that fail those requirements.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Don't use mode->crtc_v* as they are only set after calling .mode_valid()
- Tested the patch on real hardware (which would have prevented the
  buggy v1...)
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 79021d7aa3ce..90dacab67be5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -735,10 +735,22 @@ enum drm_mode_status rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 	struct rcar_du_device *rcdu = rcrtc->group->dev;
 	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
+	unsigned int vbp;
 
 	if (interlaced && !rcar_du_has(rcdu, RCAR_DU_FEATURE_INTERLACED))
 		return MODE_NO_INTERLACE;
 
+	/*
+	 * The hardware requires a minimum combined horizontal sync and back
+	 * porch of 20 pixels and a minimum vertical back porch of 3 lines.
+	 */
+	if (mode->htotal - mode->hsync_start < 20)
+		return MODE_HBLANK_NARROW;
+
+	vbp = (mode->vtotal - mode->vsync_end) / (interlaced ? 2 : 1);
+	if (vbp < 3)
+		return MODE_VBLANK_NARROW;
+
 	return MODE_OK;
 }
 
-- 
Regards,

Laurent Pinchart
