Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:35330 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728251AbeKAI1O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Nov 2018 04:27:14 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] clk: renesas: rcar-gen3: add HS400 quirk for SD clock
Date: Thu,  1 Nov 2018 00:25:18 +0100
Message-Id: <20181031232518.2490-3-niklas.soderlund@ragnatech.se>
In-Reply-To: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
References: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

On H3 (ES1.0,ES2.0) and M3-W (ES1.0,ES1.1) the clock setting for HS400
needs a quirk to function properly. The reason for the quirk is that
there are two settings which produces same divider vale for the SDn
clock. On the effected boards the one currently selected results in HS00
not working.

This change uses the same method as the Gen2 CPG driver and simply
ignores the first clock setting as this is the offending one when
selecting the settings. Which of the two possible settings is used have
no effect for SDR104.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index ff56ac6134111c38..8cc524a29c855dd2 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -227,6 +227,7 @@ struct sd_clock {
 	unsigned int div_min;
 	unsigned int div_max;
 	unsigned int cur_div_idx;
+	bool skip_first;
 };
 
 /* SDn divider
@@ -243,6 +244,10 @@ struct sd_clock {
  *  1         0         2 (4)      0 (2)      8
  *  1         0         3 (8)      0 (2)     16
  *  1         0         4 (16)     0 (2)     32
+ *
+ *  NOTE: There is a quirk option to ignore the first row of the dividers
+ *  table when searching for suitable settings. This is because HS400 on
+ *  early ES versions of H3 and M3-W requires a specific setting to work.
  */
 static const struct sd_div_table cpg_sd_div_table[] = {
 /*	CPG_SD_DIV_TABLE_DATA(stp_hck,  stp_ck,   sd_srcfc,   sd_fc,  sd_div) */
@@ -327,7 +332,7 @@ static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
 	u32 val;
 	unsigned int i;
 
-	for (i = 0; i < clock->div_num; i++)
+	for (i = clock->skip_first ? 1 : 0; i < clock->div_num; i++)
 		if (div == clock->div_table[i].div)
 			break;
 
@@ -355,7 +360,7 @@ static const struct clk_ops cpg_sd_clock_ops = {
 
 static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 	void __iomem *base, const char *parent_name,
-	struct raw_notifier_head *notifiers)
+	struct raw_notifier_head *notifiers, bool skip_first)
 {
 	struct clk_init_data init;
 	struct sd_clock *clock;
@@ -377,6 +382,7 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 	clock->hw.init = &init;
 	clock->div_table = cpg_sd_div_table;
 	clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
+	clock->skip_first = skip_first;
 
 	sd_fc = readl(clock->csn.reg) & CPG_SD_FC_MASK;
 	for (i = 0; i < clock->div_num; i++)
@@ -417,19 +423,28 @@ static u32 cpg_quirks __initdata;
 
 #define PLL_ERRATA	BIT(0)		/* Missing PLL0/2/4 post-divider */
 #define RCKCR_CKSEL	BIT(1)		/* Manual RCLK parent selection */
+#define SD_SKIP_FIRST	BIT(2)		/* Skip first clock in SD table */
 
 static const struct soc_device_attribute cpg_quirks_match[] __initconst = {
 	{
 		.soc_id = "r8a7795", .revision = "ES1.0",
-		.data = (void *)(PLL_ERRATA | RCKCR_CKSEL),
+		.data = (void *)(PLL_ERRATA | RCKCR_CKSEL | SD_SKIP_FIRST),
 	},
 	{
 		.soc_id = "r8a7795", .revision = "ES1.*",
-		.data = (void *)RCKCR_CKSEL,
+		.data = (void *)(RCKCR_CKSEL | SD_SKIP_FIRST),
+	},
+	{
+		.soc_id = "r8a7795", .revision = "ES2.0",
+		.data = (void *)SD_SKIP_FIRST,
 	},
 	{
 		.soc_id = "r8a7796", .revision = "ES1.0",
-		.data = (void *)RCKCR_CKSEL,
+		.data = (void *)(RCKCR_CKSEL | SD_SKIP_FIRST),
+	},
+	{
+		.soc_id = "r8a7796", .revision = "ES1.1",
+		.data = (void *)SD_SKIP_FIRST,
 	},
 	{ /* sentinel */ }
 };
@@ -504,7 +519,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 
 	case CLK_TYPE_GEN3_SD:
 		return cpg_sd_clk_register(core, base, __clk_get_name(parent),
-					   notifiers);
+					   notifiers,
+					   cpg_quirks & SD_SKIP_FIRST);
 
 	case CLK_TYPE_GEN3_R:
 		if (cpg_quirks & RCKCR_CKSEL) {
-- 
2.19.1
