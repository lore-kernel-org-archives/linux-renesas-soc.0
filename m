Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:35886 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752388AbcD1VFh (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 28 Apr 2016 17:05:37 -0400
Received: by mail-lf0-f47.google.com with SMTP id u64so98105659lff.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2016 14:05:36 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/4] rcar-du: add R8A7794 TCON support
Date: Fri, 29 Apr 2016 00:05:33 +0300
Message-ID: <3056907.Acy0t71QPW@wasted.cogentembedded.com>
In-Reply-To: <1787748.qAADjKK4gv@wasted.cogentembedded.com>
References: <1787748.qAADjKK4gv@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Now that we have the TCON encoder driver, we can start enabling TCON support
for the  R-Car SoCs. We have only tested the code on R8A7794 so far, so  let
it  be the first supported SoC...

Based on a large patch by Andrey Gusakov.

Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

Index: renesas/drivers/gpu/drm/rcar-du/rcar_du_drv.c
===================================================================
--- renesas.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ renesas/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -116,9 +116,7 @@ static const struct rcar_du_device_info
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
 	.num_crtcs = 2,
 	.routes = {
-		/* R8A7794 has two RGB outputs and one (currently unsupported)
-		 * TCON output.
-		 */
+		/* R8A7794 has two RGB outputs and one TCON output. */
 		[RCAR_DU_OUTPUT_DPAD0] = {
 			.possible_crtcs = BIT(0),
 			.encoder_type = DRM_MODE_ENCODER_NONE,
@@ -129,8 +127,14 @@ static const struct rcar_du_device_info
 			.encoder_type = DRM_MODE_ENCODER_NONE,
 			.port = 1,
 		},
+		[RCAR_DU_OUTPUT_TCON] = {
+			.possible_crtcs = BIT(0),
+			.encoder_type = DRM_MODE_ENCODER_TCON,
+			.port = 2,
+		},
 	},
 	.num_lvds = 0,
+	.num_tcon = 1,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7795_info = {
