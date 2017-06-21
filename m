Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52264 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751038AbdFUJDe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2017 05:03:34 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] drm: rcar-du: Add HDMI outputs to R8A7796 device description
Date: Wed, 21 Jun 2017 12:04:07 +0300
Message-Id: <20170621090407.4093-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170621090407.4093-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170621090407.4093-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Update the device description with the HDMI output.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index d6a0255181cc..fc0ae0947b8f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -180,19 +180,25 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 		  | RCAR_DU_FEATURE_VSP1_SOURCE,
 	.num_crtcs = 3,
 	.routes = {
-		/* R8A7796 has one RGB output, one LVDS output and one
-		 * (currently unsupported) HDMI output.
+		/*
+		 * R8A7796 has one RGB output, one LVDS output and one HDMI
+		 * output.
 		 */
 		[RCAR_DU_OUTPUT_DPAD0] = {
 			.possible_crtcs = BIT(2),
 			.port = 0,
 		},
+		[RCAR_DU_OUTPUT_HDMI0] = {
+			.possible_crtcs = BIT(1),
+			.port = 1,
+		},
 		[RCAR_DU_OUTPUT_LVDS0] = {
 			.possible_crtcs = BIT(0),
 			.port = 2,
 		},
 	},
 	.num_lvds = 1,
+	.dpll_ch =  BIT(1),
 };
 
 static const struct of_device_id rcar_du_of_table[] = {
-- 
Regards,

Laurent Pinchart
