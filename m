Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:48767 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753626AbcJDMbs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 08:31:48 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/6] drm: rcar-du: Bring HDMI encoder comments in line with the driver
Date: Tue,  4 Oct 2016 15:31:36 +0300
Message-Id: <1475584299-21236-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Capitalize acronyms and use determiners and punctuation.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c b/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
index e03004f4588d..f9515f53cc5b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
@@ -108,7 +108,7 @@ int rcar_du_hdmienc_init(struct rcar_du_device *rcdu,
 	if (hdmienc == NULL)
 		return -ENOMEM;
 
-	/* Locate drm bridge from the hdmi encoder DT node */
+	/* Locate the DRM bridge from the HDMI encoder DT node. */
 	bridge = of_drm_find_bridge(np);
 	if (!bridge)
 		return -EPROBE_DEFER;
@@ -123,7 +123,7 @@ int rcar_du_hdmienc_init(struct rcar_du_device *rcdu,
 	renc->hdmi = hdmienc;
 	hdmienc->renc = renc;
 
-	/* Link drm_bridge to encoder */
+	/* Link the bridge to the encoder. */
 	bridge->encoder = encoder;
 	encoder->bridge = bridge;
 
-- 
Regards,

Laurent Pinchart
