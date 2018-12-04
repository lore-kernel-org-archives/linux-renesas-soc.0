Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41759 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbeLDTs0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 14:48:26 -0500
Received: by mail-lj1-f196.google.com with SMTP id z80-v6so16050164ljb.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Dec 2018 11:48:24 -0800 (PST)
Subject: [PATCH v2 1/4] clk: renesas: rcar-gen3-cpg: factor out
 cpg_reg_modify()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
Message-ID: <8d3bd6b4-61eb-ceef-dc99-eb26c83f9e03@cogentembedded.com>
Date: Tue, 4 Dec 2018 22:48:21 +0300
MIME-Version: 1.0
In-Reply-To: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

There's quite often repeated sequence of a CPG register read-modify-write,
so it seems worth factoring it out into a function -- this saves 68 bytes
of the object code (AArch64 gcc 4.8.5) and simplifies protecting all such
sequences with a spinlock in the next patch...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- moved the readl() call from the initializer in cpg_reg_modify();
- adjusted the patch description.

 drivers/clk/renesas/rcar-gen3-cpg.c |   38 ++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -30,6 +30,16 @@
 
 #define CPG_RCKCR_CKSEL	BIT(15)	/* RCLK Clock Source Select */
 
+static void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
+{
+	u32 val;
+
+	val = readl(reg);
+	val &= ~clear;
+	val |= set;
+	writel(val, reg);
+};
+
 struct cpg_simple_notifier {
 	struct notifier_block nb;
 	void __iomem *reg;
@@ -118,7 +128,6 @@ static int cpg_z_clk_set_rate(struct clk
 	struct cpg_z_clk *zclk = to_z_clk(hw);
 	unsigned int mult;
 	unsigned int i;
-	u32 val, kick;
 
 	/* Factor of 2 is for fixed divider */
 	mult = DIV_ROUND_CLOSEST_ULL(rate * 32ULL * 2, parent_rate);
@@ -127,17 +136,14 @@ static int cpg_z_clk_set_rate(struct clk
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
@@ -262,12 +268,10 @@ static const struct sd_div_table cpg_sd_
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
@@ -276,7 +280,7 @@ static void cpg_sd_clock_disable(struct
 {
 	struct sd_clock *clock = to_sd_clock(hw);
 
-	writel(readl(clock->csn.reg) | CPG_SD_STP_MASK, clock->csn.reg);
+	cpg_reg_modify(clock->csn.reg, 0, CPG_SD_STP_MASK);
 }
 
 static int cpg_sd_clock_is_enabled(struct clk_hw *hw)
@@ -323,7 +327,6 @@ static int cpg_sd_clock_set_rate(struct
 {
 	struct sd_clock *clock = to_sd_clock(hw);
 	unsigned int div = cpg_sd_clock_calc_div(clock, rate, parent_rate);
-	u32 val;
 	unsigned int i;
 
 	for (i = 0; i < clock->div_num; i++)
@@ -335,10 +338,9 @@ static int cpg_sd_clock_set_rate(struct
 
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
