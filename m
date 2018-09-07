Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:14213 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbeIGNGH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Sep 2018 09:06:07 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        horms+renesas@verge.net.au, geert+renesas@glider.be
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        magnus.damm@gmail.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp,
        cv-dong@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH 4/4] clk: renesas: r8a77995: Add ZA2 clock
Date: Fri,  7 Sep 2018 17:25:43 +0900
Message-Id: <1536308743-29573-5-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1536308743-29573-1-git-send-email-na-hoan@jinso.co.jp>
References: <1536308743-29573-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Add ZA2 clock support for the R8A77995 SoC

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 49e6a0d..bc15daa 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -80,6 +80,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 
 	/* Core Clock Outputs */
 	DEF_FIXED("z2",        R8A77995_CLK_Z2,    CLK_PLL0D3,     1, 1),
+	DEF_FIXED("za2",       R8A77995_CLK_ZA2,   CLK_PLL0D3,    10, 2),
 	DEF_FIXED("ztr",       R8A77995_CLK_ZTR,   CLK_PLL1,       6, 1),
 	DEF_FIXED("zt",        R8A77995_CLK_ZT,    CLK_PLL1,       4, 1),
 	DEF_FIXED("zx",        R8A77995_CLK_ZX,    CLK_PLL1,       3, 1),
-- 
2.7.4
