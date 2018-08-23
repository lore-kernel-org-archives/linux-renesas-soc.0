Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:53661 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732016AbeHWSmf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 14:42:35 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ulrich.hecht+renesas@gmail.com, kieran.bingham@ideasonboard.com,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS)
Subject: [PATCH 1/4] drm: rcar-du: Do not write ESCR for DPLL channels
Date: Thu, 23 Aug 2018 17:12:11 +0200
Message-Id: <1535037134-373-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1535037134-373-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1535037134-373-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to revision 1.00 of R-Car Gen3 Soc manual, writing to ESCR
register of DU channels equipped with a display PLL (DPLL) is invalid.

Fix this by writing ESCR only for channels making use of the DU internal
post-divider to generate the dotclockout signal, with R-Car H3 ES1.x being
a notable exception.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 1541152..7b1c05b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -246,7 +246,6 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 	struct rcar_du_device *rcdu = rcrtc->group->dev;
 	unsigned long mode_clock = mode->clock * 1000;
 	u32 dsmr;
-	u32 escr;
 
 	if (rcdu->info->dpll_mask & (1 << rcrtc->index)) {
 		unsigned long target = mode_clock;
@@ -293,7 +292,11 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 
 		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
 
-		escr = ESCR_DCLKSEL_DCLKIN | div;
+		/* Only H3 ES1.x has a post divider when a DPLL is present. */
+		if (soc_device_match(rcar_du_r8a7795_es1))
+			rcar_du_crtc_write(rcrtc,
+					   rcrtc->index % 2 ? ESCR13 : ESCR02,
+					   ESCR_DCLKSEL_DCLKIN | div);
 	} else {
 		struct du_clk_params params = { .diff = (unsigned long)-1 };
 
@@ -308,12 +311,10 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 			params.rate);
 
 		clk_set_rate(params.clk, params.rate);
-		escr = params.escr;
+		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02,
+				   params.escr);
 	}
 
-	dev_dbg(rcrtc->group->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
-
-	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
 	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
 
 	/* Signal polarities */
-- 
2.7.4
