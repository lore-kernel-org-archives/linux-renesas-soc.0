Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60488 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755396AbcK2JFJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 04:05:09 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v3 09/13] drm: Add encoder_type field to the drm_bridge structure
Date: Tue, 29 Nov 2016 11:04:39 +0200
Message-Id: <1480410283-28698-10-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
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
index 94e5ee96b3b5..0643b6ce27de 100644
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
