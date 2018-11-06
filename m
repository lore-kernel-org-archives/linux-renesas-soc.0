Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:51552 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730061AbeKGBFM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 20:05:12 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
Subject: [PATCH] drm: rcar-du: Fix external clock error checks
Date: Tue,  6 Nov 2018 17:39:30 +0200
Message-Id: <20181106153930.21915-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The rcar-du driver supports probe deferral for external clocks, but
implements it badly by checking the wrong pointer due to a bad copy and
paste. Fix it.

While at it, reject invalid clocks outright for DU channels that have a
display PLL, as the external clock is mandatory in that case. This
avoids a WARN_ON() at runtime.

Fixes: 1b30dbde8596 ("drm: rcar-du: Add support for external pixel clock")
Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index d18a342626b5..79021d7aa3ce 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -226,9 +226,6 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		 * system clock, and have no internal clock divider.
 		 */
 
-		if (WARN_ON(!rcrtc->extclock))
-			return;
-
 		/*
 		 * The H3 ES1.x exhibits dot clock duty cycle stability issues.
 		 * We can work around them by configuring the DPLL to twice the
@@ -1113,9 +1110,16 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 	clk = devm_clk_get(rcdu->dev, clk_name);
 	if (!IS_ERR(clk)) {
 		rcrtc->extclock = clk;
-	} else if (PTR_ERR(rcrtc->clock) == -EPROBE_DEFER) {
-		dev_info(rcdu->dev, "can't get external clock %u\n", hwindex);
+	} else if (PTR_ERR(clk) == -EPROBE_DEFER) {
 		return -EPROBE_DEFER;
+	} else if (rcdu->info->dpll_mask & BIT(hwindex)) {
+		/*
+		 * DU channels that have a display PLL can't use the internal
+		 * system clock and thus require an external clock.
+		 */
+		ret = PTR_ERR(clk);
+		dev_err(rcdu->dev, "can't get dclkin.%u: %d\n", hwindex, ret);
+		return ret;
 	}
 
 	init_waitqueue_head(&rcrtc->flip_wait);
-- 
Regards,

Laurent Pinchart
