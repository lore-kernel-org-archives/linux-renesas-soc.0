Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:50696 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750816AbcLEKjo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 05:39:44 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/5] ARM: shmobile: apmu: Add more register documentation
Date: Mon,  5 Dec 2016 11:39:37 +0100
Message-Id: <1480934381-32126-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1480934381-32126-1-git-send-email-geert+renesas@glider.be>
References: <1480934381-32126-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Hiep Cao Minh <cm-hiep@jinso.co.jp>
---
v2:
  - Add Tested-by.
---
 arch/arm/mach-shmobile/platsmp-apmu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-shmobile/platsmp-apmu.c b/arch/arm/mach-shmobile/platsmp-apmu.c
index 0c6bb458b7a45128..933f9b9024050223 100644
--- a/arch/arm/mach-shmobile/platsmp-apmu.c
+++ b/arch/arm/mach-shmobile/platsmp-apmu.c
@@ -31,9 +31,15 @@
 	int bit;
 } apmu_cpus[NR_CPUS];
 
-#define WUPCR_OFFS 0x10
-#define PSTR_OFFS 0x40
-#define CPUNCR_OFFS(n) (0x100 + (0x10 * (n)))
+#define WUPCR_OFFS	 0x10		/* Wake Up Control Register */
+#define PSTR_OFFS	 0x40		/* Power Status Register */
+#define CPUNCR_OFFS(n)	(0x100 + (0x10 * (n)))
+					/* CPUn Power Status Control Register */
+
+/* Power Status Register */
+#define CPUNST(r, n)	(((r) >> (n * 4)) & 3)	/* CPUn Status Bit */
+#define CPUST_RUN	0		/* Run Mode */
+#define CPUST_STANDBY	3		/* CoreStandby Mode */
 
 static int __maybe_unused apmu_power_on(void __iomem *p, int bit)
 {
@@ -59,7 +65,7 @@ static int __maybe_unused apmu_power_off_poll(void __iomem *p, int bit)
 	int k;
 
 	for (k = 0; k < 1000; k++) {
-		if (((readl_relaxed(p + PSTR_OFFS) >> (bit * 4)) & 0x03) == 3)
+		if (CPUNST(readl_relaxed(p + PSTR_OFFS), bit) == CPUST_STANDBY)
 			return 1;
 
 		mdelay(1);
-- 
1.9.1
