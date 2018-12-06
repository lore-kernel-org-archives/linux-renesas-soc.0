Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbeLFV7B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:01 -0500
From: Stephen Boyd <sboyd@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/8] clk: renesas: Remove usage of CLK_IS_BASIC
Date: Thu,  6 Dec 2018 13:58:51 -0800
Message-Id: <20181206215858.3880-2-sboyd@kernel.org>
In-Reply-To: <20181206215858.3880-1-sboyd@kernel.org>
References: <20181206215858.3880-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This flag doesn't look to be used by any code, just set in various clk
init structures and then never tested again. Remove it from these
drivers as it doesn't provide any benefit.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: <linux-renesas-soc@vger.kernel.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/renesas/clk-div6.c         | 2 +-
 drivers/clk/renesas/clk-mstp.c         | 2 +-
 drivers/clk/renesas/r9a06g032-clocks.c | 8 ++++----
 drivers/clk/renesas/rcar-gen3-cpg.c    | 2 +-
 drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index 57c934164306..e98a9f5b3c90 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -274,7 +274,7 @@ struct clk * __init cpg_div6_register(const char *name,
 	/* Register the clock. */
 	init.name = name;
 	init.ops = &cpg_div6_clock_ops;
-	init.flags = CLK_IS_BASIC;
+	init.flags = 0;
 	init.parent_names = parent_names;
 	init.num_parents = valid_parents;
 
diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 1c1768c2cc82..2ba6105937e3 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -158,7 +158,7 @@ static struct clk * __init cpg_mstp_clock_register(const char *name,
 
 	init.name = name;
 	init.ops = &cpg_mstp_clock_ops;
-	init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
+	init.flags = CLK_SET_RATE_PARENT;
 	/* INTC-SYS is the module clock of the GIC, and must not be disabled */
 	if (!strcmp(name, "intc-sys")) {
 		pr_debug("MSTP %s setting CLK_IS_CRITICAL\n", name);
diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 6d2b56891559..658cb11b6f55 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -424,7 +424,7 @@ r9a06g032_register_gate(struct r9a06g032_priv *clocks,
 
 	init.name = desc->name;
 	init.ops = &r9a06g032_clk_gate_ops;
-	init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
+	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = parent_name ? &parent_name : NULL;
 	init.num_parents = parent_name ? 1 : 0;
 
@@ -595,7 +595,7 @@ r9a06g032_register_div(struct r9a06g032_priv *clocks,
 
 	init.name = desc->name;
 	init.ops = &r9a06g032_clk_div_ops;
-	init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
+	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = parent_name ? &parent_name : NULL;
 	init.num_parents = parent_name ? 1 : 0;
 
@@ -683,7 +683,7 @@ r9a06g032_register_bitsel(struct r9a06g032_priv *clocks,
 
 	init.name = desc->name;
 	init.ops = &clk_bitselect_ops;
-	init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
+	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = names;
 	init.num_parents = 2;
 
@@ -777,7 +777,7 @@ r9a06g032_register_dualgate(struct r9a06g032_priv *clocks,
 
 	init.name = desc->name;
 	init.ops = &r9a06g032_clk_dualgate_ops;
-	init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
+	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 	g->hw.init = &init;
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 4ba38f98cc7b..48e003c69cd1 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -368,7 +368,7 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 
 	init.name = core->name;
 	init.ops = &cpg_sd_clock_ops;
-	init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
+	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index f7bb817420b4..30df0dc853f0 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -412,7 +412,7 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 
 	init.name = mod->name;
 	init.ops = &cpg_mstp_clock_ops;
-	init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
+	init.flags = CLK_SET_RATE_PARENT;
 	for (i = 0; i < info->num_crit_mod_clks; i++)
 		if (id == info->crit_mod_clks[i]) {
 			dev_dbg(dev, "MSTP %s setting CLK_IS_CRITICAL\n",
-- 
Sent by a computer through tubes
