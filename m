Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34399 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729237AbeKWFWe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 00:22:34 -0500
Received: by mail-lf1-f68.google.com with SMTP id p6so7152045lfc.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Nov 2018 10:41:56 -0800 (PST)
Subject: [PATCH 2/4] clk: renesas: rcar-gen3-cpg: add RPC clock
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
Message-ID: <5aa01cae-28ff-efb5-bf4d-1994760ecb79@cogentembedded.com>
Date: Thu, 22 Nov 2018 21:41:54 +0300
MIME-Version: 1.0
In-Reply-To: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the RPC clock for the R-Car gen3 SoCs -- this clock is controlled by
the RPCCKCR register on all the R-Car gen3 SoCs except V3M (R8A77970).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/clk/renesas/rcar-gen3-cpg.c |  118 ++++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h |    2 
 2 files changed, 120 insertions(+)

Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -409,6 +409,121 @@ free_clock:
 	return clk;
 }
 
+#define CPG_RPC_CKSTP2		BIT(9)
+#define CPG_RPC_CKSTP		BIT(8)
+#define CPG_RPC_DIV_4_3_MASK	GENMASK(4, 3)
+#define CPG_RPC_DIV_2_0_MASK	GENMASK(2, 0)
+
+struct rpc_clock {
+	struct clk_hw hw;
+	void __iomem *reg;
+};
+
+#define to_rpc_clock(_hw) container_of(_hw, struct rpc_clock, hw)
+
+static int cpg_rpc_clock_enable(struct clk_hw *hw)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+
+	cpg_reg_modify(clock->reg, CPG_RPC_CKSTP, 0);
+
+	return 0;
+}
+
+static void cpg_rpc_clock_disable(struct clk_hw *hw)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+
+	cpg_reg_modify(clock->reg, 0, CPG_RPC_CKSTP);
+}
+
+static int cpg_rpc_clock_is_enabled(struct clk_hw *hw)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+
+	return !(readl(clock->reg) & CPG_RPC_CKSTP);
+}
+
+static unsigned long cpg_rpc_clock_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+	u32 div = (readl(clock->reg) & CPG_RPC_DIV_2_0_MASK) + 1;
+
+	return DIV_ROUND_CLOSEST(parent_rate, div);
+}
+
+static unsigned int cpg_rpc_clock_calc_div(struct rpc_clock *clock,
+					   unsigned long rate,
+					   unsigned long parent_rate)
+{
+	unsigned int div;
+
+	if (!rate)
+		rate = 1;
+
+	div = ALIGN(DIV_ROUND_CLOSEST(parent_rate, rate), 2);
+
+	return clamp_t(unsigned int, div, 2, 8);
+}
+
+static long cpg_rpc_clock_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *parent_rate)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+	unsigned int div = cpg_rpc_clock_calc_div(clock, rate, *parent_rate);
+
+	return DIV_ROUND_CLOSEST(*parent_rate, div);
+}
+
+static int cpg_rpc_clock_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct rpc_clock *clock = to_rpc_clock(hw);
+	unsigned int div = cpg_rpc_clock_calc_div(clock, rate, parent_rate);
+
+	cpg_reg_modify(clock->reg, CPG_RPC_DIV_2_0_MASK, div - 1);
+
+	return 0;
+}
+
+static const struct clk_ops cpg_rpc_clock_ops = {
+	.enable = cpg_rpc_clock_enable,
+	.disable = cpg_rpc_clock_disable,
+	.is_enabled = cpg_rpc_clock_is_enabled,
+	.recalc_rate = cpg_rpc_clock_recalc_rate,
+	.round_rate = cpg_rpc_clock_round_rate,
+	.set_rate = cpg_rpc_clock_set_rate,
+};
+
+static struct clk * __init cpg_rpc_clk_register(const struct cpg_core_clk *core,
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
+	init.ops = &cpg_rpc_clock_ops;
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
@@ -583,6 +698,9 @@ struct clk * __init rcar_gen3_cpg_clk_re
 		}
 		break;
 
+	case CLK_TYPE_GEN3_RPC:
+		return cpg_rpc_clk_register(core, base, __clk_get_name(parent));
+
 	default:
 		return ERR_PTR(-EINVAL);
 	}
Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.h
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.h
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -23,6 +23,7 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_Z2,
 	CLK_TYPE_GEN3_OSC,	/* OSC EXTAL predivider and fixed divider */
 	CLK_TYPE_GEN3_RCKSEL,	/* Select parent/divider using RCKCR.CKSEL */
+	CLK_TYPE_GEN3_RPC,
 
 	/* SoC specific definitions start here */
 	CLK_TYPE_GEN3_SOC_BASE,
@@ -57,6 +58,7 @@ struct rcar_gen3_cpg_pll_config {
 	u8 osc_prediv;
 };
 
+#define CPG_RPCCKCR	0x238
 #define CPG_RCKCR	0x240
 
 struct clk *rcar_gen3_cpg_clk_register(struct device *dev,
