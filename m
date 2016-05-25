Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:10020 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754008AbcEYI6g (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 25 May 2016 04:58:36 -0400
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta24.fe.bosch.de (Postfix) with ESMTP id 0B865D80239
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 May 2016 10:58:35 +0200 (CEST)
Received: from FE-HUB1001.de.bosch.com (vsgw23.fe.internet.bosch.com [10.4.98.23])
	by vsmta12.fe.internet.bosch.com (Postfix) with ESMTP id BD09D1B80522
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 May 2016 10:58:34 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH 4/4] drm: rcar-du: Use product register framework
Date: Wed, 25 May 2016 10:58:28 +0200
Message-ID: <1464166708-18320-5-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Instead of hard coding the product register in the rcar-du, use
the framework for it to get the SoC version and the revision needed
for the enabling the workaround.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index e10943b..ee639a6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -13,6 +13,7 @@
 
 #include <linux/clk.h>
 #include <linux/mutex.h>
+#include <linux/soc/renesas/rcar3-prr.h>
 
 #include <drm/drmP.h>
 #include <drm/drm_atomic.h>
@@ -30,12 +31,6 @@
 #include "rcar_du_regs.h"
 #include "rcar_du_vsp.h"
 
-#define PRODUCT_REG	0xfff00044
-#define PRODUCT_H3_BIT	(0x4f << 8)
-#define PRODUCT_MASK	(0x7f << 8)
-#define CUT_ES1		(0x00)
-#define CUT_ES1_MASK	(0x000000ff)
-
 static u32 rcar_du_crtc_read(struct rcar_du_crtc *rcrtc, u32 reg)
 {
 	struct rcar_du_device *rcdu = rcrtc->group->dev;
@@ -167,7 +162,6 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 	u32 div;
 	u32 dpll_reg = 0;
 	struct dpll_info *dpll;
-	void __iomem *product_reg;
 	bool h3_es1_workaround = false;
 
 	dpll = kzalloc(sizeof(*dpll), GFP_KERNEL);
@@ -175,11 +169,8 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		return;
 
 	/* DU2 DPLL Clock Select bit workaround in R-Car H3(ES1.0) */
-	product_reg = ioremap(PRODUCT_REG, 0x04);
-	if (((readl(product_reg) & PRODUCT_MASK) == PRODUCT_H3_BIT)
-		&& ((readl(product_reg) & CUT_ES1_MASK) == CUT_ES1))
+	if (cpu_is_rcar3_h3() && revision_is_rcar3_es1())
 		h3_es1_workaround = true;
-	iounmap(product_reg);
 
 	/* Compute the clock divisor and select the internal or external dot
 	 * clock based on the requested frequency.
-- 
2.8.0
