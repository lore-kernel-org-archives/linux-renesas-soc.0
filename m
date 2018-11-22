Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37811 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729652AbeKWFX7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 00:23:59 -0500
Received: by mail-lj1-f193.google.com with SMTP id e5-v6so8732165lja.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Nov 2018 10:43:22 -0800 (PST)
Subject: [PATCH 3/4] clk: renesas: rcar-gen3-cpg: add RPCD2 clock
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
Message-ID: <71808cdc-c95b-8ba2-10aa-01f6a6af7cf1@cogentembedded.com>
Date: Thu, 22 Nov 2018 21:43:19 +0300
MIME-Version: 1.0
In-Reply-To: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the RPCD2 clock for the R-Car gen3 SoCs -- this clock is en/disabled
via the RPCCKCR register on all the R-Car gen3 SoCs except V3M (R8A77970)
and has a fixed divisor of 2 (applied to the RPC clock).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/clk/renesas/rcar-gen3-cpg.c |   87 ++++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h |    1 
 2 files changed, 88 insertions(+)

Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -524,6 +524,89 @@ static struct clk * __init cpg_rpc_clk_r
 	return clk;
 }
 
+static int cpg_rpcd2_clock_enable(struct clk_hw *hw)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+
+	cpg_reg_modify(clock->reg, CPG_RPC_CKSTP2, 0);
+
+	return 0;
+}
+
+static void cpg_rpcd2_clock_disable(struct clk_hw *hw)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+
+	cpg_reg_modify(clock->reg, 0, CPG_RPC_CKSTP2);
+}
+
+static int cpg_rpcd2_clock_is_enabled(struct clk_hw *hw)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+
+	return !(readl(clock->reg) & CPG_RPC_CKSTP2);
+}
+
+static unsigned long cpg_rpcd2_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	return parent_rate / 2;
+}
+
+static long cpg_rpcd2_round_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long *parent_rate)
+{
+	return *parent_rate / 2;
+}
+
+static int cpg_rpcd2_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	/*
+	 * We must report success but we can do so unconditionally because
+	 * the round_rate() method returns values that ensure this call is
+	 * a nop.
+	 */
+	return 0;
+}
+
+static const struct clk_ops cpg_rpcd2_clock_ops = {
+	.enable = cpg_rpcd2_clock_enable,
+	.disable = cpg_rpcd2_clock_disable,
+	.is_enabled = cpg_rpcd2_clock_is_enabled,
+	.recalc_rate = cpg_rpcd2_recalc_rate,
+	.round_rate = cpg_rpcd2_round_rate,
+	.set_rate = cpg_rpcd2_set_rate,
+};
+
+static struct clk * __init cpg_rpcd2_clk_register(const struct cpg_core_clk *core,
+						void __iomem *base,
+						const char *parent_name)
+{
+	struct clk_init_data init;
+	struct rpc_clock *clock;
+	struct clk *clk;
+
+	clock = kzalloc(sizeof(*clock), GFP_KERNEL);
+	if (!clock)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = core->name;
+	init.ops = &cpg_rpcd2_clock_ops;
+	init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	clock->reg = base + CPG_RPCCKCR;
+	clock->hw.init = &init;
+
+	clk = clk_register(NULL, &clock->hw);
+	if (IS_ERR(clk))
+		kfree(clock);
+
+	return clk;
+}
+
 
 static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
@@ -701,6 +784,10 @@ struct clk * __init rcar_gen3_cpg_clk_re
 	case CLK_TYPE_GEN3_RPC:
 		return cpg_rpc_clk_register(core, base, __clk_get_name(parent));
 
+	case CLK_TYPE_GEN3_RPCD2:
+		return cpg_rpcd2_clk_register(core, base,
+					      __clk_get_name(parent));
+
 	default:
 		return ERR_PTR(-EINVAL);
 	}
Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.h
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.h
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -24,6 +24,7 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_OSC,	/* OSC EXTAL predivider and fixed divider */
 	CLK_TYPE_GEN3_RCKSEL,	/* Select parent/divider using RCKCR.CKSEL */
 	CLK_TYPE_GEN3_RPC,
+	CLK_TYPE_GEN3_RPCD2,
 
 	/* SoC specific definitions start here */
 	CLK_TYPE_GEN3_SOC_BASE,
