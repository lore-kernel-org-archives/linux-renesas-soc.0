Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:40614 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756600AbdLOPO5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:14:57 -0500
Received: by mail-wm0-f66.google.com with SMTP id f206so18149555wmf.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 07:14:57 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        geert@linux-m68k.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: [PATCH 1/4] clk: renesas: r8a7796: Add ZG clock
Date: Fri, 15 Dec 2017 16:14:47 +0100
Message-Id: <1513350890-2446-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1513350890-2446-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350890-2446-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds ZG clock for R8A7796 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 83a68e5..61247b5 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -76,6 +76,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	/* Core Clock Outputs */
 	DEF_BASE("z",           R8A7796_CLK_Z,     CLK_TYPE_GEN3_Z, CLK_PLL0),
 	DEF_BASE("z2",          R8A7796_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2),
+	DEF_FIXED("zg",         R8A7796_CLK_ZG,    CLK_PLL4,       4, 1),
 	DEF_FIXED("ztr",        R8A7796_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A7796_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A7796_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
@@ -117,6 +118,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
+	DEF_MOD("3dge",			 112,	R8A7796_CLK_ZG),
 	DEF_MOD("scif5",		 202,	R8A7796_CLK_S3D4),
 	DEF_MOD("scif4",		 203,	R8A7796_CLK_S3D4),
 	DEF_MOD("scif3",		 204,	R8A7796_CLK_S3D4),
-- 
2.7.4
