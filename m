Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34307 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966007AbeBMX2V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 18:28:21 -0500
Received: by mail-wm0-f66.google.com with SMTP id j21so15301175wmh.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2018 15:28:21 -0800 (PST)
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] ARM: shmobile: stout: enable R-Car Gen2 regulator quirk
Date: Wed, 14 Feb 2018 00:28:12 +0100
Message-Id: <20180213232812.31408-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Regulator setup is suboptimal on H2 Stout too.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index 44438f344dc8..b749450d361f 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -1,9 +1,9 @@
 /*
  * R-Car Generation 2 da9063/da9210 regulator quirk
  *
- * The r8a7790/lager and r8a7791/koelsch development boards have da9063 and
- * da9210 regulators.  Both regulators have their interrupt request lines tied
- * to the same interrupt pin (IRQ2) on the SoC.
+ * The r8a7790/lager,stout and r8a7791/koelsch development boards have da9063
+ * and da9210 regulators.  Both regulators have their interrupt request lines
+ * tied to the same interrupt pin (IRQ2) on the SoC.
  *
  * After cold boot or da9063-induced restart, both the da9063 and da9210 seem
  * to assert their interrupt request lines.  Hence as soon as one driver
@@ -118,6 +118,7 @@ static int __init rcar_gen2_regulator_quirk(void)
 
 	if (!of_machine_is_compatible("renesas,koelsch") &&
 	    !of_machine_is_compatible("renesas,lager") &&
+	    !of_machine_is_compatible("renesas,stout") &&
 	    !of_machine_is_compatible("renesas,gose"))
 		return -ENODEV;
 
-- 
2.15.1
