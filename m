Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:32793 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbeG3S43 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 14:56:29 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: Jacopo Mondi <jacopo@jmondi.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS),
        linux-kernel@vger.kernel.org (open list),
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 1/3] drm: rcar-du: Rework clock configuration based on hardware limits
Date: Mon, 30 Jul 2018 19:20:12 +0200
Message-Id: <1532971214-17962-2-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1532971214-17962-1-git-send-email-jacopo@jmondi.org>
References: <1532971214-17962-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The DU channels that have a display PLL (DPLL) can only use external
clock sources, and don't have an internal clock divider (with the
exception of H3 ES1.x where the post-divider is present and needs to be
used as a workaround for a DPLL silicon issue).

Rework the clock configuration to take this into account, avoiding
selection of non-existing clock sources or usage of a missing
post-divider.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 122 ++++++++++++++++++---------------
 1 file changed, 67 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index b52b3e8..6d55cec 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -208,78 +208,90 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
 	struct rcar_du_device *rcdu = rcrtc->group->dev;
 	unsigned long mode_clock = mode->clock * 1000;
-	unsigned long clk;
 	u32 value;
 	u32 escr;
-	u32 div;
 
-	/*
-	 * Compute the clock divisor and select the internal or external dot
-	 * clock based on the requested frequency.
-	 */
-	clk = clk_get_rate(rcrtc->clock);
-	div = DIV_ROUND_CLOSEST(clk, mode_clock);
-	div = clamp(div, 1U, 64U) - 1;
-	escr = div | ESCR_DCLKSEL_CLKS;
-
-	if (rcrtc->extclock) {
+	if (rcdu->info->dpll_ch & (1 << rcrtc->index)) {
+		unsigned long target = mode_clock;
 		struct dpll_info dpll = { 0 };
 		unsigned long extclk;
-		unsigned long extrate;
-		unsigned long rate;
-		u32 extdiv;
+		u32 dpllcr;
+		u32 div = 0;
 
-		extclk = clk_get_rate(rcrtc->extclock);
-		if (rcdu->info->dpll_ch & (1 << rcrtc->index)) {
-			unsigned long target = mode_clock;
+		/*
+		 * DU channels that have a display PLL can't use the internal
+		 * system clock, and have no internal clock divider.
+		 */
 
-			/*
-			 * The H3 ES1.x exhibits dot clock duty cycle stability
-			 * issues. We can work around them by configuring the
-			 * DPLL to twice the desired frequency, coupled with a
-			 * /2 post-divider. This isn't needed on other SoCs and
-			 * breaks HDMI output on M3-W for a currently unknown
-			 * reason, so restrict the workaround to H3 ES1.x.
-			 */
-			if (soc_device_match(rcar_du_r8a7795_es1))
-				target *= 2;
+		if (WARN_ON(!rcrtc->extclock))
+			return;
 
-			rcar_du_dpll_divider(rcrtc, &dpll, extclk, target);
-			extclk = dpll.output;
+		/*
+		 * The H3 ES1.x exhibits dot clock duty cycle stability issues.
+		 * We can work around them by configuring the DPLL to twice the
+		 * desired frequency, coupled with a /2 post-divider. Restrict
+		 * the workaround to H3 ES1.x as ES2.0 and all other SoCs have
+		 * no post-divider when a display PLL is present (as shown by
+		 * the workaround breaking HDMI output on M3-W during testing).
+		 */
+		if (soc_device_match(rcar_du_r8a7795_es1)) {
+			target *= 2;
+			div = 1;
 		}
 
-		extdiv = DIV_ROUND_CLOSEST(extclk, mode_clock);
-		extdiv = clamp(extdiv, 1U, 64U) - 1;
+		extclk = clk_get_rate(rcrtc->extclock);
+		rcar_du_dpll_divider(rcrtc, &dpll, extclk, target);
 
-		rate = clk / (div + 1);
-		extrate = extclk / (extdiv + 1);
+		dpllcr = DPLLCR_CODE | DPLLCR_CLKE
+		       | DPLLCR_FDPLL(dpll.fdpll)
+		       | DPLLCR_N(dpll.n) | DPLLCR_M(dpll.m)
+		       | DPLLCR_STBY;
 
-		if (abs((long)extrate - (long)mode_clock) <
-		    abs((long)rate - (long)mode_clock)) {
+		if (rcrtc->index == 1)
+			dpllcr |= DPLLCR_PLCS1
+			       |  DPLLCR_INCS_DOTCLKIN1;
+		else
+			dpllcr |= DPLLCR_PLCS0
+			       |  DPLLCR_INCS_DOTCLKIN0;
 
-			if (rcdu->info->dpll_ch & (1 << rcrtc->index)) {
-				u32 dpllcr = DPLLCR_CODE | DPLLCR_CLKE
-					   | DPLLCR_FDPLL(dpll.fdpll)
-					   | DPLLCR_N(dpll.n) | DPLLCR_M(dpll.m)
-					   | DPLLCR_STBY;
+		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
 
-				if (rcrtc->index == 1)
-					dpllcr |= DPLLCR_PLCS1
-					       |  DPLLCR_INCS_DOTCLKIN1;
-				else
-					dpllcr |= DPLLCR_PLCS0
-					       |  DPLLCR_INCS_DOTCLKIN0;
+		escr = ESCR_DCLKSEL_DCLKIN | div;
+	} else {
+		unsigned long clk;
+		u32 div;
 
-				rcar_du_group_write(rcrtc->group, DPLLCR,
-						    dpllcr);
-			}
+		/*
+		 * Compute the clock divisor and select the internal or external
+		 * dot clock based on the requested frequency.
+		 */
+		clk = clk_get_rate(rcrtc->clock);
+		div = DIV_ROUND_CLOSEST(clk, mode_clock);
+		div = clamp(div, 1U, 64U) - 1;
 
-			escr = ESCR_DCLKSEL_DCLKIN | extdiv;
-		}
+		escr = ESCR_DCLKSEL_CLKS | div;
 
-		dev_dbg(rcrtc->group->dev->dev,
-			"mode clock %lu extrate %lu rate %lu ESCR 0x%08x\n",
-			mode_clock, extrate, rate, escr);
+		if (rcrtc->extclock) {
+			unsigned long extclk;
+			unsigned long extrate;
+			unsigned long rate;
+			u32 extdiv;
+
+			extclk = clk_get_rate(rcrtc->extclock);
+			extdiv = DIV_ROUND_CLOSEST(extclk, mode_clock);
+			extdiv = clamp(extdiv, 1U, 64U) - 1;
+
+			extrate = extclk / (extdiv + 1);
+			rate = clk / (div + 1);
+
+			if (abs((long)extrate - (long)mode_clock) <
+			    abs((long)rate - (long)mode_clock))
+				escr = ESCR_DCLKSEL_DCLKIN | extdiv;
+
+			dev_dbg(rcrtc->group->dev->dev,
+				"mode clock %lu extrate %lu rate %lu ESCR 0x%08x\n",
+				mode_clock, extrate, rate, escr);
+		}
 	}
 
 	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? ESCR2 : ESCR,
-- 
2.7.4
