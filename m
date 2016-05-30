Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35520 "EHLO
	mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932508AbcE3QA5 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:00:57 -0400
Received: by mail-lf0-f65.google.com with SMTP id q63so4584985lfi.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:00:56 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC 10/21] drm: rcar-du: Fix VSP plane number per devices
Date: Mon, 30 May 2016 18:00:09 +0200
Message-Id: <1464624020-27709-11-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 ++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h | 3 ++-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 3907461..26fd3ba 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -108,6 +108,7 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 		},
 	},
 	.num_lvds = 1,
+	.vsp_num = 4,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7794_info = {
@@ -167,6 +168,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	},
 	.num_lvds = 1,
 	.dpll_ch =  BIT(1) | BIT(2),
+	.vsp_num = 5,
 };
 
 static const struct of_device_id rcar_du_of_table[] = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 790829b..6413b7e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -70,12 +70,13 @@ struct rcar_du_device_info {
 	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
 	unsigned int num_lvds;
 	unsigned int dpll_ch;
+	unsigned int vsp_num;
 };
 
 #define RCAR_DU_MAX_CRTCS		4
 #define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
 #define RCAR_DU_MAX_LVDS		2
-#define RCAR_DU_MAX_VSPS		4
+#define RCAR_DU_MAX_VSPS		5
 
 struct rcar_du_device {
 	struct device *dev;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 4927fb3..89176e6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -349,7 +349,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp)
 	 /* The VSP2D (Gen3) has 5 RPFs, but the VSP1D (Gen2) is limited to
 	  * 4 RPFs.
 	  */
-	vsp->num_planes = rcdu->info->gen >= 3 ? 5 : 4;
+	vsp->num_planes = rcdu->info->vsp_num;
 
 	vsp->planes = devm_kcalloc(rcdu->dev, vsp->num_planes,
 				   sizeof(*vsp->planes), GFP_KERNEL);
-- 
2.7.4
