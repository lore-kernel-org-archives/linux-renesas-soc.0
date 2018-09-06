Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33775 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729140AbeIGBFX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Sep 2018 21:05:23 -0400
Received: by mail-lj1-f194.google.com with SMTP id s12-v6so10460261ljj.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Sep 2018 13:28:14 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] clk: renesas: r8a77970: add TMU clocks
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Message-ID: <d06fcbaf-020f-d78f-2535-d50d8eb43915@cogentembedded.com>
Date: Thu, 6 Sep 2018 23:28:12 +0300
MIME-Version: 1.0
In-Reply-To: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The TMU clocks weren't present in the original R8A77970 patch by Daisuke
Matsushita, they were added in a later BSP version...

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'clk-renesas' branch of Geert's 'renesas-drivers.git'
repo...

 drivers/clk/renesas/r8a77970-cpg-mssr.c |    5 +++++
 1 file changed, 5 insertions(+)

Index: renesas-drivers/drivers/clk/renesas/r8a77970-cpg-mssr.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ renesas-drivers/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -106,6 +106,11 @@ static const struct cpg_core_clk r8a7797
 };
 
 static const struct mssr_mod_clk r8a77970_mod_clks[] __initconst = {
+	DEF_MOD("tmu4",			 121,	R8A77970_CLK_S2D2),
+	DEF_MOD("tmu3",			 122,	R8A77970_CLK_S2D2),
+	DEF_MOD("tmu2",			 123,	R8A77970_CLK_S2D2),
+	DEF_MOD("tmu1",			 124,	R8A77970_CLK_S2D2),
+	DEF_MOD("tmu0",			 125,	R8A77970_CLK_CP),
 	DEF_MOD("ivcp1e",		 127,	R8A77970_CLK_S2D1),
 	DEF_MOD("scif4",		 203,	R8A77970_CLK_S2D4),
 	DEF_MOD("scif3",		 204,	R8A77970_CLK_S2D4),
