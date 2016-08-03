Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:46190 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932820AbcHCUbj (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 3 Aug 2016 16:31:39 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
	Archit Taneja <architt@codeaurora.org>
Subject: [PATCH] drm: rcar-du: Link HDMI encoder with bridge
Date: Wed,  3 Aug 2016 23:31:36 +0300
Message-Id: <1470256296-8476-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The conversion of the rcar-du driver from the I2C slave encoder to the
DRM bridge API left the HDMI encoder's bridge pointer NULL, preventing
the bridge from being handled automatically by the DRM core. Fix it.

Fixes: 1d926114d8f4 ("drm: rcar-du: Remove i2c slave encoder interface for hdmi encoder")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c | 1 +
 1 file changed, 1 insertion(+)

Dave, this is a candidate for v4.8 as the offending patch just made it
upstream during the merge window.

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c b/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
index 4de3ff0dbebd..e03004f4588d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
@@ -125,6 +125,7 @@ int rcar_du_hdmienc_init(struct rcar_du_device *rcdu,
 
 	/* Link drm_bridge to encoder */
 	bridge->encoder = encoder;
+	encoder->bridge = bridge;
 
 	ret = drm_bridge_attach(rcdu->ddev, bridge);
 	if (ret) {
-- 
Regards,

Laurent Pinchart
