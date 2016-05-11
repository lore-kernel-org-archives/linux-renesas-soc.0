Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:12983 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751280AbcEKFbY (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 01:31:24 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
	by imta23.fe.bosch.de (Postfix) with ESMTP id C34F015800A8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:22 +0200 (CEST)
Received: from FE-HUB1001.de.bosch.com (vsgw22.fe.internet.bosch.com [10.4.98.11])
	by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id 5F638A402DF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:22 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 03/10] arm: renesas: rcar-gen2: Obtain MD pin value using boot-mode-reg
Date: Wed, 11 May 2016 07:29:31 +0200
Message-ID: <1462944578-1220-4-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Simon Horman <horms+renesas@verge.net.au>

Use new boot mode reg infrastructure to obtain the mode pin
value for initialising arch timer for R-Car Gen2 SoCs.

Subsequent patches will remove other calls to rcar_gen2_read_mode_pins()
and in turn that function.

rcar_init_boot_mode() is called to implicitly initialise
the R-Car Gen2 boot mod register driver as rcar_gen2_timer_init()
is run before initcalls.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/Kconfig           |  1 +
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 24 +++++++++++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index fe4ccb5..314dcaa 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -23,6 +23,7 @@ config ARCH_RCAR_GEN2
 	select RENESAS_IRQC
 	select SYS_SUPPORTS_SH_CMT
 	select PCI_DOMAINS if PCI
+	select BOOT_MODE_REG_RCAR
 
 config ARCH_RMOBILE
 	bool
diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 1c6fd11..a45b05b 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -24,6 +24,7 @@
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <misc/boot-mode-reg.h>
 #include <asm/mach/arch.h>
 #include "common.h"
 #include "rcar-gen2.h"
@@ -49,13 +50,19 @@ u32 rcar_gen2_read_mode_pins(void)
 #define CNTCR 0
 #define CNTFID0 0x20
 
-void __init rcar_gen2_timer_init(void)
+void __init rcar_gen2_timer_init_for_arch_timer(void)
 {
-	u32 mode = rcar_gen2_read_mode_pins();
 #ifdef CONFIG_ARM_ARCH_TIMER
 	void __iomem *base;
 	int extal_mhz = 0;
-	u32 freq;
+	u32 freq, mode;
+	int err;
+
+	err = boot_mode_reg_get(&mode);
+	if (err) {
+		pr_err("%s: failed obtain boot mode\n", __func__);
+		return;
+	}
 
 	if (of_machine_is_compatible("renesas,r8a7794")) {
 		freq = 260000000 / 8;	/* ZS / 8 */
@@ -126,7 +133,18 @@ void __init rcar_gen2_timer_init(void)
 
 	iounmap(base);
 #endif /* CONFIG_ARM_ARCH_TIMER */
+}
+
+void __init rcar_gen2_timer_init(void)
+{
+	int err;
+	u32 mode = rcar_gen2_read_mode_pins();
+
+	err = rcar_init_boot_mode();
+	if (err)
+		pr_err("Could not initialise boot mode register driver\n");
 
+	rcar_gen2_timer_init_for_arch_timer();
 	rcar_gen2_clocks_init(mode);
 	clocksource_probe();
 }
-- 
2.8.0
