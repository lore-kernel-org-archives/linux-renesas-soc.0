Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:46896 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753538AbeAQPmG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 10:42:06 -0500
Received: by mail-wm0-f68.google.com with SMTP id 143so16002338wma.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jan 2018 07:42:05 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        geert@linux-m68k.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: [PATCH 1/2] clk: renesas: r8a7796: Add ZG clock
Date: Wed, 17 Jan 2018 16:41:55 +0100
Message-Id: <1516203716-4606-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1516203716-4606-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1516203716-4606-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds ZG clock for R8A7796 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index dfb267a..f75adcf 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -76,6 +76,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	/* Core Clock Outputs */
 	DEF_BASE("z",           R8A7796_CLK_Z,     CLK_TYPE_GEN3_Z, CLK_PLL0),
 	DEF_BASE("z2",          R8A7796_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2),
+	DEF_BASE("zg",          R8A7796_CLK_ZG,    CLK_TYPE_GEN3_ZG, CLK_PLL4),
 	DEF_FIXED("ztr",        R8A7796_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A7796_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A7796_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
@@ -117,6 +118,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
+	DEF_MOD("3dge",			 112,	R8A7796_CLK_ZG),
 	DEF_MOD("fdp1-0",		 119,	R8A7796_CLK_S0D1),
 	DEF_MOD("scif5",		 202,	R8A7796_CLK_S3D4),
 	DEF_MOD("scif4",		 203,	R8A7796_CLK_S3D4),
-- 
2.7.4
