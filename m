Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55229 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752852AbcKSDsS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 22:48:18 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 5/9] drm: Add encoder_type field to the drm_bridge structure
Date: Sat, 19 Nov 2016 05:48:18 +0200
Message-Id: <1479527302-7674-6-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1479527302-7674-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479527302-7674-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The drm_bridge object models on- or off-chip hardware encoders and
provide an abstract control API to display drivers. In order to help
display drivers creating the right kind of drm_encoder object, expose
the type of the hardware encoder associated with each bridge.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Clarify documentation
---
 include/drm/drm_bridge.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 530a1d6e8cde..f28bd176d1a5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -194,6 +194,14 @@ struct drm_bridge {
 #endif
 	struct list_head list;
 
+	/**
+	 * @encoder_type:
+	 *
+	 * Type of the hardware encoder modeled by the bridge as one of the
+	 * DRM_MODE_ENCODER_* types. For the last bridge in the chain this will
+	 * usually be identical to the bridge's &drm_encoder encoder_type.
+	 */
+	int encoder_type;
 	const struct drm_bridge_funcs *funcs;
 	void *driver_private;
 };
-- 
Regards,

Laurent Pinchart
