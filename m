Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:41456 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbeK2VzY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 16:55:24 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/13] clk: renesas: r8a77995: Simplify PLL3 multiplier/divider
Date: Thu, 29 Nov 2018 11:50:08 +0100
Message-Id: <20181129105008.10239-14-geert+renesas@glider.be>
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

116/6 can be simplified to 58/3.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index b9745665731fac7e..eee3874865a95b1a 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -191,14 +191,14 @@ static const unsigned int r8a77995_crit_mod_clks[] __initconst = {
  * MD19		EXTAL (MHz)	PLL0		PLL1		PLL3
  *--------------------------------------------------------------------
  * 0		48 x 1		x250/4		x100/3		x100/3
- * 1		48 x 1		x250/4		x100/3		x116/6
+ * 1		48 x 1		x250/4		x100/3		x58/3
  */
 #define CPG_PLL_CONFIG_INDEX(md)	(((md) & BIT(19)) >> 19)
 
 static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[2] __initconst = {
 	/* EXTAL div	PLL1 mult/div	PLL3 mult/div */
 	{ 1,		100,	3,	100,	3,	},
-	{ 1,		100,	3,	116,	6,	},
+	{ 1,		100,	3,	58,	3,	},
 };
 
 static int __init r8a77995_cpg_mssr_init(struct device *dev)
-- 
2.17.1
