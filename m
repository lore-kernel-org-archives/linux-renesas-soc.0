Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:28555 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752366AbcERLVK (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 18 May 2016 07:21:10 -0400
Received: from vsmta13.fe.internet.bosch.com (unknown [10.4.98.53])
	by imta24.fe.bosch.de (Postfix) with ESMTP id C2CFBD8021E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2016 13:21:08 +0200 (CEST)
Received: from FE-HUB1001.de.bosch.com (vsgw23.fe.internet.bosch.com [10.4.98.23])
	by vsmta13.fe.internet.bosch.com (Postfix) with ESMTP id 72D6B2E4083D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2016 13:21:08 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH v2 3/6] clk: renesas: rcar: Obtain MD pin values using syscon/regmap
Date: Wed, 18 May 2016 13:19:05 +0200
Message-ID: <1463570348-32349-4-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1463570348-32349-1-git-send-email-dirk.behme@de.bosch.com>
References: <1463570348-32349-1-git-send-email-dirk.behme@de.bosch.com>
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
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c |  7 ++++++-
 drivers/clk/renesas/r8a7796-cpg-mssr.c |  7 ++++++-
 drivers/clk/renesas/rcar-gen3-cpg.c    | 17 -----------------
 drivers/clk/renesas/rcar-gen3-cpg.h    |  1 -
 drivers/clk/renesas/renesas-cpg-mssr.c | 20 ++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.h |  1 +
 6 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index e53aff5..cfbe1f3 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -294,7 +294,12 @@ static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
 static int __init r8a7795_cpg_mssr_init(struct device *dev)
 {
 	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
-	u32 cpg_mode = rcar_gen3_read_mode_pins();
+	u32 cpg_mode;
+	int ret;
+
+	ret = cpg_mssr_read_mode_pins(dev, &cpg_mode);
+	if (ret)
+		return ret;
 
 	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
 	if (!cpg_pll_config->extal_div) {
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index c84b549..5302251 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -159,7 +159,12 @@ static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
 static int __init r8a7796_cpg_mssr_init(struct device *dev)
 {
 	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
-	u32 cpg_mode = rcar_gen3_read_mode_pins();
+	u32 cpg_mode;
+	int ret;
+
+	ret = cpg_mssr_read_mode_pins(dev, &cpg_mode);
+	if (ret)
+		return ret;
 
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
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index e1365e7..6c0598a 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -18,13 +18,16 @@
 #include <linux/clk/renesas.h>
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
@@ -473,6 +476,23 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev)
 		pm_clk_destroy(dev);
 }
 
+int __init cpg_mssr_read_mode_pins(struct device *dev, u32 *cpg_mode)
+{
+	struct device_node *np = dev->of_node;
+	struct regmap *regmap;
+	u32 reg;
+
+	regmap = syscon_regmap_lookup_by_phandle(np, "renesas,modemr");
+	if (IS_ERR(regmap) ||
+	    of_property_read_u32_index(np, "renesas,modemr", 1, &reg) ||
+	    regmap_read(regmap, reg, cpg_mode)) {
+		dev_err(dev, "Failed to parse renesas,modemr\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int __init cpg_mssr_add_clk_domain(struct device *dev,
 					  const unsigned int *core_pm_clks,
 					  unsigned int num_core_pm_clks)
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index ee7edfa..4bf09c5 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -132,4 +132,5 @@ struct cpg_mssr_info {
 
 extern const struct cpg_mssr_info r8a7795_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7796_cpg_mssr_info;
+int cpg_mssr_read_mode_pins(struct device *dev, u32 *cpg_mode);
 #endif
-- 
2.8.0
