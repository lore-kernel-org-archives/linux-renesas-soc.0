Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36828 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752446AbcKNQjI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 11:39:08 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: [PATCH 1/4] drm: rcar-du: Fix dot clock routing configuration
Date: Mon, 14 Nov 2016 18:39:09 +0200
Message-Id: <1479141552-8509-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1479141552-8509-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479141552-8509-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dot clock routing is setup through different registers depending on the
DU generation. The code has been designed for Gen2 and hasn't been
updated since. This works thanks to good reset default value, but isn't
very safe. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 33b2fc53da3e..64738fca96d0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -105,16 +105,20 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 	if (rcar_du_has(rgrp->dev, RCAR_DU_FEATURE_EXT_CTRL_REGS)) {
 		rcar_du_group_setup_defr8(rgrp);
 
-		/* Configure input dot clock routing. We currently hardcode the
-		 * configuration to routing DOTCLKINn to DUn.
+		/*
+		 * Configure input dot clock routing. We currently hardcode the
+		 * configuration to routing DOTCLKINn to DUn. Register fields
+		 * depend on the DU generation, but the resulting value is 0 in
+		 * all cases.
+		 *
+		 * On Gen2 a single register in the first group controls dot
+		 * clock selection for all channels, while on Gen3 dot clocks
+		 * are setup through per-group registers, only available when
+		 * the group has two channels.
 		 */
-		rcar_du_group_write(rgrp, DIDSR, DIDSR_CODE |
-				    DIDSR_LCDS_DCLKIN(2) |
-				    DIDSR_LCDS_DCLKIN(1) |
-				    DIDSR_LCDS_DCLKIN(0) |
-				    DIDSR_PDCS_CLK(2, 0) |
-				    DIDSR_PDCS_CLK(1, 0) |
-				    DIDSR_PDCS_CLK(0, 0));
+		if ((rcdu->info->gen < 3 && rgrp->index == 0) ||
+		    (rcdu->info->gen == 3 &&  rgrp->num_crtcs > 1))
+			rcar_du_group_write(rgrp, DIDSR, DIDSR_CODE);
 	}
 
 	if (rcdu->info->gen >= 3)
-- 
Regards,

Laurent Pinchart
