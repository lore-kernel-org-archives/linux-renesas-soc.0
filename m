Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53723 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751733AbeACMS7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jan 2018 07:18:59 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v4 4/6] clk: renesas: r8a7795: Add Z2 clock
Date: Wed,  3 Jan 2018 13:18:38 +0100
Message-Id: <20180103121840.29316-5-horms+renesas@verge.net.au>
In-Reply-To: <20180103121840.29316-1-horms+renesas@verge.net.au>
References: <20180103121840.29316-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds Z2 clock for r8a7795 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 995a4c4fb01e..775b0ceaa337 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -75,6 +75,7 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 
 	/* Core Clock Outputs */
 	DEF_BASE("z",           R8A7795_CLK_Z,     CLK_TYPE_GEN3_Z, CLK_PLL0),
+	DEF_BASE("z2",          R8A7795_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2),
 	DEF_FIXED("ztr",        R8A7795_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A7795_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A7795_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
-- 
2.11.0
