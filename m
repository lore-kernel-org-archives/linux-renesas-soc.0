Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:53810 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728312AbeJRDRo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 23:17:44 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Fix vblank initialization
Date: Wed, 17 Oct 2018 22:20:40 +0300
Message-Id: <20181017192040.16017-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The drm_vblank_init() takes the total number of CRTCs as an argument,
but the rcar-du driver passes a bitmask of the CRTC indices. Fix it.

Fixes: 4bf8e1962f91 ("drm: Renesas R-Car Display Unit DRM driver")
Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 4ebd61ecbee1..fe6f65c94eef 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -582,7 +582,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	 * Initialize vertical blanking interrupts handling. Start with vblank
 	 * disabled for all CRTCs.
 	 */
-	ret = drm_vblank_init(dev, (1 << rcdu->num_crtcs) - 1);
+	ret = drm_vblank_init(dev, rcdu->num_crtcs);
 	if (ret < 0)
 		return ret;
 
-- 
Regards,

Laurent Pinchart
