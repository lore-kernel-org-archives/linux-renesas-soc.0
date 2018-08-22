Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:40149 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbeHVKpg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 06:45:36 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS)
Subject: [PATCH 1/3] drm: rcar-du: Rename and document dpll_ch field
Date: Wed, 22 Aug 2018 09:21:47 +0200
Message-Id: <1534922509-15197-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1534922509-15197-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1534922509-15197-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document and re-name the 'dpll_ch' field to a more precise 'dpll_mask' for
consistency with the 'channels_mask' field defined in 'struct
rcar_du_device_info'.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 6 +++---
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  | 3 ++-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 2664336..5454884 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -211,7 +211,7 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 	u32 dsmr;
 	u32 escr;
 
-	if (rcdu->info->dpll_ch & (1 << rcrtc->index)) {
+	if (rcdu->info->dpll_mask & (1 << rcrtc->index)) {
 		unsigned long target = mode_clock;
 		struct dpll_info dpll = { 0 };
 		unsigned long extclk;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 02aee6c..b42145c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -215,7 +215,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 		},
 	},
 	.num_lvds = 1,
-	.dpll_ch =  BIT(2) | BIT(1),
+	.dpll_mask =  BIT(2) | BIT(1),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7796_info = {
@@ -243,7 +243,7 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 		},
 	},
 	.num_lvds = 1,
-	.dpll_ch =  BIT(1),
+	.dpll_mask =  BIT(1),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a77965_info = {
@@ -271,7 +271,7 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 		},
 	},
 	.num_lvds = 1,
-	.dpll_ch =  BIT(1),
+	.dpll_mask =  BIT(1),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a77970_info = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index b3a25e8..6453b33 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -55,6 +55,7 @@ struct rcar_du_output_routing {
  * @channels_mask: bit mask of available DU channels
  * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
  * @num_lvds: number of internal LVDS encoders
+ * @dpll_mask: mask of DU channels equipped with a DPLL
  */
 struct rcar_du_device_info {
 	unsigned int gen;
@@ -63,7 +64,7 @@ struct rcar_du_device_info {
 	unsigned int channels_mask;
 	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
 	unsigned int num_lvds;
-	unsigned int dpll_ch;
+	unsigned int dpll_mask;
 };
 
 #define RCAR_DU_MAX_CRTCS		4
-- 
2.7.4
