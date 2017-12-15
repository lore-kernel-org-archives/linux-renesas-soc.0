Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:43881 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756600AbdLOPO7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:14:59 -0500
Received: by mail-wm0-f65.google.com with SMTP id n138so18089383wmg.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 07:14:58 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        geert@linux-m68k.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: [PATCH 2/4] clk: renesas: rcar-gen3: Add ZG clock divider support
Date: Fri, 15 Dec 2017 16:14:48 +0100
Message-Id: <1513350890-2446-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1513350890-2446-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350890-2446-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds ZG clock divider support for R-Car Gen3 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 120 ++++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h |   1 +
 2 files changed, 121 insertions(+)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 102cfc2..6b5d5ec 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -73,6 +73,8 @@ static void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
  */
 #define CPG_FRQCRB			0x00000004
 #define CPG_FRQCRB_KICK			BIT(31)
+#define CPG_FRQCRB_ZGFC_MASK		(0x1f << 24)
+#define CPG_FRQCRB_ZGFC_SHIFT		24
 #define CPG_FRQCRC			0x000000e0
 #define CPG_FRQCRC_ZFC_MASK		GENMASK(12, 8)
 #define CPG_FRQCRC_Z2FC_MASK		GENMASK(4, 0)
@@ -197,6 +199,120 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 	return clk;
 }
 
+static unsigned long cpg_zg_clk_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned long prate  = parent_rate / 2; /* PLL4 clock divided by 2 */
+	unsigned int mult;
+	unsigned int val;
+	unsigned long rate;
+
+	val = (clk_readl(zclk->reg) & CPG_FRQCRB_ZGFC_MASK)
+	    >> CPG_FRQCRB_ZGFC_SHIFT;
+	mult = 32 - val;
+
+	rate = div_u64((u64)prate * mult + 16, 32);
+	/* Round to closest value at 10MHz unit */
+	rate = 10000000 * DIV_ROUND_CLOSEST(rate, 10000000);
+
+	return rate;
+}
+
+static long cpg_zg_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long *parent_rate)
+{
+	unsigned long prate  = *parent_rate / 2; /* PLL4 clock divided by 2 */
+	unsigned int mult;
+
+	mult = div_u64((u64)rate * 32 + prate / 2, prate);
+	mult = clamp(mult, 1U, 32U);
+
+	return prate / 32 * mult;
+}
+
+static int cpg_zg_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long parent_rate)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned long prate  = parent_rate / 2; /* PLL4 clock divided by 2 */
+	unsigned int mult;
+	u32 val, kick;
+	unsigned int i;
+
+	mult = div_u64((u64)rate * 32 + prate / 2, prate);
+	mult = clamp(mult, 1U, 32U);
+
+	if (clk_readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
+		return -EBUSY;
+
+	val = clk_readl(zclk->reg);
+	val &= ~CPG_FRQCRB_ZGFC_MASK;
+	val |= (32 - mult) << CPG_FRQCRB_ZGFC_SHIFT;
+	clk_writel(val, zclk->reg);
+
+	/*
+	 * Set KICK bit in FRQCRB to update hardware setting and wait for
+	 * clock change completion.
+	 */
+	kick = clk_readl(zclk->kick_reg);
+	kick |= CPG_FRQCRB_KICK;
+	clk_writel(kick, zclk->kick_reg);
+
+	/*
+	 * Note: There is no HW information about the worst case latency.
+	 *
+	 * Using experimental measurements, it seems that no more than
+	 * ~10 iterations are needed, independently of the CPU rate.
+	 * Since this value might be dependent of external xtal rate, pll1
+	 * rate or even the other emulation clocks rate, use 1000 as a
+	 * "super" safe value.
+	 */
+	for (i = 1000; i; i--) {
+		if (!(clk_readl(zclk->kick_reg) & CPG_FRQCRB_KICK))
+			return 0;
+
+		cpu_relax();
+	}
+
+	return -ETIMEDOUT;
+}
+
+static const struct clk_ops cpg_zg_clk_ops = {
+	.recalc_rate = cpg_zg_clk_recalc_rate,
+	.round_rate = cpg_zg_clk_round_rate,
+	.set_rate = cpg_zg_clk_set_rate,
+};
+
+static struct clk * __init cpg_zg_clk_register(const char *name,
+					       const char *parent_name,
+					       void __iomem *reg)
+{
+	struct clk_init_data init;
+	struct cpg_z_clk *zclk;
+	struct clk *clk;
+
+	zclk = kzalloc(sizeof(*zclk), GFP_KERNEL);
+	if (!zclk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &cpg_zg_clk_ops;
+	init.flags = 0;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	zclk->reg = reg + CPG_FRQCRB;
+	zclk->kick_reg = reg + CPG_FRQCRB;
+	zclk->hw.init = &init;
+
+	clk = clk_register(NULL, &zclk->hw);
+	if (IS_ERR(clk))
+		kfree(zclk);
+
+	return clk;
+}
+
 /*
  * SDn Clock
  */
@@ -564,6 +680,10 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 		return cpg_z_clk_register(core->name, __clk_get_name(parent),
 					  base, CPG_FRQCRC_Z2FC_MASK);
 
+	case CLK_TYPE_GEN3_ZG:
+		return cpg_zg_clk_register(core->name, __clk_get_name(parent),
+					   base);
+
 	default:
 		return ERR_PTR(-EINVAL);
 	}
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index ea4f8fc..3ae9fe6d 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -23,6 +23,7 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_PE,
 	CLK_TYPE_GEN3_Z,
 	CLK_TYPE_GEN3_Z2,
+	CLK_TYPE_GEN3_ZG,
 };
 
 #define DEF_GEN3_SD(_name, _id, _parent, _offset)	\
-- 
2.7.4
