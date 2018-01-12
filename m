Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60795 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932298AbeALDUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 22:20:42 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: rcar-du: Enable VSP compositor by default on Gen3
Date: Fri, 12 Jan 2018 05:20:35 +0200
Message-Id: <20180112032035.11977-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Gen3 hardware the VSP compositor is required for display. Enable it
by default in the kernel configuration. The option is kept
user-configurable for testing purpose on Gen2 platforms.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 1d6f1b849287..2b104daf56eb 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -27,7 +27,8 @@ config DRM_RCAR_LVDS
 	  Enable support for the R-Car Display Unit embedded LVDS encoders.
 
 config DRM_RCAR_VSP
-	bool "R-Car DU VSP Compositor Support"
+	bool "R-Car DU VSP Compositor Support" if ARM
+	default y if ARM64
 	depends on DRM_RCAR_DU
 	depends on VIDEO_RENESAS_VSP1=y || (VIDEO_RENESAS_VSP1 && DRM_RCAR_DU=m)
 	help
-- 
Regards,

Laurent Pinchart
