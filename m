Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:54507 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752518AbcELI3N (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 04:29:13 -0400
Received: from vsmta11.fe.internet.bosch.com (unknown [10.4.98.51])
	by imta24.fe.bosch.de (Postfix) with ESMTP id 9510DD8021B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:29:11 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta11.fe.internet.bosch.com (Postfix) with ESMTP id 55A3D23802C3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:29:11 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 3/6] clk: renesas: rcar-gen3: Obtain MD pin values using syscon/regmap
Date: Thu, 12 May 2016 10:27:18 +0200
Message-ID: <1463041641-27485-4-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
References: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Obtain the values of the mode pins by reading the Mode Monitoring
Register (MODEMR) using syscon and regmap. The syscon device and
register offset to use are obtained from the "renesas,modemr" property
in DT.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 15 ++++++++++++++-
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 15 ++++++++++++++-
 drivers/clk/renesas/rcar-gen3-cpg.c    | 17 -----------------
 drivers/clk/renesas/rcar-gen3-cpg.h    |  1 -
 4 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index e53aff5..f956a1b 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -15,6 +15,9 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
 
 #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
 
@@ -294,7 +297,17 @@ static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
 static int __init r8a7795_cpg_mssr_init(struct device *dev)
 {
 	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
-	u32 cpg_mode = rcar_gen3_read_mode_pins();
+	struct device_node *np = dev->of_node;
+	struct regmap *regmap;
+	u32 cpg_mode, reg;
+
+	regmap = syscon_regmap_lookup_by_phandle(np, "renesas,modemr");
+	if (IS_ERR(regmap) ||
+	    of_property_read_u32_index(np, "renesas,modemr", 1, &reg) ||
+	    regmap_read(regmap, reg, &cpg_mode)) {
+		dev_err(dev, "Failed to parse renesas,modemr\n");
+		return -EINVAL;
+	}
 
 	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
 	if (!cpg_pll_config->extal_div) {
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index c84b549..2a0375d 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -16,6 +16,9 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
 
 #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
 
@@ -159,7 +162,17 @@ static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
 static int __init r8a7796_cpg_mssr_init(struct device *dev)
 {
 	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
-	u32 cpg_mode = rcar_gen3_read_mode_pins();
+	struct device_node *np = dev->of_node;
+	struct regmap *regmap;
+	u32 cpg_mode, reg;
+
+	regmap = syscon_regmap_lookup_by_phandle(np, "renesas,modemr");
+	if (IS_ERR(regmap) ||
+	    of_property_read_u32_index(np, "renesas,modemr", 1, &reg) ||
+	    regmap_read(regmap, reg, &cpg_mode)) {
+		dev_err(dev, "Failed to parse renesas,modemr\n");
+		return -EINVAL;
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
