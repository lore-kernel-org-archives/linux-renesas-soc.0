Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 13/23] clk: renesas: r8a7779: Obtain mode pin values from R-Car RST driver
Date: Fri, 21 Oct 2016 15:17:27 +0200
Message-Id: <1477055857-17936-14-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Obtain the values of the mode pins from the R-Car RST driver, which
relies on the presence in DT of a device node for the RESET/WDT module.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Dirk Behme <dirk.behme@de.bosch.com>
---
v4:
  - Add Acked-by,

v3:
  - New.
---
 drivers/clk/renesas/clk-r8a7779.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/clk-r8a7779.c b/drivers/clk/renesas/clk-r8a7779.c
index cf2a37df03b15e60..ca7551bcb1153c3d 100644
--- a/drivers/clk/renesas/clk-r8a7779.c
+++ b/drivers/clk/renesas/clk-r8a7779.c
@@ -18,6 +18,7 @@
 #include <linux/of_address.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/soc/renesas/rcar-rst.h>
 
 #include <dt-bindings/clock/r8a7779-clock.h>
 
@@ -127,6 +128,10 @@ static void __init r8a7779_cpg_clocks_init(struct device_node *np)
 	struct clk **clks;
 	unsigned int i, plla_mult;
 	int num_clks;
+	u32 mode;
+
+	if (rcar_rst_read_mode_pins(&mode))
+		return;
 
 	num_clks = of_property_count_strings(np, "clock-output-names");
 	if (num_clks < 0) {
@@ -148,8 +153,8 @@ static void __init r8a7779_cpg_clocks_init(struct device_node *np)
 	cpg->data.clks = clks;
 	cpg->data.clk_num = num_clks;
 
-	config = &cpg_clk_configs[CPG_CLK_CONFIG_INDEX(cpg_mode)];
-	plla_mult = cpg_plla_mult[CPG_PLLA_MULT_INDEX(cpg_mode)];
+	config = &cpg_clk_configs[CPG_CLK_CONFIG_INDEX(mode)];
+	plla_mult = cpg_plla_mult[CPG_PLLA_MULT_INDEX(mode)];
 
 	for (i = 0; i < num_clks; ++i) {
 		const char *name;
-- 
1.9.1

