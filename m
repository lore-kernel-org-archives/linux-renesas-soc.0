Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41469 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932585AbcLTBdx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 20:33:53 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: [PATCH v2 26/29] drm: rcar-du: Add HDMI outputs to R8A7795 device description
Date: Tue, 20 Dec 2016 03:33:57 +0200
Message-Id: <20161220013400.28317-27-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Update the device description with the two available HDMI outputs.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  4 +++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 12 ++++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 6f08b7e7db06..459e5390d6e0 100644
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
index 74352140f55f..3107719c4653 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -150,13 +150,21 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
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
 			.port = 0,
 		},
+		[RCAR_DU_OUTPUT_HDMI0] = {
+			.possible_crtcs = BIT(1),
+			.port = 1,
+		},
+		[RCAR_DU_OUTPUT_HDMI1] = {
+			.possible_crtcs = BIT(2),
+			.port = 2,
+		},
 		[RCAR_DU_OUTPUT_LVDS0] = {
 			.possible_crtcs = BIT(0),
 			.port = 3,
-- 
Regards,

Laurent Pinchart
