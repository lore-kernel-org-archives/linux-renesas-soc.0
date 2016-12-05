Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:32778 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751176AbcLEKjo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 05:39:44 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/5] ARM: shmobile: apmu: Add debug resource reset for secondary CPU boot
Date: Mon,  5 Dec 2016 11:39:38 +0100
Message-Id: <1480934381-32126-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1480934381-32126-1-git-send-email-geert+renesas@glider.be>
References: <1480934381-32126-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In debug mode (MD21=1), reset requests derived from power-shutoff to the
AP-system CPU cores must be enabled before the AP-system CPU cores
resume from power-shutoff for the first time. Else resume may fail,
causing the system to hang during boot.

As setting these bits is a no-op in normal mode, there's no need to
check the actual state of MD21 first.

Inspired by CPU-specific patches in the BSP by Hisashi Nakamura
<hisashi.nakamura.ak@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Hiep Cao Minh <cm-hiep@jinso.co.jp>
---
v2:
  - Add Tested-by.
---
 arch/arm/mach-shmobile/platsmp-apmu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/mach-shmobile/platsmp-apmu.c b/arch/arm/mach-shmobile/platsmp-apmu.c
index 933f9b9024050223..7e4ca6788be521dc 100644
--- a/arch/arm/mach-shmobile/platsmp-apmu.c
+++ b/arch/arm/mach-shmobile/platsmp-apmu.c
@@ -35,12 +35,18 @@
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
