Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56197 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753311AbcHQLcS (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 17 Aug 2016 07:32:18 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RTF 1/7] clk: renesas: r8a7796: Add GPIO clocks
Date: Wed, 17 Aug 2016 13:31:50 +0200
Message-Id: <1471433516-4478-2-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1471433516-4478-1-git-send-email-horms+renesas@verge.net.au>
References: <1471433516-4478-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Add GPIO clocks for the R8A7796 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index c0dee762ed23..999955c2b23e 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -106,6 +106,14 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("scif2",		 310,	R8A7796_CLK_S3D4),
 	DEF_MOD("rwdt0",		 402,	R8A7796_CLK_R),
 	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S3D1),
+	DEF_MOD("gpio7",		 905,	R8A7796_CLK_S3D4),
+	DEF_MOD("gpio6",		 906,	R8A7796_CLK_S3D4),
+	DEF_MOD("gpio5",		 907,	R8A7796_CLK_S3D4),
+	DEF_MOD("gpio4",		 908,	R8A7796_CLK_S3D4),
+	DEF_MOD("gpio3",		 909,	R8A7796_CLK_S3D4),
+	DEF_MOD("gpio2",		 910,	R8A7796_CLK_S3D4),
+	DEF_MOD("gpio1",		 911,	R8A7796_CLK_S3D4),
+	DEF_MOD("gpio0",		 912,	R8A7796_CLK_S3D4),
 };
 
 static const unsigned int r8a7796_crit_mod_clks[] __initconst = {
-- 
2.7.0.rc3.207.g0ac5344
