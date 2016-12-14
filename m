Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:34245 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753959AbcLNUhM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Dec 2016 15:37:12 -0500
Received: by mail-wm0-f43.google.com with SMTP id u144so26769934wmu.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Dec 2016 12:37:11 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: rcar-du: enable VSPDs on R8A7791
Date: Wed, 14 Dec 2016 23:37:08 +0300
Message-ID: <4947043.txDs5ZU4mH@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We're going to use R8A7791 VSPDs to control DU, so set the corresponding
flag.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against David Airlie's 'linux.git' repo's 'drm-next' branch.

 drivers/gpu/drm/rcar-du/rcar_du_drv.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -90,7 +90,8 @@ static const struct rcar_du_device_info
 static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 	.gen = 2,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
-		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
+		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
+		  | RCAR_DU_FEATURE_VSP1_SOURCE,
 	.num_crtcs = 2,
 	.routes = {
 		/* R8A779[13] has one RGB output, one LVDS output and one
