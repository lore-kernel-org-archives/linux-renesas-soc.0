Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49551 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754406AbcHSA7k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2016 20:59:40 -0400
Received: from localhost.localdomain (227.178-201-80.adsl-dyn.isp.belgacom.be [80.201.178.227])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 85B60208DD
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2016 18:03:34 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH/HACK 7/7] [HACK] drm: rcar-du: Enable VSP source support for R8A7790
Date: Thu, 18 Aug 2016 19:04:00 +0300
Message-Id: <1471536240-25082-8-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Pretend the R8A7790 requires usage of VSP composition to test the
feature until Gen3 hardware is available. As the driver requires one
VSP1 instance per CRTC, disable DU2.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 899ef7a2a7b4..93888e41487c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -60,15 +60,16 @@ static const struct rcar_du_device_info rcar_du_r8a7779_info = {
 static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 	.gen = 2,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
-		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
+		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
+		  | RCAR_DU_FEATURE_VSP1_SOURCE,
 	.quirks = RCAR_DU_QUIRK_ALIGN_128B | RCAR_DU_QUIRK_LVDS_LANES,
-	.num_crtcs = 3,
+	.num_crtcs = 2,
 	.routes = {
 		/* R8A7790 has one RGB output, two LVDS outputs and one
 		 * (currently unsupported) TCON output.
 		 */
 		[RCAR_DU_OUTPUT_DPAD0] = {
-			.possible_crtcs = BIT(2) | BIT(1) | BIT(0),
+			.possible_crtcs = BIT(1) | BIT(0),
 			.encoder_type = DRM_MODE_ENCODER_NONE,
 			.port = 0,
 		},
@@ -78,7 +79,7 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 			.port = 1,
 		},
 		[RCAR_DU_OUTPUT_LVDS1] = {
-			.possible_crtcs = BIT(2) | BIT(1),
+			.possible_crtcs = BIT(1),
 			.encoder_type = DRM_MODE_ENCODER_LVDS,
 			.port = 2,
 		},
-- 
Regards,

Laurent Pinchart
