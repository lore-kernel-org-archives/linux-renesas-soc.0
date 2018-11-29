Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:21395 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726328AbeK2LTc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 06:19:32 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] clk: renesas: rcar-gen3: set state when registering SD clocks
Date: Thu, 29 Nov 2018 01:15:38 +0100
Message-Id: <20181129001538.17974-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The driver tries to figure out which state a SD clock is in when the
clock is register instead of setting a known state. This can be
problematic for two reasons.

1. If the clock driver can't figure out the state of the clock
   registration of the clock fails and setting of a known state by a
   clock user is not possible.

2. The state of the clock depends on if and how the bootloader
   configured it. The driver only checks that the rate is known not if
   the clock is stopped or not for example.

Fix this by setting a known state and make sure the clock is stopped.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 4ba38f98cc7bab82..f6335357c85505df 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -360,7 +360,7 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 	struct sd_clock *clock;
 	struct clk *clk;
 	unsigned int i;
-	u32 sd_fc;
+	u32 val;
 
 	clock = kzalloc(sizeof(*clock), GFP_KERNEL);
 	if (!clock)
@@ -377,17 +377,11 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 	clock->div_table = cpg_sd_div_table;
 	clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
 
-	sd_fc = readl(clock->csn.reg) & CPG_SD_FC_MASK;
-	for (i = 0; i < clock->div_num; i++)
-		if (sd_fc == (clock->div_table[i].val & CPG_SD_FC_MASK))
-			break;
-
-	if (WARN_ON(i >= clock->div_num)) {
-		kfree(clock);
-		return ERR_PTR(-EINVAL);
-	}
+	val = readl(clock->csn.reg) & ~CPG_SD_FC_MASK;
+	val |= CPG_SD_STP_MASK | (clock->div_table[0].val & CPG_SD_FC_MASK);
+	writel(val, clock->csn.reg);
 
-	clock->cur_div_idx = i;
+	clock->cur_div_idx = 0;
 
 	clock->div_max = clock->div_table[0].div;
 	clock->div_min = clock->div_max;
-- 
2.19.1
