Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:34638 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751122AbcL1VUg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Dec 2016 16:20:36 -0500
Received: by mail-lf0-f43.google.com with SMTP id y21so210882427lfa.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Dec 2016 13:20:36 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] drm: rcar-du: enable VSPD on R8A7794
Date: Thu, 29 Dec 2016 00:20:33 +0300
Message-ID: <1637352.TRSum6nTUx@wasted.cogentembedded.com>
In-Reply-To: <18781159.4YChoBxRU5@wasted.cogentembedded.com>
References: <18781159.4YChoBxRU5@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We're going to use R8A7794 VSPD to control DU, so set the corresponding flag
and the  newly added field, 'num_vspds'...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -136,7 +136,8 @@ static const struct rcar_du_device_info
 static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 	.gen = 2,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
-		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
+		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
+		  | RCAR_DU_FEATURE_VSP1_SOURCE,
 	.num_crtcs = 2,
 	.routes = {
 		/* R8A7794 has two RGB outputs and one (currently unsupported)
@@ -154,6 +155,7 @@ static const struct rcar_du_device_info
 		},
 	},
 	.num_lvds = 0,
+	.num_vspds = 1,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7795_info = {
