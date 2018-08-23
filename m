Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:59123 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732576AbeHWSmi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 14:42:38 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ulrich.hecht+renesas@gmail.com, kieran.bingham@ideasonboard.com,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS)
Subject: [PATCH 4/4] drm: rcar-du: Fix handling of PnMR register
Date: Thu, 23 Aug 2018 17:12:14 +0200
Message-Id: <1535037134-373-5-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1535037134-373-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1535037134-373-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to revision 1.00 of R-Car Gen3 Soc manual, setting bits
PnMR[13:12] is only valid if the DU group has two channels.

It is then valid writing to PnMR[13:12] for:
R-Car H3 = DU group 0 and DU group 1
R-Car M3-W, M3-N: DU group 0 only
R-Car D3/E3: DU group 0 (no group 1)

It is always invalid writing PnMR[13:12] on:
R-Car V3M/V3H: only group 0 is present, but with a single channel

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 5c2462a..647d2fc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -505,8 +505,17 @@ static void rcar_du_plane_setup_format_gen3(struct rcar_du_group *rgrp,
 					    unsigned int index,
 					    const struct rcar_du_plane_state *state)
 {
-	rcar_du_plane_write(rgrp, index, PnMR,
-			    PnMR_SPIM_TP_OFF | state->format->pnmr);
+	u32 mask = BIT(rgrp->index * 2) | BIT(rgrp->index * 2 + 1);
+	u32 pnmr = PnMR_SPIM_TP_OFF;
+
+	/*
+	 * Setting PnMR[13:12] is only allowed when more than 1 channel is
+	 * availble in the group.
+	 */
+	if ((rgrp->channels_mask & mask) == mask)
+		pnmr |= state->format->pnmr;
+
+	rcar_du_plane_write(rgrp, index, PnMR, pnmr);
 
 	rcar_du_plane_write(rgrp, index, PnDDCR4,
 			    state->format->edf | PnDDCR4_CODE);
-- 
2.7.4
