Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59301 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754194AbdADAj1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2017 19:39:27 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2.1 04/13] drm: Add data transmission order bus flag
Date: Wed,  4 Jan 2017 02:39:26 +0200
Message-Id: <20170104003926.29683-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <7f668e382fa001811f961abfb398c9c9@agner.ch>
References: <7f668e382fa001811f961abfb398c9c9@agner.ch>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The flags indicate whether data is transmitted lsb to msb or msb to lsb
on the bus.

The exact meaning is bus-type dependent. For instance, for LVDS buses
the flags indicate whether the seven data bits transmitted in a clock
pulse are sent in normal order (msb to lsb, slots 0 to 6) or reverse
order (lsb to msb, slots 6 to 0).

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Rename the flag to DRM_BUS_FLAG_DATA_LSB_TO_MSB and add a
  corresponding DRM_BUS_FLAG_DATA_MSB_TO_LSB flag.
---
 include/drm/drm_connector.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index a9b95246e26e..712f255577ea 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -160,6 +160,10 @@ struct drm_display_info {
 #define DRM_BUS_FLAG_PIXDATA_POSEDGE	(1<<2)
 /* drive data on neg. edge */
 #define DRM_BUS_FLAG_PIXDATA_NEGEDGE	(1<<3)
+/* data is transmitted msb to lsb on the bus */
+#define DRM_BUS_FLAG_DATA_MSB_TO_LSB	(1<<4)
+/* data is transmitted lsb to msb on the bus */
+#define DRM_BUS_FLAG_DATA_LSB_TO_MSB	(1<<5)
 
 	/**
 	 * @bus_flags: Additional information (like pixel signal polarity) for
-- 
Regards,

Laurent Pinchart
