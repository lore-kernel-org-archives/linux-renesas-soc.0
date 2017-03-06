Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60006 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752509AbdCFAOn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Mar 2017 19:14:43 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 8/9] drm: rcar-du: Add DPLL support
Date: Mon,  6 Mar 2017 02:03:01 +0200
Message-Id: <20170306000302.14149-9-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170306000302.14149-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170306000302.14149-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

The implementation hardcodes a workaround for the H3 ES1.x SoC
regardless of the SoC revision, as the workaround can be safely applied
on all devices in the Gen3 family without any side effect.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 81 +++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_regs.h | 23 ++++++++++
 4 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 7391dd95c733..4ed6f2340af0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -106,9 +106,62 @@ static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
  * Hardware Setup
  */
 
+struct dpll_info {
+	unsigned int output;
+	unsigned int fdpll;
+	unsigned int n;
+	unsigned int m;
+};
+
+static void rcar_du_dpll_divider(struct rcar_du_crtc *rcrtc,
+				 struct dpll_info *dpll,
+				 unsigned long input,
+				 unsigned long target)
+{
+	unsigned long best_diff = (unsigned long)-1;
+	unsigned long diff;
+	unsigned int fdpll;
+	unsigned int m;
+	unsigned int n;
+
+	for (n = 39; n < 120; n++) {
+		for (m = 0; m < 4; m++) {
+			for (fdpll = 1; fdpll < 32; fdpll++) {
+				unsigned long output;
+
+				/* 1/2 (FRQSEL=1) for duty rate 50% */
+				output = input * (n + 1) / (m + 1)
+				       / (fdpll + 1) / 2;
+
+				if (output >= 400000000)
+					continue;
+
+				diff = abs((long)output - (long)target);
+				if (best_diff > diff) {
+					best_diff = diff;
+					dpll->n = n;
+					dpll->m = m;
+					dpll->fdpll = fdpll;
+					dpll->output = output;
+				}
+
+				if (diff == 0)
+					goto done;
+			}
+		}
+	}
+
+done:
+	dev_dbg(rcrtc->group->dev->dev,
+		"output:%u, fdpll:%u, n:%u, m:%u, diff:%lu\n",
+		 dpll->output, dpll->fdpll, dpll->n, dpll->m,
+		 best_diff);
+}
+
 static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 {
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
+	struct rcar_du_device *rcdu = rcrtc->group->dev;
 	unsigned long mode_clock = mode->clock * 1000;
 	unsigned long clk;
 	u32 value;
@@ -124,12 +177,18 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 	escr = div | ESCR_DCLKSEL_CLKS;
 
 	if (rcrtc->extclock) {
+		struct dpll_info dpll = { 0 };
 		unsigned long extclk;
 		unsigned long extrate;
 		unsigned long rate;
 		u32 extdiv;
 
 		extclk = clk_get_rate(rcrtc->extclock);
+		if (rcdu->info->dpll_ch & (1 << rcrtc->index)) {
+			rcar_du_dpll_divider(rcrtc, &dpll, extclk, mode_clock);
+			extclk = dpll.output;
+		}
+
 		extdiv = DIV_ROUND_CLOSEST(extclk, mode_clock);
 		extdiv = clamp(extdiv, 1U, 64U) - 1;
 
@@ -140,7 +199,27 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		    abs((long)rate - (long)mode_clock)) {
 			dev_dbg(rcrtc->group->dev->dev,
 				"crtc%u: using external clock\n", rcrtc->index);
-			escr = extdiv | ESCR_DCLKSEL_DCLKIN;
+
+			if (rcdu->info->dpll_ch & (1 << rcrtc->index)) {
+				u32 dpllcr = DPLLCR_CODE | DPLLCR_CLKE
+					   | DPLLCR_FDPLL(dpll.fdpll)
+					   | DPLLCR_N(dpll.n) | DPLLCR_M(dpll.m)
+					   | DPLLCR_STBY;
+
+				if (rcrtc->index == 1)
+					dpllcr |= DPLLCR_PLCS1
+					       |  DPLLCR_INCS_DOTCLKIN1;
+				else
+					dpllcr |= DPLLCR_PLCS0
+					       |  DPLLCR_INCS_DOTCLKIN0;
+
+				rcar_du_group_write(rcrtc->group, DPLLCR,
+						    dpllcr);
+
+				escr = ESCR_DCLKSEL_DCLKIN | 1;
+			} else {
+				escr = ESCR_DCLKSEL_DCLKIN | extdiv;
+			}
 		}
 	}
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 327adb7a25c4..3d789e68ec13 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -162,6 +162,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 		},
 	},
 	.num_lvds = 1,
+	.dpll_ch =  BIT(1) | BIT(2),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7796_info = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 90eb209c244e..f8cd79488ece 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -65,6 +65,7 @@ struct rcar_du_device_info {
 	unsigned int num_crtcs;
 	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
 	unsigned int num_lvds;
+	unsigned int dpll_ch;
 };
 
 #define RCAR_DU_MAX_CRTCS		4
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index fedb0161e234..d5bae99d3cfe 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -277,6 +277,29 @@
 #define DEFR10_TSEL_H3_TCON1	(0 << 1) /* DEFR102 register only (DU2/DU3) */
 #define DEFR10_DEFE10		(1 << 0)
 
+#define DPLLCR			0x20044
+#define DPLLCR_CODE		(0x95 << 24)
+#define DPLLCR_PLCS1		(1 << 23)
+/*
+ * PLCS0 is bit 21, but H3 ES1.x requires bit 20 to be set as well. As bit 20
+ * isn't implemented by other SoC in the Gen3 family it can safely be set
+ * unconditionally.
+ */
+#define DPLLCR_PLCS0		(3 << 20)
+#define DPLLCR_CLKE		(1 << 18)
+#define DPLLCR_FDPLL(n)		((n) << 12)
+#define DPLLCR_N(n)		((n) << 5)
+#define DPLLCR_M(n)		((n) << 3)
+#define DPLLCR_STBY		(1 << 2)
+#define DPLLCR_INCS_DOTCLKIN0	(0 << 0)
+#define DPLLCR_INCS_DOTCLKIN1	(1 << 1)
+
+#define DPLLC2R			0x20048
+#define DPLLC2R_CODE		(0x95 << 24)
+#define DPLLC2R_SELC		(1 << 12)
+#define DPLLC2R_M(n)		((n) << 8)
+#define DPLLC2R_FDPLL(n)	((n) << 0)
+
 /* -----------------------------------------------------------------------------
  * Display Timing Generation Registers
  */
-- 
Regards,

Laurent Pinchart
