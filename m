Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:20861 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbeHXIZr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 04:25:47 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp,
        na-hoan@jinso.co.jp
Subject: [PATCH 2/2] clk: renesas: r8a77965: Add FDP clock
Date: Fri, 24 Aug 2018 13:52:29 +0900
Message-Id: <1535086349-10657-3-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1535086349-10657-1-git-send-email-na-hoan@jinso.co.jp>
References: <1535086349-10657-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 312f9fe..d0847dc 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -112,6 +112,7 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
+	DEF_MOD("fdp0",			119,	R8A77965_CLK_S0D1),
 	DEF_MOD("scif5",		202,	R8A77965_CLK_S3D4),
 	DEF_MOD("scif4",		203,	R8A77965_CLK_S3D4),
 	DEF_MOD("scif3",		204,	R8A77965_CLK_S3D4),
-- 
2.7.4
