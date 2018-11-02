Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44842 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbeKCEeV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Nov 2018 00:34:21 -0400
Received: by mail-lf1-f68.google.com with SMTP id m18-v6so2051875lfl.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Nov 2018 12:25:56 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] clk: renesas: r8a77970: add RPC clock
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Message-ID: <5a5c65f1-d446-9445-4e2a-579f57f00abf@cogentembedded.com>
Date: Fri, 2 Nov 2018 22:25:54 +0300
MIME-Version: 1.0
In-Reply-To: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On R-Car V3M (R8A77970), the RPC/RPCD2 clocks are output by the common
divider. Describe them, as well as the RPC-IF module clock.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'clk-renesas' branch of Geert Uytterhoeven's
'renesas-drivers.git' repo.

 drivers/clk/renesas/r8a77970-cpg-mssr.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: renesas/drivers/clk/renesas/r8a77970-cpg-mssr.c
===================================================================
--- renesas.orig/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ renesas/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -94,6 +94,9 @@ static const struct cpg_core_clk r8a7797
 		 CLK_PLL1_DIV2),
 	DEF_BASE("sd0",	R8A77970_CLK_SD0, CLK_TYPE_R8A77970_SD0, CLK_PLL1_DIV2),
 
+	DEF_FIXED("rpc",	R8A77970_CLK_RPC,   CLK_PLL1_DIV2,  5, 1),
+	DEF_FIXED("rpcd2",	R8A77970_CLK_RPCD2, CLK_PLL1_DIV2, 10, 1),
+
 	DEF_FIXED("cl",		R8A77970_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",		R8A77970_CLK_CP,    CLK_EXTAL,	    2, 1),
 
@@ -155,6 +158,7 @@ static const struct mssr_mod_clk r8a7797
 	DEF_MOD("gpio1",		 911,	R8A77970_CLK_CP),
 	DEF_MOD("gpio0",		 912,	R8A77970_CLK_CP),
 	DEF_MOD("can-fd",		 914,	R8A77970_CLK_S2D2),
+	DEF_MOD("rpc-if",		 917,	R8A77970_CLK_RPC),
 	DEF_MOD("i2c4",			 927,	R8A77970_CLK_S2D2),
 	DEF_MOD("i2c3",			 928,	R8A77970_CLK_S2D2),
 	DEF_MOD("i2c2",			 929,	R8A77970_CLK_S2D2),
