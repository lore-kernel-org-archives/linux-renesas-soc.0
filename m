Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55159 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752675AbcKSD2K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 22:28:10 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 04/13] drm: Add data mirror bus flag
Date: Sat, 19 Nov 2016 05:28:04 +0200
Message-Id: <1479526093-7014-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The flag indicates that data is mirrored on the bus. The exact meaning
is bus-type dependent. For LVDS buses it indicates that the seven data
bits that transmitted in a clock pulse are sent in slots 6 to 0 order.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/drm/drm_connector.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index ac9d7d8e0e43..5c1dda236760 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -159,6 +159,8 @@ struct drm_display_info {
 #define DRM_BUS_FLAG_PIXDATA_POSEDGE	(1<<2)
 /* drive data on neg. edge */
 #define DRM_BUS_FLAG_PIXDATA_NEGEDGE	(1<<3)
+/* data is mirrored on the bus */
+#define DRM_BUS_FLAG_DATA_MIRROR	(1<<4)
 
 	/**
 	 * @bus_flags: Additional information (like pixel signal polarity) for
-- 
Regards,

Laurent Pinchart
