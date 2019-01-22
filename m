Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF2BC282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 22:54:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0659520870
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 22:54:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j2SdW2PR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbfAVWyO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 17:54:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60682 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbfAVWyO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 17:54:14 -0500
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8B6F1231;
        Tue, 22 Jan 2019 23:54:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1548197651;
        bh=9wtokjv1ZtUrVB/XqwXMZ+IRBjStV3EcVlhm6tvkkWo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j2SdW2PR/dRurlrk1V2ZCXMbz6A2asMNwToDCV7nofHVAl348PHDTcsm7Stl2CJtc
         uj1W+LoWMYnT80X2EATlsvgM4EzDv4faDnTRWZS4uhHi3kjto6u8qgNUV4yJnERqU6
         cNGvYhpPenYPyjVqDbPnQQr9PD+q5YJV9f5G6LGc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 3/6] drm: rcar-du: lvds: Add API to enable/disable clock output
Date:   Wed, 23 Jan 2019 00:54:02 +0200
Message-Id: <20190122225405.7815-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190122225405.7815-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190122225405.7815-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On the D3 and E3 platforms, the LVDS internal PLL supplies the pixel
clock to the DU. This works automatically for LVDS outputs as the LVDS
encoder is enabled through the bridge API, enabling the internal PLL and
clock output. However, when using the DU DPAD output with the LVDS
outputs turned off, the LVDS PLL needs to be controlled manually. Add an
API to do so, to be called by the DU driver.

The drivers/gpu/drm/rcar-du/ directory has to be treated as obj-y
unconditionally, as the LVDS driver could be built-in while the DU
driver is compiled as a module.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Provide stubs when the LVDS driver is not available
- Export the LVDS driver API symbols
- Fix dependency with the DU and LVDS drivers to prevent DU=y && LVDS=m
- Always treat drivers/gpu/drm/rcar-du/ as obj-y
---
 drivers/gpu/drm/Makefile            |  2 +-
 drivers/gpu/drm/rcar-du/Kconfig     |  1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 77 +++++++++++++++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_lvds.h | 27 ++++++++++
 4 files changed, 96 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_lvds.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ce8d1d384319..59e426704755 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -81,7 +81,7 @@ obj-$(CONFIG_DRM_UDL) += udl/
 obj-$(CONFIG_DRM_AST) += ast/
 obj-$(CONFIG_DRM_ARMADA) += armada/
 obj-$(CONFIG_DRM_ATMEL_HLCDC)	+= atmel-hlcdc/
-obj-$(CONFIG_DRM_RCAR_DU) += rcar-du/
+obj-y			+= rcar-du/
 obj-$(CONFIG_DRM_SHMOBILE) +=shmobile/
 obj-y			+= omapdrm/
 obj-$(CONFIG_DRM_SUN4I) += sun4i/
diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 225141656e19..7c36e2777a15 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -4,6 +4,7 @@ config DRM_RCAR_DU
 	depends on DRM && OF
 	depends on ARM || ARM64
 	depends on ARCH_RENESAS || COMPILE_TEST
+	imply DRM_RCAR_LVDS
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index b21906b81f10..7b9d8cccead4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -22,6 +22,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_panel.h>
 
+#include "rcar_lvds.h"
 #include "rcar_lvds_regs.h"
 
 struct rcar_lvds;
@@ -182,8 +183,9 @@ struct pll_info {
 
 static void rcar_lvds_d3_e3_pll_calc(struct rcar_lvds *lvds, struct clk *clk,
 				     unsigned long target, struct pll_info *pll,
-				     u32 clksel)
+				     u32 clksel, bool dot_clock_only)
 {
+	unsigned int div7 = dot_clock_only ? 1 : 7;
 	unsigned long output;
 	unsigned long fin;
 	unsigned int m_min;
@@ -217,9 +219,9 @@ static void rcar_lvds_d3_e3_pll_calc(struct rcar_lvds *lvds, struct clk *clk,
 	 *                     `------------> | |
 	 *                                    |/
 	 *
-	 * The /7 divider is optional when the LVDS PLL is used to generate a
-	 * dot clock for the DU RGB output, without using the LVDS encoder. We
-	 * don't support this configuration yet.
+	 * The /7 divider is optional, it is enabled when the LVDS PLL is used
+	 * to drive the LVDS encoder, and disabled when  used to generate a dot
+	 * clock for the DU RGB output, without using the LVDS encoder.
 	 *
 	 * The PLL allowed input frequency range is 12 MHz to 192 MHz.
 	 */
@@ -279,7 +281,7 @@ static void rcar_lvds_d3_e3_pll_calc(struct rcar_lvds *lvds, struct clk *clk,
 				 * the PLL, followed by a an optional fixed /7
 				 * divider.
 				 */
-				fout = fvco / (1 << e) / 7;
+				fout = fvco / (1 << e) / div7;
 				div = DIV_ROUND_CLOSEST(fout, target);
 				diff = abs(fout / div - target);
 
@@ -300,7 +302,7 @@ static void rcar_lvds_d3_e3_pll_calc(struct rcar_lvds *lvds, struct clk *clk,
 
 done:
 	output = fin * pll->pll_n / pll->pll_m / (1 << pll->pll_e)
-	       / 7 / pll->div;
+	       / div7 / pll->div;
 	error = (long)(output - target) * 10000 / (long)target;
 
 	dev_dbg(lvds->dev,
@@ -310,17 +312,18 @@ static void rcar_lvds_d3_e3_pll_calc(struct rcar_lvds *lvds, struct clk *clk,
 		pll->pll_m, pll->pll_n, pll->pll_e, pll->div);
 }
 
-static void rcar_lvds_pll_setup_d3_e3(struct rcar_lvds *lvds, unsigned int freq)
+static void __rcar_lvds_pll_setup_d3_e3(struct rcar_lvds *lvds,
+					unsigned int freq, bool dot_clock_only)
 {
 	struct pll_info pll = { .diff = (unsigned long)-1 };
 	u32 lvdpllcr;
 
 	rcar_lvds_d3_e3_pll_calc(lvds, lvds->clocks.dotclkin[0], freq, &pll,
-				 LVDPLLCR_CKSEL_DU_DOTCLKIN(0));
+				 LVDPLLCR_CKSEL_DU_DOTCLKIN(0), dot_clock_only);
 	rcar_lvds_d3_e3_pll_calc(lvds, lvds->clocks.dotclkin[1], freq, &pll,
-				 LVDPLLCR_CKSEL_DU_DOTCLKIN(1));
+				 LVDPLLCR_CKSEL_DU_DOTCLKIN(1), dot_clock_only);
 	rcar_lvds_d3_e3_pll_calc(lvds, lvds->clocks.extal, freq, &pll,
-				 LVDPLLCR_CKSEL_EXTAL);
+				 LVDPLLCR_CKSEL_EXTAL, dot_clock_only);
 
 	lvdpllcr = LVDPLLCR_PLLON | pll.clksel | LVDPLLCR_CLKOUT
 		 | LVDPLLCR_PLLN(pll.pll_n - 1) | LVDPLLCR_PLLM(pll.pll_m - 1);
@@ -329,6 +332,9 @@ static void rcar_lvds_pll_setup_d3_e3(struct rcar_lvds *lvds, unsigned int freq)
 		lvdpllcr |= LVDPLLCR_STP_CLKOUTE | LVDPLLCR_OUTCLKSEL
 			 |  LVDPLLCR_PLLE(pll.pll_e - 1);
 
+	if (dot_clock_only)
+		lvdpllcr |= LVDPLLCR_OCKSEL;
+
 	rcar_lvds_write(lvds, LVDPLLCR, lvdpllcr);
 
 	if (pll.div > 1)
@@ -342,6 +348,57 @@ static void rcar_lvds_pll_setup_d3_e3(struct rcar_lvds *lvds, unsigned int freq)
 		rcar_lvds_write(lvds, LVDDIV, 0);
 }
 
+static void rcar_lvds_pll_setup_d3_e3(struct rcar_lvds *lvds, unsigned int freq)
+{
+	__rcar_lvds_pll_setup_d3_e3(lvds, freq, false);
+}
+
+/* -----------------------------------------------------------------------------
+ * Clock - D3/E3 only
+ */
+
+int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq)
+{
+	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
+	int ret;
+
+	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
+		return -ENODEV;
+
+	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
+
+	WARN_ON(lvds->enabled);
+
+	ret = clk_prepare_enable(lvds->clocks.mod);
+	if (ret < 0)
+		return ret;
+
+	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
+
+	lvds->enabled = true;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rcar_lvds_clk_enable);
+
+void rcar_lvds_clk_disable(struct drm_bridge *bridge)
+{
+	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
+
+	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
+		return;
+
+	dev_dbg(lvds->dev, "disabling LVDS PLL\n");
+
+	WARN_ON(!lvds->enabled);
+
+	rcar_lvds_write(lvds, LVDPLLCR, 0);
+
+	clk_disable_unprepare(lvds->clocks.mod);
+
+	lvds->enabled = false;
+}
+EXPORT_SYMBOL_GPL(rcar_lvds_clk_disable);
+
 /* -----------------------------------------------------------------------------
  * Bridge
  */
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.h b/drivers/gpu/drm/rcar-du/rcar_lvds.h
new file mode 100644
index 000000000000..a709cae1bc32
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * rcar_lvds.h  --  R-Car LVDS Encoder
+ *
+ * Copyright (C) 2013-2018 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#ifndef __RCAR_LVDS_H__
+#define __RCAR_LVDS_H__
+
+struct drm_bridge;
+
+#if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
+int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq);
+void rcar_lvds_clk_disable(struct drm_bridge *bridge);
+#else
+static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
+				       unsigned long freq)
+{
+	return -ENOSYS;
+}
+static inline void rcar_lvds_clk_disable(struct drm_bridge *bridge) { }
+#endif /* CONFIG_DRM_RCAR_LVDS */
+
+#endif /* __RCAR_LVDS_H__ */
-- 
Regards,

Laurent Pinchart

