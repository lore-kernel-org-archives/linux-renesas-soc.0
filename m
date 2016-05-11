Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:12987 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751338AbcEKFbZ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 01:31:25 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
	by imta23.fe.bosch.de (Postfix) with ESMTP id 97F6D158012E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:23 +0200 (CEST)
Received: from FE-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id 34860A403F0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:23 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH v2 05/10] clk: renesas: rcar-gen2: Obtain MD pin value using boot-mode-reg
Date: Wed, 11 May 2016 07:29:33 +0200
Message-ID: <1462944578-1220-6-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Simon Horman <horms+renesas@verge.net.au>

Use new boot mode reg infrastructure to obtain the mode pin
value for initializing clocks for for R-Car Gen2 SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c |  3 +--
 drivers/clk/renesas/clk-rcar-gen2.c      | 12 ++++++++++--
 include/linux/clk/renesas.h              |  2 +-
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index a45b05b..2af84d8 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -138,14 +138,13 @@ void __init rcar_gen2_timer_init_for_arch_timer(void)
 void __init rcar_gen2_timer_init(void)
 {
 	int err;
-	u32 mode = rcar_gen2_read_mode_pins();
 
 	err = rcar_init_boot_mode();
 	if (err)
 		pr_err("Could not initialise boot mode register driver\n");
 
 	rcar_gen2_timer_init_for_arch_timer();
-	rcar_gen2_clocks_init(mode);
+	rcar_gen2_clocks_init();
 	clocksource_probe();
 }
 
diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index 00e6aba..0109878 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -20,6 +20,8 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
+#include <misc/boot-mode-reg.h>
+
 struct rcar_gen2_cpg {
 	struct clk_onecell_data data;
 	spinlock_t lock;
@@ -421,9 +423,15 @@ static void __init rcar_gen2_cpg_clocks_init(struct device_node *np)
 CLK_OF_DECLARE(rcar_gen2_cpg_clks, "renesas,rcar-gen2-cpg-clocks",
 	       rcar_gen2_cpg_clocks_init);
 
-void __init rcar_gen2_clocks_init(u32 mode)
+void __init rcar_gen2_clocks_init(void)
 {
-	cpg_mode = mode;
+	int err;
+
+	err = boot_mode_reg_get(&cpg_mode);
+	if (err) {
+		pr_err("%s: failed to obtain boot mode\n", __func__);
+		return;
+	}
 
 	of_clk_init(NULL);
 }
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index ba6fa41..d4a1518 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -22,7 +22,7 @@ struct generic_pm_domain;
 
 void r8a7778_clocks_init(u32 mode);
 void r8a7779_clocks_init(u32 mode);
-void rcar_gen2_clocks_init(u32 mode);
+void rcar_gen2_clocks_init(void);
 
 void cpg_mstp_add_clk_domain(struct device_node *np);
 #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
-- 
2.8.0
