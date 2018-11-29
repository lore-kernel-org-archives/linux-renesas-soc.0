Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:48324 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727945AbeK2VzX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 16:55:23 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/13] clk: renesas: r8a7796: Add CPEX clock
Date: Thu, 29 Nov 2018 11:50:00 +0100
Message-Id: <20181129105008.10239-6-geert+renesas@glider.be>
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Implement support for the CPEX clock on R-Car M3-W.  This clock can be
selected as a clock source for CMT1 (Compare Match Timer Type 1).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 10567386e6dd83eb..12c455859f2c28f2 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -103,6 +103,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 
 	DEF_FIXED("cl",         R8A7796_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",         R8A7796_CLK_CP,    CLK_EXTAL,      2, 1),
+	DEF_FIXED("cpex",       R8A7796_CLK_CPEX,  CLK_EXTAL,      2, 1),
 
 	DEF_DIV6P1("canfd",     R8A7796_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
 	DEF_DIV6P1("csi0",      R8A7796_CLK_CSI0,  CLK_PLL1_DIV4, 0x00c),
-- 
2.17.1
