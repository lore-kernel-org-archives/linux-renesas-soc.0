Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v3 21/22] clk: renesas: r8a7779: Remove obsolete r8a7779_clocks_init()
Date: Wed,  1 Jun 2016 21:21:19 +0200
Message-Id: <1464808880-343-22-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R-Car H1 board code no longer calls r8a7779_clocks_init().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 drivers/clk/renesas/clk-r8a7779.c | 9 ---------
 include/linux/clk/renesas.h       | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/clk/renesas/clk-r8a7779.c b/drivers/clk/renesas/clk-r8a7779.c
index ca7551bcb1153c3d..27fbfafaf2cd0353 100644
--- a/drivers/clk/renesas/clk-r8a7779.c
+++ b/drivers/clk/renesas/clk-r8a7779.c
@@ -89,8 +89,6 @@ static const unsigned int cpg_plla_mult[4] __initconst = { 42, 48, 56, 64 };
  * Initialization
  */
 
-static u32 cpg_mode __initdata;
-
 static struct clk * __init
 r8a7779_cpg_register_clock(struct device_node *np, struct r8a7779_cpg *cpg,
 			   const struct cpg_clk_config *config,
@@ -178,10 +176,3 @@ static void __init r8a7779_cpg_clocks_init(struct device_node *np)
 }
 CLK_OF_DECLARE(r8a7779_cpg_clks, "renesas,r8a7779-cpg-clocks",
 	       r8a7779_cpg_clocks_init);
-
-void __init r8a7779_clocks_init(u32 mode)
-{
-	cpg_mode = mode;
-
-	of_clk_init(NULL);
-}
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 2b663bba1adcc7c1..9e969941f3f62878 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -20,7 +20,6 @@ struct device;
 struct device_node;
 struct generic_pm_domain;
 
-void r8a7779_clocks_init(u32 mode);
 void rcar_gen2_clocks_init(u32 mode);
 
 void cpg_mstp_add_clk_domain(struct device_node *np);
-- 
1.9.1

