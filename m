Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:37869 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388406AbeGXRAM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 13:00:12 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 3/3] soc: renesas: Identify RZ/G2M
Date: Tue, 24 Jul 2018 16:47:18 +0100
Message-Id: <1532447238-13486-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1532447238-13486-1-git-send-email-biju.das@bp.renesas.com>
References: <1532447238-13486-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds support for identifying the RZ/G2M (r8a774a1) SoC.
It corrects the original RZ/G SoC family name to RZ/G1 and also 
adds support for the new RZ/G2 SoC family.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
---
This patch corrects the RZ/G family name. Can it be 
considered for 4.19?
---
 drivers/soc/renesas/renesas-soc.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index d44d0e6..5691618 100644
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
2.7.4
