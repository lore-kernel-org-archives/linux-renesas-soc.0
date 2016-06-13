Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:39046 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964910AbcFMK3l (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 13 Jun 2016 06:29:41 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Obtain extal frequency from DT
Date: Mon, 13 Jun 2016 12:29:37 +0200
Message-Id: <1465813777-11837-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On some R-Car Gen2 SoCs, the frequency of the ARM architecture timer
depends on the frequency of the external clock crystal.  Currently the
latter is determined indirectly from the state of the mode pins, which
is a relic predating DT.

Obtain the external clock crystal frequency from DT instead, removing
the dependency on the mode pins.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against renesas-devel-20160613-v4.7-rc3.
Tested on r8a7790/lager and r8a7791/koelsch.
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 42 +++++++++++++++++---------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 1c6fd11c2f824019..ea092d5dd475042d 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -46,6 +46,26 @@ u32 rcar_gen2_read_mode_pins(void)
 	return mode;
 }
 
+static unsigned int __init get_extal_freq(void)
+{
+	struct device_node *cpg, *extal;
+	u32 freq = 20000000;
+
+	cpg = of_find_compatible_node(NULL, NULL,
+				      "renesas,rcar-gen2-cpg-clocks");
+	if (!cpg)
+		return freq;
+
+	extal = of_parse_phandle(cpg, "clocks", 0);
+	of_node_put(cpg);
+	if (!extal)
+		return freq;
+
+	of_property_read_u32(extal, "clock-frequency", &freq);
+	of_node_put(extal);
+	return freq;
+}
+
 #define CNTCR 0
 #define CNTFID0 0x20
 
@@ -54,7 +74,6 @@ void __init rcar_gen2_timer_init(void)
 	u32 mode = rcar_gen2_read_mode_pins();
 #ifdef CONFIG_ARM_ARCH_TIMER
 	void __iomem *base;
-	int extal_mhz = 0;
 	u32 freq;
 
 	if (of_machine_is_compatible("renesas,r8a7794")) {
@@ -82,26 +101,9 @@ void __init rcar_gen2_timer_init(void)
 		 * with the counter disabled. Moreover, it may also report
 		 * a potentially incorrect fixed 13 MHz frequency. To be
 		 * correct these registers need to be updated to use the
-		 * frequency EXTAL / 2 which can be determined by the MD pins.
+		 * frequency EXTAL / 2.
 		 */
-
-		switch (mode & (MD(14) | MD(13))) {
-		case 0:
-			extal_mhz = 15;
-			break;
-		case MD(13):
-			extal_mhz = 20;
-			break;
-		case MD(14):
-			extal_mhz = 26;
-			break;
-		case MD(13) | MD(14):
-			extal_mhz = 30;
-			break;
-		}
-
-		/* The arch timer frequency equals EXTAL / 2 */
-		freq = extal_mhz * (1000000 / 2);
+		freq = get_extal_freq() / 2;
 	}
 
 	/* Remap "armgcnt address map" space */
-- 
1.9.1
