Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from leibniz.telenet-ops.be ([195.130.137.77]:47842 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755211AbcHVOp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 10:45:56 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTP id 3sHxFY2NQqzMr06S
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2016 16:45:37 +0200 (CEST)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] ARM: shmobile: apmu: Add more register documentation
Date: Mon, 22 Aug 2016 16:44:26 +0200
Message-Id: <1471877069-4157-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1471877069-4157-1-git-send-email-geert+renesas@glider.be>
References: <1471877069-4157-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/platsmp-apmu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-shmobile/platsmp-apmu.c b/arch/arm/mach-shmobile/platsmp-apmu.c
index 0c6bb458b7a45128..933f9b9024050223 100644
--- a/arch/arm/mach-shmobile/platsmp-apmu.c
+++ b/arch/arm/mach-shmobile/platsmp-apmu.c
@@ -31,9 +31,15 @@ static struct {
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
