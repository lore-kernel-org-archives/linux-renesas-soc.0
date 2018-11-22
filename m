Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34869 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729400AbeKWFUV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 00:20:21 -0500
Received: by mail-lf1-f68.google.com with SMTP id e26so7149603lfc.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Nov 2018 10:39:45 -0800 (PST)
Subject: [PATCH 1/4] clk: renesas: rcar-gen3-cpg: factor out cpg_reg_modify()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
Message-ID: <8cca22f7-dbd7-2da0-2f58-e490982d2f6c@cogentembedded.com>
Date: Thu, 22 Nov 2018 21:39:42 +0300
MIME-Version: 1.0
In-Reply-To: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

There's quite often repeated sequence of a CPG register read-modify-write,
so it seems worth factoring it out into a function -- this saves 68 bytes
of the object code already (AArch64 gcc 4.8.5) and will save more with the
next patches...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/clk/renesas/rcar-gen3-cpg.c |   37 ++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -30,6 +30,15 @@
 
 #define CPG_RCKCR_CKSEL	BIT(15)	/* RCLK Clock Source Select */
 
+static void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
+{
+	u32 val = readl(reg);
+
+	val &= ~clear;
+	val |= set;
+	writel(val, reg);
+};
+
 struct cpg_simple_notifier {
 	struct notifier_block nb;
 	void __iomem *reg;
@@ -118,7 +127,6 @@ static int cpg_z_clk_set_rate(struct clk
 	struct cpg_z_clk *zclk = to_z_clk(hw);
 	unsigned int mult;
 	unsigned int i;
-	u32 val, kick;
 
 	/* Factor of 2 is for fixed divider */
 	mult = DIV_ROUND_CLOSEST_ULL(rate * 32ULL * 2, parent_rate);
@@ -127,17 +135,14 @@ static int cpg_z_clk_set_rate(struct clk
 	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
 		return -EBUSY;
 
-	val = readl(zclk->reg) & ~zclk->mask;
-	val |= ((32 - mult) << __ffs(zclk->mask)) & zclk->mask;
-	writel(val, zclk->reg);
+	cpg_reg_modify(zclk->reg, zclk->mask,
+		       ((32 - mult) << __ffs(zclk->mask)) & zclk->mask);
 
 	/*
 	 * Set KICK bit in FRQCRB to update hardware setting and wait for
 	 * clock change completion.
 	 */
-	kick = readl(zclk->kick_reg);
-	kick |= CPG_FRQCRB_KICK;
-	writel(kick, zclk->kick_reg);
+	cpg_reg_modify(zclk->kick_reg, 0, CPG_FRQCRB_KICK);
 
 	/*
 	 * Note: There is no HW information about the worst case latency.
@@ -262,12 +267,10 @@ static const struct sd_div_table cpg_sd_
 static int cpg_sd_clock_enable(struct clk_hw *hw)
 {
 	struct sd_clock *clock = to_sd_clock(hw);
-	u32 val = readl(clock->csn.reg);
-
-	val &= ~(CPG_SD_STP_MASK);
-	val |= clock->div_table[clock->cur_div_idx].val & CPG_SD_STP_MASK;
 
-	writel(val, clock->csn.reg);
+	cpg_reg_modify(clock->csn.reg, CPG_SD_STP_MASK,
+		       clock->div_table[clock->cur_div_idx].val &
+		       CPG_SD_STP_MASK);
 
 	return 0;
 }
@@ -276,7 +279,7 @@ static void cpg_sd_clock_disable(struct
 {
 	struct sd_clock *clock = to_sd_clock(hw);
 
-	writel(readl(clock->csn.reg) | CPG_SD_STP_MASK, clock->csn.reg);
+	cpg_reg_modify(clock->csn.reg, 0, CPG_SD_STP_MASK);
 }
 
 static int cpg_sd_clock_is_enabled(struct clk_hw *hw)
@@ -323,7 +326,6 @@ static int cpg_sd_clock_set_rate(struct
 {
 	struct sd_clock *clock = to_sd_clock(hw);
 	unsigned int div = cpg_sd_clock_calc_div(clock, rate, parent_rate);
-	u32 val;
 	unsigned int i;
 
 	for (i = 0; i < clock->div_num; i++)
@@ -335,10 +337,9 @@ static int cpg_sd_clock_set_rate(struct
 
 	clock->cur_div_idx = i;
 
-	val = readl(clock->csn.reg);
-	val &= ~(CPG_SD_STP_MASK | CPG_SD_FC_MASK);
-	val |= clock->div_table[i].val & (CPG_SD_STP_MASK | CPG_SD_FC_MASK);
-	writel(val, clock->csn.reg);
+	cpg_reg_modify(clock->csn.reg, CPG_SD_STP_MASK | CPG_SD_FC_MASK,
+		       clock->div_table[i].val &
+		       (CPG_SD_STP_MASK | CPG_SD_FC_MASK));
 
 	return 0;
 }
