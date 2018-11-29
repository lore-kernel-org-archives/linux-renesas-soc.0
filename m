Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:44084 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727260AbeK2VzX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 16:55:23 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 07/13] clk: renesas: r8a77970: Add CPEX clock
Date: Thu, 29 Nov 2018 11:50:02 +0100
Message-Id: <20181129105008.10239-8-geert+renesas@glider.be>
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Implement support for the CPEX clock on R-Car V3M.  This clock can be
selected as a clock source for CMT1 (Compare Match Timer Type 1).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a77970-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77970-cpg-mssr.c b/drivers/clk/renesas/r8a77970-cpg-mssr.c
index 9d845ebd7355add2..cbed3769a100738d 100644
--- a/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -96,6 +96,7 @@ static const struct cpg_core_clk r8a77970_core_clks[] __initconst = {
 
 	DEF_FIXED("cl",		R8A77970_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",		R8A77970_CLK_CP,    CLK_EXTAL,	    2, 1),
+	DEF_FIXED("cpex",	R8A77970_CLK_CPEX,  CLK_EXTAL,	    2, 1),
 
 	DEF_DIV6P1("canfd",	R8A77970_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
 	DEF_DIV6P1("mso",	R8A77970_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
-- 
2.17.1
