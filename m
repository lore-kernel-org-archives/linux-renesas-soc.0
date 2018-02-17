Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34635 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750957AbeBQCGv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 21:06:51 -0500
Received: by mail-wm0-f65.google.com with SMTP id j21so7737094wmh.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2018 18:06:51 -0800 (PST)
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] ARM: shmobile: porter: enable R-Car Gen2 regulator quirk
Date: Sat, 17 Feb 2018 03:06:42 +0100
Message-Id: <20180217020642.21375-2-marek.vasut+renesas@gmail.com>
In-Reply-To: <20180217020642.21375-1-marek.vasut+renesas@gmail.com>
References: <20180217020642.21375-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Porter needs the regulator quirk, just like the other boards,
the DA9063 and DA9210 IRQ line is connected to CPU IRQ2 . But
unlike the other boards, the DA9063 is at 0x5a on Porter.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index 862f7757ef5d..7963f0eea9e1 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -132,11 +132,16 @@ static int __init rcar_gen2_regulator_quirk(void)
 	u32 mon;
 
 	if (!of_machine_is_compatible("renesas,koelsch") &&
+	    !of_machine_is_compatible("renesas,porter") &&
 	    !of_machine_is_compatible("renesas,lager") &&
 	    !of_machine_is_compatible("renesas,stout") &&
 	    !of_machine_is_compatible("renesas,gose"))
 		return -ENODEV;
 
+	/* DA9063 on M2W Porter is at 0x5a */
+	if (of_machine_is_compatible("renesas,porter"))
+		da9xxx_msgs[0].addr = 0x5a;
+
 	irqc = ioremap(IRQC_BASE, PAGE_SIZE);
 	if (!irqc)
 		return -ENOMEM;
-- 
2.15.1
