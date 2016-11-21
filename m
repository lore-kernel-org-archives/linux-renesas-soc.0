Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:46768 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753671AbcKURPX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 12:15:23 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a7796: Add MSIOF controller clocks
Date: Mon, 21 Nov 2016 18:15:21 +0100
Message-Id: <1479748521-12788-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

This patch adds MSIOF{0,1,2,3} clocks for R8A7796 SoC.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.11.

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 7d298c57a3e060b6..f908b779155de106 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -103,6 +103,7 @@ enum clk_ids {
 	DEF_FIXED("cl",         R8A7796_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",         R8A7796_CLK_CP,    CLK_EXTAL,      2, 1),
 
+	DEF_DIV6P1("mso",       R8A7796_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
 	DEF_DIV6P1("csi0",      R8A7796_CLK_CSI0,  CLK_PLL1_DIV4, 0x00c),
 
 	DEF_DIV6_RO("osc",      R8A7796_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
@@ -117,6 +118,10 @@ enum clk_ids {
 	DEF_MOD("scif3",		 204,	R8A7796_CLK_S3D4),
 	DEF_MOD("scif1",		 206,	R8A7796_CLK_S3D4),
 	DEF_MOD("scif0",		 207,	R8A7796_CLK_S3D4),
+	DEF_MOD("msiof3",		 208,	R8A7796_CLK_MSO),
+	DEF_MOD("msiof2",		 209,	R8A7796_CLK_MSO),
+	DEF_MOD("msiof1",		 210,	R8A7796_CLK_MSO),
+	DEF_MOD("msiof0",		 211,	R8A7796_CLK_MSO),
 	DEF_MOD("sys-dmac2",		 217,	R8A7796_CLK_S0D3),
 	DEF_MOD("sys-dmac1",		 218,	R8A7796_CLK_S0D3),
 	DEF_MOD("sys-dmac0",		 219,	R8A7796_CLK_S0D3),
-- 
1.9.1
