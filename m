Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35126 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941972AbcJSOZ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2016 10:25:56 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/8] drm: Add encoder_type field to the drm_bridge structure
Date: Wed, 19 Oct 2016 17:25:39 +0300
Message-Id: <1476887143-24831-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1476887143-24831-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476887143-24831-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The drm_bridge object models on- or off-chip hardware encoders and
provide an abstract control API to display drivers. In order to help
display drivers creating the right kind of drm_encoder object, expose
the type of the hardware encoder associated with each bridge.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/drm/drm_bridge.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 530a1d6e8cde..e93105bffc3c 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -194,6 +194,14 @@ struct drm_bridge {
 #endif
 	struct list_head list;
 
+	/**
+	 * @encoder_type:
+	 *
+	 * Type of the hardware encoder modeled by the bridge as one of the
+	 * DRM_MODE_ENCODER_* types. This will usually be identical to the
+	 * ->encoder.encoder_type for the last bridge in the chain only.
+	 */
+	int encoder_type;
 	const struct drm_bridge_funcs *funcs;
 	void *driver_private;
 };
-- 
Regards,

Laurent Pinchart
