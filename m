Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60488 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756434AbcK2JEw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 04:04:52 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v3 04/13] drm: bridge: Detach bridge from encoder at encoder cleanup time
Date: Tue, 29 Nov 2016 11:04:34 +0200
Message-Id: <1480410283-28698-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Most drivers that use bridges forgot to detach them at cleanup time.
Instead of fixing them one by one, detach the bridge in the core
drm_encoder_cleanup() function.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_encoder.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 5c067719164d..9c1f99646e0d 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -164,6 +164,9 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
 	 * the indices on the drm_encoder after us in the encoder_list.
 	 */
 
+	if (encoder->bridge)
+		drm_bridge_detach(encoder->bridge);
+
 	drm_modeset_lock_all(dev);
 	drm_mode_object_unregister(dev, &encoder->base);
 	kfree(encoder->name);
-- 
Regards,

Laurent Pinchart
