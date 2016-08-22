Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from newton.telenet-ops.be ([195.130.132.45]:36687 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755158AbcHVOp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 10:45:56 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTP id 3sHxFY2y3pzMrX8j
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2016 16:45:37 +0200 (CEST)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 2/4] ARM: shmobile: apmu: Add debug resource reset for secondary CPU boot
Date: Mon, 22 Aug 2016 16:44:27 +0200
Message-Id: <1471877069-4157-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1471877069-4157-1-git-send-email-geert+renesas@glider.be>
References: <1471877069-4157-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In debug mode (MD21=1), reset requests derived from power-shutoff to the
AP-system CPU cores must be enabled before the AP-system cores first
resume from power-shutoff. Else resume may fail, causing the system to
hang during boot.

As setting these bits is a no-op in normal mode, there's no need to
check the actual state of MD21 first.

Inspired by CPU-specific patches in the BSP by Hisashi Nakamura
<hisashi.nakamura.ak@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/platsmp-apmu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/mach-shmobile/platsmp-apmu.c b/arch/arm/mach-shmobile/platsmp-apmu.c
index 933f9b9024050223..7e4ca6788be521dc 100644
--- a/arch/arm/mach-shmobile/platsmp-apmu.c
+++ b/arch/arm/mach-shmobile/platsmp-apmu.c
@@ -35,12 +35,18 @@ static struct {
 #define PSTR_OFFS	 0x40		/* Power Status Register */
 #define CPUNCR_OFFS(n)	(0x100 + (0x10 * (n)))
 					/* CPUn Power Status Control Register */
+#define DBGRCR_OFFS	0x180		/* Debug Resource Reset Control Reg. */
 
 /* Power Status Register */
 #define CPUNST(r, n)	(((r) >> (n * 4)) & 3)	/* CPUn Status Bit */
 #define CPUST_RUN	0		/* Run Mode */
 #define CPUST_STANDBY	3		/* CoreStandby Mode */
 
+/* Debug Resource Reset Control Register */
+#define DBGCPUREN	BIT(24)		/* CPU Other Reset Request Enable */
+#define DBGCPUNREN(n)	BIT((n) + 20)	/* CPUn Reset Request Enable */
+#define DBGCPUPREN	BIT(19)		/* CPU Peripheral Reset Req. Enable */
+
 static int __maybe_unused apmu_power_on(void __iomem *p, int bit)
 {
 	/* request power on */
@@ -84,6 +90,8 @@ static int __maybe_unused apmu_wrap(int cpu, int (*fn)(void __iomem *p, int cpu)
 #ifdef CONFIG_SMP
 static void apmu_init_cpu(struct resource *res, int cpu, int bit)
 {
+	u32 x;
+
 	if ((cpu >= ARRAY_SIZE(apmu_cpus)) || apmu_cpus[cpu].iomem)
 		return;
 
@@ -91,6 +99,11 @@ static void apmu_init_cpu(struct resource *res, int cpu, int bit)
 	apmu_cpus[cpu].bit = bit;
 
 	pr_debug("apmu ioremap %d %d %pr\n", cpu, bit, res);
+
+	/* Setup for debug mode */
+	x = readl(apmu_cpus[cpu].iomem + DBGRCR_OFFS);
+	x |= DBGCPUREN | DBGCPUNREN(bit) | DBGCPUPREN;
+	writel(x, apmu_cpus[cpu].iomem + DBGRCR_OFFS);
 }
 
 static void apmu_parse_cfg(void (*fn)(struct resource *res, int cpu, int bit),
-- 
1.9.1
