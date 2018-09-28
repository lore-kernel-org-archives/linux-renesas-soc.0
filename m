Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58325 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729181AbeI1Qqr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 12:46:47 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 01/21] soc: renesas: Identify RZ/G2M
Date: Fri, 28 Sep 2018 12:23:16 +0200
Message-Id: <2a4056a759e26745f3a19431f5428c581fd8f347.1538128711.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1538128711.git.horms+renesas@verge.net.au>
References: <cover.1538128711.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

This patch adds support for identifying the RZ/G2M (r8a774a1) SoC.
It corrects the original RZ/G SoC family name to RZ/G1 and also
adds support for the new RZ/G2 SoC family.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/renesas-soc.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index d44d0e687ab8..56916183739b 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -50,11 +50,16 @@ static const struct renesas_family fam_rza __initconst __maybe_unused = {
 	.name	= "RZ/A",
 };
 
-static const struct renesas_family fam_rzg __initconst __maybe_unused = {
-	.name	= "RZ/G",
+static const struct renesas_family fam_rzg1 __initconst __maybe_unused = {
+	.name	= "RZ/G1",
 	.reg	= 0xff000044,		/* PRR (Product Register) */
 };
 
+static const struct renesas_family fam_rzg2 __initconst __maybe_unused = {
+	.name	= "RZ/G2",
+	.reg	= 0xfff00044,		/* PRR (Product Register) */
+};
+
 static const struct renesas_family fam_shmobile __initconst __maybe_unused = {
 	.name	= "SH-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -81,30 +86,35 @@ static const struct renesas_soc soc_rmobile_a1 __initconst __maybe_unused = {
 };
 
 static const struct renesas_soc soc_rz_g1h __initconst __maybe_unused = {
-	.family	= &fam_rzg,
+	.family	= &fam_rzg1,
 	.id	= 0x45,
 };
 
 static const struct renesas_soc soc_rz_g1m __initconst __maybe_unused = {
-	.family	= &fam_rzg,
+	.family	= &fam_rzg1,
 	.id	= 0x47,
 };
 
 static const struct renesas_soc soc_rz_g1n __initconst __maybe_unused = {
-	.family	= &fam_rzg,
+	.family	= &fam_rzg1,
 	.id	= 0x4b,
 };
 
 static const struct renesas_soc soc_rz_g1e __initconst __maybe_unused = {
-	.family	= &fam_rzg,
+	.family	= &fam_rzg1,
 	.id	= 0x4c,
 };
 
 static const struct renesas_soc soc_rz_g1c __initconst __maybe_unused = {
-	.family	= &fam_rzg,
+	.family	= &fam_rzg1,
 	.id	= 0x53,
 };
 
+static const struct renesas_soc soc_rz_g2m __initconst __maybe_unused = {
+	.family	= &fam_rzg2,
+	.id	= 0x52,
+};
+
 static const struct renesas_soc soc_rcar_m1a __initconst __maybe_unused = {
 	.family	= &fam_rcar_gen1,
 };
@@ -205,6 +215,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A77470
 	{ .compatible = "renesas,r8a77470",	.data = &soc_rz_g1c },
 #endif
+#ifdef CONFIG_ARCH_R8A774A1
+	{ .compatible = "renesas,r8a774a1",	.data = &soc_rz_g2m },
+#endif
 #ifdef CONFIG_ARCH_R8A7778
 	{ .compatible = "renesas,r8a7778",	.data = &soc_rcar_m1a },
 #endif
-- 
2.11.0
