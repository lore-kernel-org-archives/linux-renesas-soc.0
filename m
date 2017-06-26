Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:55225 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751391AbdFZLbF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2017 07:31:05 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
        by imta23.fe.bosch.de (Postfix) with ESMTP id 6CECF15801A6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2017 13:31:03 +0200 (CEST)
Received: from FE-HUB1001.de.bosch.com (vsgw23.fe.internet.bosch.com [10.4.98.23])
        by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id 4A435A408C6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2017 13:31:03 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <linux-renesas-soc@vger.kernel.org>, <geert@linux-m68k.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [RFC PATCH] clk: renesas: cpg-mssr: Add interface for critical core clocks
Date: Mon, 26 Jun 2017 13:30:53 +0200
Message-ID: <1498476653-18982-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

With commit 72f5df2c2bbb6 ("clk: renesas: cpg-mssr: Migrate to
CLK_IS_CRITICAL") we are able to handle critical module clocks.
Introduce the same logic for critical core clocks.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Commit

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/clk/renesas?id=72f5df2c2bbb66d4a555cb51eb9f412abf1af77f

is quite nice to avoid *module* clocks being disabled. Unfortunately,
there are *core* clocks, too. E.g. using an other OS on the Cortex R7
core of the r8a7795, the 'canfd' is a quite popular core clock which
shouldn't be disabled by Linux.

Therefore, this patch is a proposal to use the same 'mark clocks as
critical' logic implemented for the module clocks for the core
clocks, too.

Opinions?

 drivers/clk/renesas/clk-div6.c         | 17 +++++++++++++++--
 drivers/clk/renesas/clk-div6.h         |  4 +++-
 drivers/clk/renesas/r8a7795-cpg-mssr.c |  7 +++++++
 drivers/clk/renesas/renesas-cpg-mssr.c |  3 ++-
 drivers/clk/renesas/renesas-cpg-mssr.h |  8 ++++++++
 5 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index 0627860..5917e05 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -18,6 +18,7 @@
 #include <linux/of_address.h>
 #include <linux/slab.h>
 
+#include "renesas-cpg-mssr.h"
 #include "clk-div6.h"
 
 #define CPG_DIV6_CKSTP		BIT(8)
@@ -184,7 +185,9 @@ static const struct clk_ops cpg_div6_clock_ops = {
 struct clk * __init cpg_div6_register(const char *name,
 				      unsigned int num_parents,
 				      const char **parent_names,
-				      void __iomem *reg)
+				      void __iomem *reg,
+				      const struct cpg_mssr_info *info,
+				      unsigned int id)
 {
 	unsigned int valid_parents;
 	struct clk_init_data init;
@@ -246,6 +249,15 @@ struct clk * __init cpg_div6_register(const char *name,
 	init.name = name;
 	init.ops = &cpg_div6_clock_ops;
 	init.flags = CLK_IS_BASIC;
+	if (info) {
+		for (i = 0; i < info->num_crit_core_clks; i++)
+			if (id == info->crit_core_clks[i]) {
+				pr_devel("DIV6 %s setting CLK_IS_CRITICAL\n",
+					 name);
+				init.flags |= CLK_IS_CRITICAL;
+				break;
+			}
+	}
 	init.parent_names = parent_names;
 	init.num_parents = valid_parents;
 
@@ -298,7 +310,8 @@ static void __init cpg_div6_clock_init(struct device_node *np)
 	for (i = 0; i < num_parents; i++)
 		parent_names[i] = of_clk_get_parent_name(np, i);
 
-	clk = cpg_div6_register(clk_name, num_parents, parent_names, reg);
+	clk = cpg_div6_register(clk_name, num_parents, parent_names, reg,
+				NULL, 0);
 	if (IS_ERR(clk)) {
 		pr_err("%s: failed to register %s DIV6 clock (%ld)\n",
 		       __func__, np->name, PTR_ERR(clk));
diff --git a/drivers/clk/renesas/clk-div6.h b/drivers/clk/renesas/clk-div6.h
index 567b31d..b619d6b4 100644
--- a/drivers/clk/renesas/clk-div6.h
+++ b/drivers/clk/renesas/clk-div6.h
@@ -2,6 +2,8 @@
 #define __RENESAS_CLK_DIV6_H__
 
 struct clk *cpg_div6_register(const char *name, unsigned int num_parents,
-			      const char **parent_names, void __iomem *reg);
+			      const char **parent_names, void __iomem *reg,
+			      const struct cpg_mssr_info *info,
+			      unsigned int id);
 
 #endif
diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index eaa98b4..a54fed6 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -114,6 +114,9 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 	DEF_BASE("r",           R8A7795_CLK_R,     CLK_TYPE_GEN3_R, CLK_RINT),
 };
 
+static const unsigned int r8a7795_crit_core_clks[] __initconst = {
+};
+
 static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("fdp1-2",		 117,	R8A7795_CLK_S2D1), /* ES1.x */
 	DEF_MOD("fdp1-1",		 118,	R8A7795_CLK_S0D1),
@@ -441,6 +444,10 @@ const struct cpg_mssr_info r8a7795_cpg_mssr_info __initconst = {
 	.last_dt_core_clk = LAST_DT_CORE_CLK,
 	.num_total_core_clks = MOD_CLK_BASE,
 
+	/* Critical Core Clocks */
+	.crit_core_clks = r8a7795_crit_core_clks,
+	.num_crit_core_clks = ARRAY_SIZE(r8a7795_crit_core_clks),
+
 	/* Module Clocks */
 	.mod_clks = r8a7795_mod_clks,
 	.num_mod_clks = ARRAY_SIZE(r8a7795_mod_clks),
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 99eeec6..80be019 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -293,7 +293,8 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 
 		if (core->type == CLK_TYPE_DIV6P1) {
 			clk = cpg_div6_register(core->name, 1, &parent_name,
-						priv->base + core->offset);
+						priv->base + core->offset, info,
+						core->id);
 		} else {
 			clk = clk_register_fixed_factor(NULL, core->name,
 							parent_name, 0,
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 148f4f0a..a723fdd 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -86,6 +86,10 @@ struct device_node;
      * @last_dt_core_clk: ID of the last Core Clock exported to DT
      * @num_total_core_clks: Total number of Core Clocks (exported + internal)
      *
+     * @crit_core_clks: Array with Core Clock IDs of critical clocks that
+     *                  should not be disabled without a knowledgeable driver
+     * @num_core_mod_clks: Number of entries in crit_core_clks[]
+     *
      * @mod_clks: Array of Module Clock definitions
      * @num_mod_clks: Number of entries in mod_clks[]
      * @num_hw_mod_clks: Number of Module Clocks supported by the hardware
@@ -109,6 +113,10 @@ struct cpg_mssr_info {
 	unsigned int last_dt_core_clk;
 	unsigned int num_total_core_clks;
 
+	/* Critical Core Clocks that should not be disabled */
+	const unsigned int *crit_core_clks;
+	unsigned int num_crit_core_clks;
+
 	/* Module Clocks */
 	const struct mssr_mod_clk *mod_clks;
 	unsigned int num_mod_clks;
-- 
2.8.0
