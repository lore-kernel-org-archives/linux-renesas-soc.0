Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:36309 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726485AbeK2Lov (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 06:44:51 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] clk: renesas: rcar-gen3: add HS400 quirk for SD clock
Date: Thu, 29 Nov 2018 01:39:49 +0100
Message-Id: <20181129003949.19984-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20181129003949.19984-1-niklas.soderlund+renesas@ragnatech.se>
References: <20181129003949.19984-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On H3 (ES1.x, ES2.0) and M3-W (ES1.0, ES1.1) the clock setting for HS400
needs a quirk to function properly. The reason for the quirk is that
there are two settings which produces same divider value for the SDn
clock. On the effected boards the one currently selected results in
HS400 not working.

This change uses the same method as the Gen2 CPG driver and simply
ignores the first clock setting as this is the offending one when
selecting the settings. Which of the two possible settings is used have
no effect for SDR104.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

---
* Changes since v1
- Fixed spelling in commit message, thanks Sergei and Geert!
- Reworked the whole patch per Geerts suggestion. Instead of only
  skipping the first row on the effected boards when setting the clock
  rete totally ignore it. This is made possible by another change to the
  clock driver posted separately from this series and which this patch
  now depends on [1].

  1. [PATCH] clk: renesas: rcar-gen3: set state when registering SD clocks
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 33 +++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index bca6c7f51de18db7..bad062150cd486f6 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -242,6 +242,10 @@ struct sd_clock {
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
@@ -352,6 +356,12 @@ static const struct clk_ops cpg_sd_clock_ops = {
 	.set_rate = cpg_sd_clock_set_rate,
 };
 
+static u32 cpg_quirks __initdata;
+
+#define PLL_ERRATA	BIT(0)		/* Missing PLL0/2/4 post-divider */
+#define RCKCR_CKSEL	BIT(1)		/* Manual RCLK parent selection */
+#define SD_SKIP_FIRST	BIT(2)		/* Skip first clock in SD table */
+
 static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 	void __iomem *base, const char *parent_name,
 	struct raw_notifier_head *notifiers)
@@ -377,6 +387,11 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 	clock->div_table = cpg_sd_div_table;
 	clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
 
+	if (cpg_quirks & SD_SKIP_FIRST) {
+		clock->div_table++;
+		clock->div_num--;
+	}
+
 	val = readl(clock->csn.reg) & ~CPG_SD_FC_MASK;
 	val |= CPG_SD_STP_MASK | (clock->div_table[0].val & CPG_SD_FC_MASK);
 	writel(val, clock->csn.reg);
@@ -406,23 +421,27 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
 static u32 cpg_mode __initdata;
-static u32 cpg_quirks __initdata;
-
-#define PLL_ERRATA	BIT(0)		/* Missing PLL0/2/4 post-divider */
-#define RCKCR_CKSEL	BIT(1)		/* Manual RCLK parent selection */
 
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
-- 
2.19.1
