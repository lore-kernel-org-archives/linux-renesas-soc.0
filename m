Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:23370 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732667AbeHNQiB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Aug 2018 12:38:01 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PROTO][PATCH 04/10] drm: rcar-du: lvds: LVDS PLL support
Date: Tue, 14 Aug 2018 15:49:58 +0200
Message-Id: <1534254604-24204-5-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In R-Car D3 and E3, the DU dot clock can be sourced from the LVDS PLL.
This patch enables that PLL if present.

Based on patch by Koji Matsuoka <koji.matsuoka.xm@renesas.com>.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c   |   3 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h   |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c    |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h    |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c  |  11 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c      | 212 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds_regs.h |  46 ++++++-
 7 files changed, 274 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 9153e7a..a903456 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -275,6 +275,9 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 			mode_clock, extrate, rate, escr);
 	}
 
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_LVDS_PLL))
+		escr = 0;
+
 	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? ESCR2 : ESCR,
 			    escr);
 	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? OTAR2 : OTAR, 0);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 7680cb2..65de551 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -44,6 +44,7 @@ struct rcar_du_vsp;
  * @group: CRTC group this CRTC belongs to
  * @vsp: VSP feeding video to this CRTC
  * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
+ * @lvds_ch: index of LVDS
  */
 struct rcar_du_crtc {
 	struct drm_crtc crtc;
@@ -67,6 +68,7 @@ struct rcar_du_crtc {
 	struct rcar_du_group *group;
 	struct rcar_du_vsp *vsp;
 	unsigned int vsp_pipe;
+	int lvds_ch;
 };
 
 #define to_rcar_crtc(c)	container_of(c, struct rcar_du_crtc, crtc)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index d930996..3338ef5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -299,7 +299,8 @@ static const struct rcar_du_device_info rcar_du_r8a77995_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
-		  | RCAR_DU_FEATURE_R8A77995_REGS,
+		  | RCAR_DU_FEATURE_R8A77995_REGS
+		  | RCAR_DU_FEATURE_LVDS_PLL,
 	.quirks = RCAR_DU_QUIRK_TVM_MASTER_ONLY,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 9355b58..6009b7d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -32,6 +32,7 @@ struct rcar_du_device;
 #define RCAR_DU_FEATURE_VSP1_SOURCE	(1 << 2)	/* Has inputs from VSP1 */
 #define RCAR_DU_FEATURE_R8A77965_REGS	(1 << 3)	/* Use R8A77965 registers */
 #define RCAR_DU_FEATURE_R8A77995_REGS	(1 << 4)	/* Use R8A77995 registers */
+#define RCAR_DU_FEATURE_LVDS_PLL	(1 << 5)	/* Use PLL in LVDS */
 
 #define RCAR_DU_QUIRK_ALIGN_128B	(1 << 0)	/* Align pitches to 128 bytes */
 #define RCAR_DU_QUIRK_TVM_MASTER_ONLY	(1 << 1)	/* Does not have TV switch/sync modes */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 371d780..44681e3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -126,8 +126,15 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 		 * are setup through per-group registers, only available when
 		 * the group has two channels.
 		 */
-		if ((rcdu->info->gen < 3 && rgrp->index == 0) ||
-		    (rcdu->info->gen == 3 &&  rgrp->num_crtcs > 1))
+		if (rcar_du_has(rcdu, RCAR_DU_FEATURE_LVDS_PLL))
+			rcar_du_group_write(rgrp,
+					    DIDSR, DIDSR_CODE |
+					    DIDSR_LCDS_LVDS0(1) |
+					    DIDSR_LCDS_LVDS0(0) |
+					    DIDSR_PDCS_CLK(1, 0) |
+					    DIDSR_PDCS_CLK(0, 0));
+		else if ((rcdu->info->gen < 3 && rgrp->index == 0) ||
+			 (rcdu->info->gen == 3 &&  rgrp->num_crtcs > 1))
 			rcar_du_group_write(rgrp, DIDSR, DIDSR_CODE);
 	}
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 4c39de3..cd55576 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -23,6 +23,8 @@
 #include <drm/drm_panel.h>
 
 #include "rcar_lvds_regs.h"
+#include "rcar_du_crtc.h"
+#include "rcar_du_drv.h"
 
 /* Keep in sync with the LVDCR0.LVMD hardware register values. */
 enum rcar_lvds_mode {
@@ -65,6 +67,15 @@ struct rcar_lvds {
 #define connector_to_rcar_lvds(connector) \
 	container_of(connector, struct rcar_lvds, connector)
 
+struct pll_info {
+	unsigned int pllclk;
+	unsigned int diff;
+	unsigned int clk_n;
+	unsigned int clk_m;
+	unsigned int clk_e;
+	unsigned int div;
+};
+
 static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
 {
 	iowrite32(data, lvds->mmio + reg);
@@ -155,6 +166,198 @@ static u32 rcar_lvds_lvdpllcr_gen3(unsigned int freq)
 		return LVDPLLCR_PLLDIVCNT_148M;
 }
 
+static void rcar_lvds_pll_calc(struct rcar_du_crtc *rcrtc,
+				     struct pll_info *pll, unsigned int in_fre,
+				     unsigned int mode_freq, bool edivider)
+{
+	unsigned long diff = (unsigned long)-1;
+	unsigned long fout, fpfd, fvco, n, m, e, div;
+	bool clk_diff_set = true;
+
+	if (in_fre < 12000000 || in_fre > 192000000)
+		return;
+
+	for (n = 0; n < 127; n++) {
+		if (n + 1 < 60 || n + 1 > 120)
+			continue;
+
+		for (m = 0; m < 7; m++) {
+			for (e = 0; e < 1; e++) {
+				if (edivider)
+					fout = (((in_fre / 1000) * (n + 1)) /
+						((m + 1) * (e + 1) * 2)) *
+						1000;
+				else
+					fout = (((in_fre / 1000) * (n + 1)) /
+						(m + 1)) * 1000;
+
+				if (fout > 1039500000)
+					continue;
+
+				fpfd  = (in_fre / (m + 1));
+				if (fpfd < 12000000 || fpfd > 24000000)
+					continue;
+
+				fvco  = (((in_fre / 1000) * (n + 1)) / (m + 1))
+					 * 1000;
+				if (fvco < 900000000 || fvco > 1800000000)
+					continue;
+
+				fout = fout / 7; /* 7 divider */
+
+				for (div = 0; div < 64; div++) {
+					diff = abs((long)(fout / (div + 1)) -
+					       (long)mode_freq);
+
+					if (clk_diff_set ||
+					    (diff == 0 ||
+					    pll->diff > diff)) {
+						pll->diff = diff;
+						pll->clk_n = n;
+						pll->clk_m = m;
+						pll->clk_e = e;
+						pll->pllclk = fout;
+						pll->div = div;
+
+						clk_diff_set = false;
+
+						if (diff == 0)
+							return;
+					}
+				}
+			}
+		}
+	}
+}
+
+static void rcar_lvds_pll_pre_start(struct rcar_lvds *lvds,
+				    struct rcar_du_crtc *rcrtc)
+{
+	const struct drm_display_mode *mode =
+				&rcrtc->crtc.state->adjusted_mode;
+	unsigned int mode_freq = mode->clock * 1000;
+	unsigned int ext_clk = 0;
+	struct pll_info *lvds_pll[2];
+	u32 clksel, cksel;
+	int i, ret;
+
+	if (rcrtc->extclock)
+		ext_clk = clk_get_rate(rcrtc->extclock);
+	else
+		dev_warn(lvds->dev, "external clock is not set\n");
+
+	dev_dbg(lvds->dev, "external clock %d Hz\n", ext_clk);
+
+	if (lvds->enabled)
+		return;
+
+	for (i = 0; i < 2; i++) {
+		lvds_pll[i] = kzalloc(sizeof(*lvds_pll), GFP_KERNEL);
+		if (!lvds_pll[i])
+			return;
+	}
+
+	/* software reset release */
+	reset_control_deassert(lvds->rst);
+
+	ret = clk_prepare_enable(lvds->clock);
+	if (ret < 0)
+		goto end;
+
+	for (i = 0; i < 2; i++) {
+		bool edivider;
+
+		if (i == 0)
+			edivider = true;
+		else
+			edivider = false;
+
+		rcar_lvds_pll_calc(rcrtc, lvds_pll[i], ext_clk,
+					 mode_freq, edivider);
+	}
+
+	dev_dbg(lvds->dev, "mode_frequency %d Hz\n", mode_freq);
+
+	if (lvds_pll[1]->diff >= lvds_pll[0]->diff) {
+		/* use E-edivider */
+		i = 0;
+		clksel = LVDPLLCR_OUTCLKSEL_AFTER |
+			 LVDPLLCR_STP_CLKOUTE1_EN;
+	} else {
+		/* do not use E-divider */
+		i = 1;
+		clksel = LVDPLLCR_OUTCLKSEL_BEFORE |
+			 LVDPLLCR_STP_CLKOUTE1_DIS;
+	}
+	dev_dbg(lvds->dev,
+		"E-divider %s\n", (i == 0 ? "is used" : "is not used"));
+
+	dev_dbg(lvds->dev,
+		"pllclk:%u, n:%u, m:%u, e:%u, diff:%u, div:%u\n",
+		 lvds_pll[i]->pllclk, lvds_pll[i]->clk_n, lvds_pll[i]->clk_m,
+		 lvds_pll[i]->clk_e, lvds_pll[i]->diff, lvds_pll[i]->div);
+
+	if (rcrtc->extal_use)
+		cksel = LVDPLLCR_CKSEL_EXTAL;
+	else
+		cksel = LVDPLLCR_CKSEL_DU_DOTCLKIN(rcrtc->index);
+
+	rcar_lvds_write(lvds, LVDPLLCR, LVDPLLCR_PLLON |
+			LVDPLLCR_OCKSEL_7 | clksel | LVDPLLCR_CLKOUT_ENABLE |
+			cksel | (lvds_pll[i]->clk_e << 10) |
+			(lvds_pll[i]->clk_n << 3) | lvds_pll[i]->clk_m);
+
+	if (lvds_pll[i]->div > 0)
+		rcar_lvds_write(lvds, LVDDIV, LVDDIV_DIVSEL |
+				LVDDIV_DIVRESET | lvds_pll[i]->div);
+	else
+		rcar_lvds_write(lvds, LVDDIV, 0);
+
+	dev_dbg(lvds->dev, "LVDPLLCR: 0x%x\n",
+		ioread32(lvds->mmio + LVDPLLCR));
+	dev_dbg(lvds->dev, "LVDDIV: 0x%x\n",
+		ioread32(lvds->mmio + LVDDIV));
+
+end:
+	for (i = 0; i < 2; i++)
+		kfree(lvds_pll[i]);
+}
+
+static void rcar_lvds_pll_start(struct rcar_lvds *lvds,
+			       struct rcar_du_crtc *rcrtc)
+{
+	u32 lvdhcr, lvdcr0;
+
+	rcar_lvds_write(lvds, LVDCTRCR, LVDCTRCR_CTR3SEL_ZERO |
+			LVDCTRCR_CTR2SEL_DISP | LVDCTRCR_CTR1SEL_VSYNC |
+			LVDCTRCR_CTR0SEL_HSYNC);
+
+	lvdhcr = LVDCHCR_CHSEL_CH(0, 0) | LVDCHCR_CHSEL_CH(1, 1) |
+		 LVDCHCR_CHSEL_CH(2, 2) | LVDCHCR_CHSEL_CH(3, 3);
+	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
+
+	rcar_lvds_write(lvds, LVDSTRIPE, 0);
+	/* Turn all the channels on. */
+	rcar_lvds_write(lvds, LVDCR1,
+			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
+			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) |
+			LVDCR1_CLKSTBY);
+	/*
+	 * Turn the PLL on, set it to LVDS normal mode, wait for the startup
+	 * delay and turn the output on.
+	 */
+	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_PWD;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+
+	lvdcr0 |= LVDCR0_LVEN;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+
+	lvdcr0 |= LVDCR0_LVRES;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+
+	lvds->enabled = true;
+}
+
 static void rcar_lvds_enable(struct drm_bridge *bridge)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
@@ -164,6 +367,7 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	 * do we get a state pointer?
 	 */
 	struct drm_crtc *crtc = lvds->bridge.encoder->crtc;
+	struct rcar_du_device *rcdu = to_rcar_crtc(crtc)->group->dev;
 	u32 lvdpllcr;
 	u32 lvdhcr;
 	u32 lvdcr0;
@@ -171,6 +375,12 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 
 	WARN_ON(lvds->enabled);
 
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_LVDS_PLL)) {
+		rcar_lvds_pll_pre_start(lvds, to_rcar_crtc(crtc));
+		rcar_lvds_pll_start(lvds, to_rcar_crtc(crtc));
+		return;
+	}
+
 	ret = clk_prepare_enable(lvds->clock);
 	if (ret < 0)
 		return;
@@ -264,6 +474,7 @@ static void rcar_lvds_disable(struct drm_bridge *bridge)
 
 	rcar_lvds_write(lvds, LVDCR0, 0);
 	rcar_lvds_write(lvds, LVDCR1, 0);
+	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
 	clk_disable_unprepare(lvds->clock);
 
@@ -522,6 +733,7 @@ static const struct of_device_id rcar_lvds_of_table[] = {
 	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a7796-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a77970-lvds", .data = &rcar_lvds_r8a77970_info },
+	{ .compatible = "renesas,r8a77995-lvds", .data = &rcar_lvds_gen3_info },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h b/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
index 2896835..e37db95 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
@@ -21,7 +21,7 @@
 #define LVDCR0_PLLON			(1 << 4)
 #define LVDCR0_PWD			(1 << 2)		/* Gen3 only */
 #define LVDCR0_BEN			(1 << 2)		/* Gen2 only */
-#define LVDCR0_LVEN			(1 << 1)		/* Gen2 only */
+#define LVDCR0_LVEN			(1 << 1)
 #define LVDCR0_LVRES			(1 << 0)
 
 #define LVDCR1				0x0004
@@ -46,6 +46,24 @@
 #define LVDPLLCR_PLLDIVCNT_148M		(0x046c1 << 0)
 #define LVDPLLCR_PLLDIVCNT_MASK		(0x7ffff << 0)
 
+/* R-Car D3 */
+#define LVDPLLCR_PLLON			(1 << 22)
+#define LVDPLLCR_PLLSEL_PLL0		(0 << 20)
+#define LVDPLLCR_PLLSEL_LVX		(1 << 20)
+#define LVDPLLCR_PLLSEL_PLL1		(2 << 20)
+#define LVDPLLCR_CKSEL_LVX		(1 << 17)
+#define LVDPLLCR_CKSEL_EXTAL		(3 << 17)
+#define LVDPLLCR_CKSEL_DU_DOTCLKIN0	(5 << 17)
+#define LVDPLLCR_CKSEL_DU_DOTCLKIN1	(7 << 17)
+#define LVDPLLCR_OCKSEL_7		(0 << 16)
+#define LVDPLLCR_OCKSEL_NOT_DIVIDED	(1 << 16)
+#define LVDPLLCR_STP_CLKOUTE1_DIS	(0 << 14)
+#define LVDPLLCR_STP_CLKOUTE1_EN	(1 << 14)
+#define LVDPLLCR_OUTCLKSEL_BEFORE	(0 << 12)
+#define LVDPLLCR_OUTCLKSEL_AFTER	(1 << 12)
+#define LVDPLLCR_CLKOUT_DISABLE		(0 << 11)
+#define LVDPLLCR_CLKOUT_ENABLE		(1 << 11)
+
 #define LVDCTRCR			0x000c
 #define LVDCTRCR_CTR3SEL_ZERO		(0 << 12)
 #define LVDCTRCR_CTR3SEL_ODD		(1 << 12)
@@ -74,4 +92,30 @@
 #define LVDCHCR_CHSEL_CH(n, c)		((((c) - (n)) & 3) << ((n) * 4))
 #define LVDCHCR_CHSEL_MASK(n)		(3 << ((n) * 4))
 
+#define LVDSTRIPE			0x0014
+#define LVDSTRIPE_ST_TRGSEL_DISP	(0 << 2)
+#define LVDSTRIPE_ST_TRGSEL_HSYNC_R	(1 << 2)
+#define LVDSTRIPE_ST_TRGSEL_HSYNC_F	(2 << 2)
+
+#define LVDSTRIPE_ST_SWAP_NORMAL	(0 << 1)
+#define LVDSTRIPE_ST_SWAP_SWAP		(1 << 1)
+#define LVDSTRIPE_ST_ON			(1 << 0)
+
+#define LVDSCR				0x0018
+#define LVDSCR_DEPTH_DP1		(0 << 29)
+#define LVDSCR_DEPTH_DP2		(1 << 29)
+#define LVDSCR_DEPTH_DP3		(2 << 29)
+#define LVDSCR_BANDSET_10KHZ_LESS_THAN	(1 << 28)
+#define LVDSCR_SDIV_SR1			(0 << 22)
+#define LVDSCR_SDIV_SR2			(1 << 22)
+#define LVDSCR_SDIV_SR4			(2 << 22)
+#define LVDSCR_SDIV_SR8			(3 << 22)
+#define LVDSCR_MODE_DOWN		(1 << 21)
+#define LVDSCR_RSTN_ENABLE		(1 << 20)
+
+#define LVDDIV				0x001c
+#define LVDDIV_DIVSEL			(1 << 8)
+#define LVDDIV_DIVRESET			(1 << 7)
+#define LVDDIV_DIVSTP			(1 << 6)
+
 #endif /* __RCAR_LVDS_REGS_H__ */
-- 
2.7.4
