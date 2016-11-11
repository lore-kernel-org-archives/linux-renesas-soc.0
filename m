Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33129 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934472AbcKKRIG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 12:08:06 -0500
Received: by mail-wm0-f67.google.com with SMTP id u144so10731279wmu.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2016 09:08:05 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
Cc: kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org,
        airlied@linux.ie, koji.matsuoka.xm@renesas.com
Subject: [PATCH 03/10] drm: rcar-du: Add R8A7795 device support
Date: Fri, 11 Nov 2016 18:07:39 +0100
Message-Id: <1478884066-1090-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  4 +++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 14 ++++++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  2 ++
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 6f08b7e..459e539 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -1,7 +1,7 @@
 /*
  * rcar_du_crtc.h  --  R-Car Display Unit CRTCs
  *
- * Copyright (C) 2013-2014 Renesas Electronics Corporation
+ * Copyright (C) 2013-2015 Renesas Electronics Corporation
  *
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  *
@@ -61,6 +61,8 @@ enum rcar_du_output {
 	RCAR_DU_OUTPUT_DPAD1,
 	RCAR_DU_OUTPUT_LVDS0,
 	RCAR_DU_OUTPUT_LVDS1,
+	RCAR_DU_OUTPUT_HDMI0,
+	RCAR_DU_OUTPUT_HDMI1,
 	RCAR_DU_OUTPUT_TCON,
 	RCAR_DU_OUTPUT_MAX,
 };
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 73c971e..4d0ae8a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -140,14 +140,24 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 		  | RCAR_DU_FEATURE_VSP1_SOURCE,
 	.num_crtcs = 4,
 	.routes = {
-		/* R8A7795 has one RGB output, one LVDS output and two
-		 * (currently unsupported) HDMI outputs.
+		/* R8A7795 has one RGB output, two HDMI outputs and one
+		 * LVDS output.
 		 */
 		[RCAR_DU_OUTPUT_DPAD0] = {
 			.possible_crtcs = BIT(3),
 			.encoder_type = DRM_MODE_ENCODER_NONE,
 			.port = 0,
 		},
+		[RCAR_DU_OUTPUT_HDMI0] = {
+			.possible_crtcs = BIT(1),
+			.encoder_type = RCAR_DU_ENCODER_HDMI,
+			.port = 1,
+		},
+		[RCAR_DU_OUTPUT_HDMI1] = {
+			.possible_crtcs = BIT(2),
+			.encoder_type = RCAR_DU_ENCODER_HDMI,
+			.port = 2,
+		},
 		[RCAR_DU_OUTPUT_LVDS0] = {
 			.possible_crtcs = BIT(0),
 			.encoder_type = DRM_MODE_ENCODER_LVDS,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index c843c31..c9db610 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -20,6 +20,7 @@
 #include "rcar_du_crtc.h"
 #include "rcar_du_group.h"
 #include "rcar_du_vsp.h"
+#include "rcar_du_encoder.h"
 
 struct clk;
 struct device;
@@ -31,6 +32,7 @@ struct rcar_du_lvdsenc;
 #define RCAR_DU_FEATURE_CRTC_IRQ_CLOCK	(1 << 0)	/* Per-CRTC IRQ and clock */
 #define RCAR_DU_FEATURE_EXT_CTRL_REGS	(1 << 1)	/* Has extended control registers */
 #define RCAR_DU_FEATURE_VSP1_SOURCE	(1 << 2)	/* Has inputs from VSP1 */
+#define RCAR_DU_FEATURE_GEN3_REGS	(1 << 3)	/* Use Gen3 registers */
 
 #define RCAR_DU_QUIRK_ALIGN_128B	(1 << 0)	/* Align pitches to 128 bytes */
 #define RCAR_DU_QUIRK_LVDS_LANES	(1 << 1)	/* LVDS lanes 1 and 3 inverted */
-- 
2.7.4
