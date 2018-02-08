Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:38472 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751834AbeBHKeY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Feb 2018 05:34:24 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 01/11] clk: renesas: r8a7792: Add rwdt clock
Date: Thu,  8 Feb 2018 11:34:07 +0100
Message-Id: <1518086057-19448-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
References: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add "rwdt" clock to r8a7792_mod_clks. Also, since we may need to access
the watchdog registers at any time, declare the clock as critical.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7792-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a7792-cpg-mssr.c b/drivers/clk/renesas/r8a7792-cpg-mssr.c
index 7f85bbf20bf782b7..609a540804965c40 100644
--- a/drivers/clk/renesas/r8a7792-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7792-cpg-mssr.c
@@ -98,6 +98,7 @@ static const struct mssr_mod_clk r8a7792_mod_clks[] __initconst = {
 	DEF_MOD("tpu0",			 304,	R8A7792_CLK_CP),
 	DEF_MOD("sdhi0",		 314,	R8A7792_CLK_SD),
 	DEF_MOD("cmt1",			 329,	R8A7792_CLK_R),
+	DEF_MOD("rwdt",			 402,	R8A7792_CLK_R),
 	DEF_MOD("irqc",			 407,	R8A7792_CLK_CP),
 	DEF_MOD("intc-sys",		 408,	R8A7792_CLK_ZS),
 	DEF_MOD("audio-dmac0",		 502,	R8A7792_CLK_HP),
@@ -154,6 +155,7 @@ static const struct mssr_mod_clk r8a7792_mod_clks[] __initconst = {
 };
 
 static const unsigned int r8a7792_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-SYS (GIC) */
 };
 
-- 
2.7.4
