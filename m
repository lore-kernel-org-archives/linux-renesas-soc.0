Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35201 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934543AbcKKRIK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 12:08:10 -0500
Received: by mail-wm0-f65.google.com with SMTP id a20so10775252wme.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2016 09:08:09 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
Cc: kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org,
        airlied@linux.ie, koji.matsuoka.xm@renesas.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 05/10] drm: rcar-du: Add DPLL support
Date: Fri, 11 Nov 2016 18:07:41 +0100
Message-Id: <1478884066-1090-6-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

The workaround of DPLLCR2 register is required at the time of
H3(WS1.0) and H3(WS1.1). This patch adds procedure to apply
the workaround by revision.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
[uli: replace PRR hack with soc_device_match()]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 88 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |  8 +++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   |  5 ++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  3 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.h |  7 ++-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 21 +++++++-
 6 files changed, 128 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 7316fc7..85e3c53 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -13,6 +13,7 @@
 
 #include <linux/clk.h>
 #include <linux/mutex.h>
+#include <linux/sys_soc.h>
 
 #include <drm/drmP.h>
 #include <drm/drm_atomic.h>
@@ -106,14 +107,70 @@ static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
  * Hardware Setup
  */
 
+static void rcar_du_dpll_divider(struct dpll_info *dpll, unsigned int extclk,
+				 unsigned int mode_clock)
+{
+	unsigned long dpllclk;
+	unsigned long diff;
+	unsigned long n, m, fdpll;
+	bool match_flag = false;
+	bool clk_diff_set = true;
+
+	for (n = 39; n < 120; n++) {
+		for (m = 0; m < 4; m++) {
+			for (fdpll = 1; fdpll < 32; fdpll++) {
+				/* 1/2 (FRQSEL=1) for duty rate 50% */
+				dpllclk = extclk * (n + 1) / (m + 1)
+						 / (fdpll + 1) / 2;
+				if (dpllclk >= 400000000)
+					continue;
+
+				diff = abs((long)dpllclk - (long)mode_clock);
+				if (clk_diff_set ||
+					((diff == 0) || (dpll->diff > diff))) {
+					dpll->diff = diff;
+					dpll->n = n;
+					dpll->m = m;
+					dpll->fdpll = fdpll;
+					dpll->dpllclk = dpllclk;
+
+					if (clk_diff_set)
+						clk_diff_set = false;
+
+					if (diff == 0) {
+						match_flag = true;
+						break;
+					}
+				}
+			}
+			if (match_flag)
+				break;
+		}
+		if (match_flag)
+			break;
+	}
+}
+
+static const struct soc_device_attribute r8a7795es1[] = {
+	{ .soc_id = "r8a7795", .revision = "ES1.*" },
+	{ /* sentinel */ }
+};
+
 static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 {
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
+	struct rcar_du_device *rcdu = rcrtc->group->dev;
 	unsigned long mode_clock = mode->clock * 1000;
 	unsigned long clk;
 	u32 value;
 	u32 escr;
 	u32 div;
+	u32 dpll_reg = 0;
+	struct dpll_info *dpll;
+
+	dpll = kzalloc(sizeof(*dpll), GFP_KERNEL);
+	if (dpll == NULL)
+		return;
 
 	/* Compute the clock divisor and select the internal or external dot
 	 * clock based on the requested frequency.
@@ -130,6 +187,15 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		u32 extdiv;
 
 		extclk = clk_get_rate(rcrtc->extclock);
+
+		if (rcdu->info->dpll_ch & (0x01 << rcrtc->index)) {
+			rcar_du_dpll_divider(dpll, extclk, mode_clock);
+			extclk = dpll->dpllclk;
+			dev_dbg(rcrtc->group->dev->dev,
+				"dpllclk:%d, fdpll:%d, n:%d, m:%d, diff:%d\n",
+				 dpll->dpllclk, dpll->fdpll, dpll->n, dpll->m,
+				 dpll->diff);
+		}
 		extdiv = DIV_ROUND_CLOSEST(extclk, mode_clock);
 		extdiv = clamp(extdiv, 1U, 64U) - 1;
 
@@ -140,7 +206,27 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		    abs((long)rate - (long)mode_clock)) {
 			dev_dbg(rcrtc->group->dev->dev,
 				"crtc%u: using external clock\n", rcrtc->index);
-			escr = extdiv | ESCR_DCLKSEL_DCLKIN;
+			if (rcdu->info->dpll_ch & (0x01 << rcrtc->index)) {
+				escr = ESCR_DCLKSEL_DCLKIN | 0x01;
+				dpll_reg =  DPLLCR_CODE | DPLLCR_M(dpll->m) |
+					DPLLCR_FDPLL(dpll->fdpll) |
+					DPLLCR_CLKE | DPLLCR_N(dpll->n) |
+					DPLLCR_STBY;
+
+				if (rcrtc->index == DU_CH_1)
+					dpll_reg |= (DPLLCR_PLCS1 |
+						DPLLCR_INCS_DPLL01_DOTCLKIN13);
+				if (rcrtc->index == DU_CH_2) {
+					dpll_reg |= (DPLLCR_PLCS0 |
+						DPLLCR_INCS_DPLL01_DOTCLKIN02);
+					if (soc_device_match(r8a7795es1))
+						dpll_reg |= (0x01 << 21);
+				}
+
+				rcar_du_group_write(rcrtc->group, DPLLCR,
+								  dpll_reg);
+			} else
+				escr = extdiv | ESCR_DCLKSEL_DCLKIN;
 		}
 	}
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 459e539..9a56cc7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -54,6 +54,14 @@ struct rcar_du_crtc {
 	struct rcar_du_vsp *vsp;
 };
 
+struct dpll_info {
+	unsigned int dpllclk;
+	unsigned int diff;
+	unsigned int fdpll;
+	unsigned int n;
+	unsigned int m;
+};
+
 #define to_rcar_crtc(c)	container_of(c, struct rcar_du_crtc, crtc)
 
 enum rcar_du_output {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 4d0ae8a..d968fa9 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -55,6 +55,7 @@ static const struct rcar_du_device_info rcar_du_r8a7779_info = {
 		},
 	},
 	.num_lvds = 0,
+	.dpll_ch =  0,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7790_info = {
@@ -84,6 +85,7 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 		},
 	},
 	.num_lvds = 2,
+	.dpll_ch =  0,
 };
 
 /* M2-W (r8a7791) and M2-N (r8a7793) are identical */
@@ -108,6 +110,7 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 		},
 	},
 	.num_lvds = 1,
+	.dpll_ch =  0,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7794_info = {
@@ -131,6 +134,7 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 		},
 	},
 	.num_lvds = 0,
+	.dpll_ch =  0,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7795_info = {
@@ -165,6 +169,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 		},
 	},
 	.num_lvds = 1,
+	.dpll_ch =  BIT(1) | BIT(2),
 };
 
 static const struct of_device_id rcar_du_of_table[] = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index c9db610..6366d24 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -1,7 +1,7 @@
 /*
  * rcar_du_drv.h  --  R-Car Display Unit DRM driver
  *
- * Copyright (C) 2013-2015 Renesas Electronics Corporation
+ * Copyright (C) 2013-2016 Renesas Electronics Corporation
  *
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  *
@@ -69,6 +69,7 @@ struct rcar_du_device_info {
 	unsigned int num_crtcs;
 	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
 	unsigned int num_lvds;
+	unsigned int dpll_ch;
 };
 
 #define RCAR_DU_MAX_CRTCS		4
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
index 8b91dd3..c1de338 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
@@ -1,7 +1,7 @@
 /*
  * rcar_du_plane.h  --  R-Car Display Unit Planes
  *
- * Copyright (C) 2013-2014 Renesas Electronics Corporation
+ * Copyright (C) 2013-2016 Renesas Electronics Corporation
  *
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  *
@@ -34,6 +34,11 @@ enum rcar_du_plane_source {
 	RCAR_DU_PLANE_VSPD1,
 };
 
+#define DU_CH_0		0
+#define DU_CH_1		1
+#define DU_CH_2		2
+#define DU_CH_3		3
+
 struct rcar_du_plane {
 	struct drm_plane plane;
 	struct rcar_du_group *group;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index fedb016..513a716 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -1,7 +1,7 @@
 /*
  * rcar_du_regs.h  --  R-Car Display Unit Registers Definitions
  *
- * Copyright (C) 2013-2015 Renesas Electronics Corporation
+ * Copyright (C) 2013-2016 Renesas Electronics Corporation
  *
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  *
@@ -277,6 +277,25 @@
 #define DEFR10_TSEL_H3_TCON1	(0 << 1) /* DEFR102 register only (DU2/DU3) */
 #define DEFR10_DEFE10		(1 << 0)
 
+#define DPLLCR			0x20044
+#define DPLLCR_CODE		(0x95 << 24)
+#define DPLLCR_PLCS1		(1 << 23)
+#define DPLLCR_PLCS0		(1 << 20)
+#define DPLLCR_CLKE		(1 << 18)
+#define DPLLCR_FDPLL(n)		((n) << 12)	/* n=0 Setting prohibited */
+/* H'00 to H'26, H'78 to H'7F: Setting prohibited.*/
+#define DPLLCR_N(n)		((n) << 5)
+#define DPLLCR_M(n)		((n) << 3)
+#define DPLLCR_STBY		(1 << 2)
+#define DPLLCR_INCS_DPLL01_DOTCLKIN02	(0 << 0)
+#define DPLLCR_INCS_DPLL01_DOTCLKIN13	(1 << 1)
+
+#define DPLLC2R			0x20048
+#define DPLLC2R_CODE		(0x95 << 24)
+#define DPLLC2R_SELC		(1 << 12)
+#define DPLLC2R_M(n)		((n) << 8)
+#define DPLLC2R_FDPLL(n)	((n) << 0)	/* n=0 Setting prohibited */
+
 /* -----------------------------------------------------------------------------
  * Display Timing Generation Registers
  */
-- 
2.7.4
