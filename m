Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:47956 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbeKTOC4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 09:02:56 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [PATCH] drm: rcar-du: Reject modes that fail CRTC timing requirements
Date: Tue, 20 Nov 2018 05:36:04 +0200
Message-Id: <20181120033604.11109-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The hardware requires the HDSR and VDSR registers to be set to 1 or
higher. This translates to a minimum combined horizontal sync and back
porch of 20 pixels and a minimum vertical back porch of 3 lines. Reject
modes that fail those requirements.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 79021d7aa3ce..9d425894e000 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -739,6 +739,15 @@ enum drm_mode_status rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
 	if (interlaced && !rcar_du_has(rcdu, RCAR_DU_FEATURE_INTERLACED))
 		return MODE_NO_INTERLACE;
 
+	/*
+	 * The hardware requires a minimum combined horizontal sync and back
+	 * porch of 20 pixels and a minimum vertical back porch of 3 lines.
+	 */
+	if (mode->htotal - mode->hsync_start < 20)
+		return MODE_HBLANK_NARROW;
+	if (mode->crtc_vtotal - mode->crtc_vsync_end < 3)
+		return MODE_VBLANK_NARROW;
+
 	return MODE_OK;
 }
 
-- 
Regards,

Laurent Pinchart
