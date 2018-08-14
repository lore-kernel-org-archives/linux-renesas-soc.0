Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:15615 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732667AbeHNQlC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Aug 2018 12:41:02 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: [PROTO][PATCH 03/10] drm: rcar-du: Fix digital RGB routing for R8A77995
Date: Tue, 14 Aug 2018 15:49:57 +0200
Message-Id: <1534254604-24204-4-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

This patch adds D3 definition for DU and fixes digital RGB routing.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 3 ++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   | 2 ++
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 4 ++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 5c2f764..d930996 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -298,7 +298,8 @@ static const struct rcar_du_device_info rcar_du_r8a77995_info = {
 	.gen = 3,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
-		  | RCAR_DU_FEATURE_VSP1_SOURCE,
+		  | RCAR_DU_FEATURE_VSP1_SOURCE
+		  | RCAR_DU_FEATURE_R8A77995_REGS,
 	.quirks = RCAR_DU_QUIRK_TVM_MASTER_ONLY,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 6257405..9355b58 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -30,6 +30,8 @@ struct rcar_du_device;
 #define RCAR_DU_FEATURE_CRTC_IRQ_CLOCK	(1 << 0)	/* Per-CRTC IRQ and clock */
 #define RCAR_DU_FEATURE_EXT_CTRL_REGS	(1 << 1)	/* Has extended control registers */
 #define RCAR_DU_FEATURE_VSP1_SOURCE	(1 << 2)	/* Has inputs from VSP1 */
+#define RCAR_DU_FEATURE_R8A77965_REGS	(1 << 3)	/* Use R8A77965 registers */
+#define RCAR_DU_FEATURE_R8A77995_REGS	(1 << 4)	/* Use R8A77995 registers */
 
 #define RCAR_DU_QUIRK_ALIGN_128B	(1 << 0)	/* Align pitches to 128 bytes */
 #define RCAR_DU_QUIRK_TVM_MASTER_ONLY	(1 << 1)	/* Does not have TV switch/sync modes */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 9a0a694..371d780 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -88,6 +88,10 @@ static void rcar_du_group_setup_defr8(struct rcar_du_group *rgrp)
 
 		if (crtc->index / 2 == rgrp->index)
 			defr8 |= DEFR8_DRGBS_DU(crtc->index);
+
+		if (rcar_du_has(rcdu, RCAR_DU_FEATURE_R8A77995_REGS))
+			defr8 |= (DEFR8_DRGBS_DU(rcdu->dpad0_source) |
+				 DEFR8_DRGBS_DU(crtc->index));
 	}
 
 	rcar_du_group_write(rgrp, DEFR8, defr8);
-- 
2.7.4
