Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:33354 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751096AbcLEKjo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 05:39:44 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 5/5] ARM: shmobile: rcar-gen2: Remove unused rcar_gen2_read_mode_pins()
Date: Mon,  5 Dec 2016 11:39:41 +0100
Message-Id: <1480934381-32126-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1480934381-32126-1-git-send-email-geert+renesas@glider.be>
References: <1480934381-32126-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

After
  1. commit 9f5ce39ddb8f68b3 ("ARM: shmobile: rcar-gen2: Obtain extal
     frequency from DT"),
  2. commit 80951f04c3f92533 ("ARM: shmobile: rcar-gen2: Stop passing
     mode pins state to clock driver"),
  3. and handling of debug resource reset,
there are no more users of rcar_gen2_read_mode_pins() left.
Remove the function and its support definitions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/arm/mach-shmobile/rcar-gen2.h       |  2 --
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 18 ------------------
 2 files changed, 20 deletions(-)

diff --git a/arch/arm/mach-shmobile/rcar-gen2.h b/arch/arm/mach-shmobile/rcar-gen2.h
index 8a66b4aae03548ce..6792e249cf56d5d5 100644
--- a/arch/arm/mach-shmobile/rcar-gen2.h
+++ b/arch/arm/mach-shmobile/rcar-gen2.h
@@ -2,8 +2,6 @@
 #define __ASM_RCAR_GEN2_H__
 
 void rcar_gen2_timer_init(void);
-#define MD(nr) BIT(nr)
-u32 rcar_gen2_read_mode_pins(void);
 void rcar_gen2_reserve(void);
 void rcar_gen2_pm_init(void);
 
diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index ac63fa407b6465d8..52d466b759730d74 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -29,24 +29,6 @@
 #include "common.h"
 #include "rcar-gen2.h"
 
-#define MODEMR 0xe6160060
-
-u32 rcar_gen2_read_mode_pins(void)
-{
-	static u32 mode;
-	static bool mode_valid;
-
-	if (!mode_valid) {
-		void __iomem *modemr = ioremap_nocache(MODEMR, 4);
-		BUG_ON(!modemr);
-		mode = ioread32(modemr);
-		iounmap(modemr);
-		mode_valid = true;
-	}
-
-	return mode;
-}
-
 static unsigned int __init get_extal_freq(void)
 {
 	struct device_node *cpg, *extal;
-- 
1.9.1
