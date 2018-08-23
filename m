Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:45903 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732016AbeHWSmi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 14:42:38 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ulrich.hecht+renesas@gmail.com, kieran.bingham@ideasonboard.com,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS)
Subject: [PATCH 3/4] drm: rcar-du: Fix handling of DORCR for group 1
Date: Thu, 23 Aug 2018 17:12:13 +0200
Message-Id: <1535037134-373-4-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1535037134-373-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1535037134-373-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to revision 1.00 of R-Car Gen3 Soc manual, only DU channels of
group 0 (DU0 and DU1) supports output control routing through register DORCR0.

For channels of group 1 (DU2 and DU3) which are only present on H3/M3-W/M3-N
SoCs, no routing options are available between super-imposition processors
and the output pin controller. The updated version of the SoC manual
prescribes thus to hardcode DPRCR2 bits that controls output pin routing for
those channels.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index ef2c177..e79d424 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -127,10 +127,19 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 		rcar_du_group_write(rgrp, DEFR10, DEFR10_CODE | DEFR10_DEFE10);
 
 	/*
-	 * Use DS1PR and DS2PR to configure planes priorities and connects the
-	 * superposition 0 to DU0 pins. DU1 pins will be configured dynamically.
+	 * For group 0 (DU0/DU1) use DS1PR and DS2PR to configure planes
+	 * priorities and connects the superposition 0 to DU0 pins.
+	 * DU1 pins will be configured dynamically.
+	 *
+	 * For group 1 (DU2/DU3), if any, use DS2PR and DS3PT to configure
+	 * planes priorities and hardcode other bits.
 	 */
-	rcar_du_group_write(rgrp, DORCR, DORCR_PG1D_DS1 | DORCR_DPRS);
+	if (rgrp->index == 0)
+		rcar_du_group_write(rgrp, DORCR, DORCR_PG1D_DS1 | DORCR_DPRS);
+	else
+		rcar_du_group_write(rgrp, DORCR, DORCR_PG2T | DORCR_DK2S |
+				    DORCR_PG2D_DS2 | DORCR_DPRS);
+
 
 	/* Apply planes to CRTCs association. */
 	mutex_lock(&rgrp->lock);
@@ -247,6 +256,10 @@ int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
 	struct rcar_du_crtc *crtc0 = &rgrp->dev->crtcs[rgrp->index * 2];
 	u32 dorcr = rcar_du_group_read(rgrp, DORCR);
 
+	/* Only group 0 (DU0/DU1) has pin routing options. */
+	if (rgrp->index > 0)
+		return 0;
+
 	dorcr &= ~(DORCR_PG2T | DORCR_DK2S | DORCR_PG2D_MASK);
 
 	/*
-- 
2.7.4
