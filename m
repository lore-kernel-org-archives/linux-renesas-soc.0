Return-Path: <kieranbingham@gmail.com>
From: Kieran Bingham <kieran@bingham.xyz>
To: linux-renesas-soc@vger.kernel.org
Cc: kuninori.morimoto.gx@renesas.com,
	Kieran Bingham <kieran@bingham.xyz>
Subject: [PATCH] clk: renesas: Provide r8a7795 FDP1 clocks
Date: Tue, 17 May 2016 11:03:31 +0100
Message-Id: <1463479411-10817-2-git-send-email-kieran@bingham.xyz>
In-Reply-To: <1463479411-10817-1-git-send-email-kieran@bingham.xyz>
References: <1463479411-10817-1-git-send-email-kieran@bingham.xyz>
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the clocks with a parent of S2D1 for now, until the correct
parentage is identified
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 6af7f5b6e824..5fdc6bd840a4 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -128,6 +128,9 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
+	DEF_MOD("fdp1-ch2",		 117,	R8A7795_CLK_S2D1),
+	DEF_MOD("fdp1-ch1",		 118,	R8A7795_CLK_S2D1),
+	DEF_MOD("fdp1-ch0",		 119,	R8A7795_CLK_S2D1),
 	DEF_MOD("scif5",		 202,	R8A7795_CLK_S3D4),
 	DEF_MOD("scif4",		 203,	R8A7795_CLK_S3D4),
 	DEF_MOD("scif3",		 204,	R8A7795_CLK_S3D4),
-- 
2.5.0
