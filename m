Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:44693 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750717AbcISOWt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 10:22:49 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] ARM: shmobile: rcar-gen2: Add support for RZ/G CPG/MSSR bindings
Date: Mon, 19 Sep 2016 16:22:50 +0200
Message-Id: <1474294970-24744-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When using the new CPG/MSSR bindings, there's no longer a
"renesas,rcar-gen2-cpg-clocks" node.  Add support for finding the
external clock crystal oscillator on RZ/G1M and RZ/G1E through a
"renesas,r8a774x-cpg-mssr" node.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
	Hi Sergei,

As I had this patch more or less ready (using r8a779[0-5] instead of
r8a774[35] though), and you're gonna need it as a prerequisite for the
r8a7743 CPG/MSSR driver, I'm sending it now.

 arch/arm/mach-shmobile/setup-rcar-gen2.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index b527258e0a62e806..e216f3f83d26ecbb 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -46,17 +46,27 @@ u32 rcar_gen2_read_mode_pins(void)
 	return mode;
 }
 
+static const struct of_device_id cpg_matches[] __initconst = {
+	{ .compatible = "renesas,rcar-gen2-cpg-clocks", },
+	{ .compatible = "renesas,r8a7743-cpg-mssr", .data = "extal" },
+	{ .compatible = "renesas,r8a7745-cpg-mssr", .data = "extal" },
+	{ /* sentinel */ }
+};
+
 static unsigned int __init get_extal_freq(void)
 {
+	const struct of_device_id *match;
 	struct device_node *cpg, *extal;
 	u32 freq = 20000000;
+	int idx = 0;
 
-	cpg = of_find_compatible_node(NULL, NULL,
-				      "renesas,rcar-gen2-cpg-clocks");
+	cpg = of_find_matching_node_and_match(NULL, cpg_matches, &match);
 	if (!cpg)
 		return freq;
 
-	extal = of_parse_phandle(cpg, "clocks", 0);
+	if (match->data)
+		idx = of_property_match_string(cpg, "clock-names", match->data);
+	extal = of_parse_phandle(cpg, "clocks", idx);
 	of_node_put(cpg);
 	if (!extal)
 		return freq;
-- 
1.9.1
