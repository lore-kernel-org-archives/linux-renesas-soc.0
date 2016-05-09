Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:57396 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751409AbcEIHPp (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 03:15:45 -0400
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta23.fe.bosch.de (Postfix) with ESMTP id 6CB6915800EB
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2016 09:15:44 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta12.fe.internet.bosch.com (Postfix) with ESMTP id 28F791B8043B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2016 09:15:44 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH 08/10] clk: renesas: rcar-gen3: Obtain MD pin value using boot-mode-reg
Date: Mon, 9 May 2016 09:13:59 +0200
Message-ID: <1462778041-19595-9-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Dirk Behme <dirk.behme@gmail.com>

Use new boot mode reg infrastructure to obtain the mode pin
value for initialising clocks for for R-Car Gen3 SoCs.

Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 11 ++++++++++-
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 11 ++++++++++-
 drivers/clk/renesas/rcar-gen3-cpg.c    | 17 -----------------
 drivers/clk/renesas/rcar-gen3-cpg.h    |  1 -
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index e53aff5..23bd58f 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -18,6 +18,8 @@
 
 #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
 
+#include <misc/boot-mode-reg.h>
+
 #include "renesas-cpg-mssr.h"
 #include "rcar-gen3-cpg.h"
 
@@ -294,7 +296,14 @@ static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
 static int __init r8a7795_cpg_mssr_init(struct device *dev)
 {
 	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
-	u32 cpg_mode = rcar_gen3_read_mode_pins();
+	u32 cpg_mode;
+	int err;
+
+	err = boot_mode_reg_get(&cpg_mode);
+	if (err) {
+		dev_err(dev, "Failed obtain boot mode: %i\n", err);
+		return err;
+	}
 
 	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
 	if (!cpg_pll_config->extal_div) {
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index c84b549..2ecb135 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -19,6 +19,8 @@
 
 #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
 
+#include <misc/boot-mode-reg.h>
+
 #include "renesas-cpg-mssr.h"
 #include "rcar-gen3-cpg.h"
 
@@ -159,7 +161,14 @@ static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
 static int __init r8a7796_cpg_mssr_init(struct device *dev)
 {
 	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
-	u32 cpg_mode = rcar_gen3_read_mode_pins();
+	u32 cpg_mode;
+	int err;
+
+	err = boot_mode_reg_get(&cpg_mode);
+	if (err) {
+		dev_err(dev, "Failed obtain boot mode: %i\n", err);
+		return err;
+	}
 
 	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
 	if (!cpg_pll_config->extal_div) {
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index bb4f2f9..9d76076 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -333,23 +333,6 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 					 __clk_get_name(parent), 0, mult, div);
 }
 
-/*
- * Reset register definitions.
- */
-#define MODEMR	0xe6160060
-
-u32 __init rcar_gen3_read_mode_pins(void)
-{
-	void __iomem *modemr = ioremap_nocache(MODEMR, 4);
-	u32 mode;
-
-	BUG_ON(!modemr);
-	mode = ioread32(modemr);
-	iounmap(modemr);
-
-	return mode;
-}
-
 int __init rcar_gen3_cpg_init(const struct rcar_gen3_cpg_pll_config *config,
 			      unsigned int clk_extalr)
 {
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index f699085..f788f48 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -33,7 +33,6 @@ struct rcar_gen3_cpg_pll_config {
 
 #define CPG_RCKCR	0x240
 
-u32 rcar_gen3_read_mode_pins(void);
 struct clk *rcar_gen3_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
 	struct clk **clks, void __iomem *base);
-- 
2.8.0
