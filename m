Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35220 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934392AbcKKRIL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 12:08:11 -0500
Received: by mail-wm0-f68.google.com with SMTP id a20so10775421wme.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2016 09:08:11 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
Cc: kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org,
        airlied@linux.ie, koji.matsuoka.xm@renesas.com
Subject: [PATCH 06/10] drm: rcar-du: Fix display registers for R-Car Gen3
Date: Fri, 11 Nov 2016 18:07:42 +0100
Message-Id: <1478884066-1090-7-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 3 ++-
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 5 +++++
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 4 +++-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index d968fa9..77e005b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -141,7 +141,8 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	.gen = 3,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
-		  | RCAR_DU_FEATURE_VSP1_SOURCE,
+		  | RCAR_DU_FEATURE_VSP1_SOURCE
+		  | RCAR_DU_FEATURE_GEN3_REGS,
 	.num_crtcs = 4,
 	.routes = {
 		/* R8A7795 has one RGB output, two HDMI outputs and one
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 33b2fc5..55dd3bd 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -101,6 +101,11 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 	rcar_du_group_write(rgrp, DEFR5, DEFR5_CODE | DEFR5_DEFE5);
 
 	rcar_du_group_setup_pins(rgrp);
+	if (rcdu->info->gen == 3) {
+		rcar_du_group_write(rgrp, DEFR6, DEFR6_CODE |
+					  DEFR6_ODPM22_DISP);
+		rcar_du_group_write(rgrp, DEFR10, DEFR10_CODE | DEFR10_DEFE10);
+	}
 
 	if (rcar_du_has(rgrp->dev, RCAR_DU_FEATURE_EXT_CTRL_REGS)) {
 		rcar_du_group_setup_defr8(rgrp);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index a74f8ed..e408aa3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -454,6 +454,7 @@ static void rcar_du_plane_setup_format_gen2(struct rcar_du_group *rgrp,
 					    unsigned int index,
 					    const struct rcar_du_plane_state *state)
 {
+	struct rcar_du_device *rcdu = rgrp->dev;
 	u32 ddcr2 = PnDDCR2_CODE;
 	u32 ddcr4;
 
@@ -480,7 +481,8 @@ static void rcar_du_plane_setup_format_gen2(struct rcar_du_group *rgrp,
 		}
 	}
 
-	rcar_du_plane_write(rgrp, index, PnDDCR2, ddcr2);
+	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_GEN3_REGS))
+		rcar_du_plane_write(rgrp, index, PnDDCR2, ddcr2);
 
 	ddcr4 = state->format->edf | PnDDCR4_CODE;
 	if (state->source != RCAR_DU_PLANE_MEMORY)
-- 
2.7.4
