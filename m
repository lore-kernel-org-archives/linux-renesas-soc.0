Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:31381 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732753AbeHNQiB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Aug 2018 12:38:01 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: [PROTO][PATCH 06/10] drm: rcar-du: Fix procedure for extal and dotclkin selection
Date: Tue, 14 Aug 2018 15:50:00 +0200
Message-Id: <1534254604-24204-7-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

This patch corrects that the extal clock used with the fixed value
is acquired from the device tree.
Also, it is possible to select extal or dotclkin for R8A77995 and
R8A77990. This patch adds its selection procedure.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c   | 12 ++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h   |  2 ++
 drivers/gpu/drm/rcar-du/rcar_lvds_regs.h |  4 +---
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index a903456..4e22d40 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -942,10 +942,22 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 		return PTR_ERR(rcrtc->clock);
 	}
 
+	sprintf(clk_name, "extal");
+	clk = devm_clk_get(rcdu->dev, clk_name);
+	if (!IS_ERR(clk)) {
+		rcrtc->extclock = clk;
+		rcrtc->extal_use = true;
+	} else if (PTR_ERR(rcrtc->clock) == -EPROBE_DEFER) {
+		dev_info(rcdu->dev, "can't get extal clock %u\n",
+			 hwindex);
+		return -EPROBE_DEFER;
+	}
+
 	sprintf(clk_name, "dclkin.%u", hwindex);
 	clk = devm_clk_get(rcdu->dev, clk_name);
 	if (!IS_ERR(clk)) {
 		rcrtc->extclock = clk;
+		rcrtc->extal_use = false;
 	} else if (PTR_ERR(rcrtc->clock) == -EPROBE_DEFER) {
 		dev_info(rcdu->dev, "can't get external clock %u\n", hwindex);
 		return -EPROBE_DEFER;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 65de551..fa27104 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -45,6 +45,7 @@ struct rcar_du_vsp;
  * @vsp: VSP feeding video to this CRTC
  * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
  * @lvds_ch: index of LVDS
+ * @extal_use: extal clock use
  */
 struct rcar_du_crtc {
 	struct drm_crtc crtc;
@@ -69,6 +70,7 @@ struct rcar_du_crtc {
 	struct rcar_du_vsp *vsp;
 	unsigned int vsp_pipe;
 	int lvds_ch;
+	bool extal_use;
 };
 
 #define to_rcar_crtc(c)	container_of(c, struct rcar_du_crtc, crtc)
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h b/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
index e37db95..4899062 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
@@ -46,15 +46,13 @@
 #define LVDPLLCR_PLLDIVCNT_148M		(0x046c1 << 0)
 #define LVDPLLCR_PLLDIVCNT_MASK		(0x7ffff << 0)
 
-/* R-Car D3 */
 #define LVDPLLCR_PLLON			(1 << 22)
 #define LVDPLLCR_PLLSEL_PLL0		(0 << 20)
 #define LVDPLLCR_PLLSEL_LVX		(1 << 20)
 #define LVDPLLCR_PLLSEL_PLL1		(2 << 20)
 #define LVDPLLCR_CKSEL_LVX		(1 << 17)
 #define LVDPLLCR_CKSEL_EXTAL		(3 << 17)
-#define LVDPLLCR_CKSEL_DU_DOTCLKIN0	(5 << 17)
-#define LVDPLLCR_CKSEL_DU_DOTCLKIN1	(7 << 17)
+#define LVDPLLCR_CKSEL_DU_DOTCLKIN(n)	((5 + (n) * 2) << 17)
 #define LVDPLLCR_OCKSEL_7		(0 << 16)
 #define LVDPLLCR_OCKSEL_NOT_DIVIDED	(1 << 16)
 #define LVDPLLCR_STP_CLKOUTE1_DIS	(0 << 14)
-- 
2.7.4
