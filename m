Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41481 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760391AbcKDJpP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 05:45:15 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/9] ARM: shmobile: r8a7743: basic SoC support
Date: Fri,  4 Nov 2016 10:44:37 +0100
Message-Id: <e920565a1cc4a352719b42ba5e83d952a9a26507.1478251657.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1478251657.git.horms+renesas@verge.net.au>
References: <cover.1478251657.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Add minimal support for the RZ/G1M (R8A7743) SoC.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/shmobile.txt |  2 ++
 arch/arm/mach-shmobile/Kconfig                     |  4 +++
 arch/arm/mach-shmobile/Makefile                    |  1 +
 arch/arm/mach-shmobile/setup-r8a7743.c             | 34 ++++++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 arch/arm/mach-shmobile/setup-r8a7743.c

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 2f0b7169f132..058be8180bc4 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -13,6 +13,8 @@ SoCs:
     compatible = "renesas,r8a73a4"
   - R-Mobile A1 (R8A77400)
     compatible = "renesas,r8a7740"
+  - RZ/G1M (R8A77430)
+    compatible = "renesas,r8a7743"
   - R-Car M1A (R8A77781)
     compatible = "renesas,r8a7778"
   - R-Car H1 (R8A77790)
diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index 84fd4e959147..c48be1d332ed 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -67,6 +67,10 @@ config ARCH_R8A7740
 	select ARCH_RMOBILE
 	select RENESAS_INTC_IRQPIN
 
+config ARCH_R8A7743
+	bool "RZ/G1M (R8A77430)"
+	select ARCH_RCAR_GEN2
+
 config ARCH_R8A7778
 	bool "R-Car M1A (R8A77781)"
 	select ARCH_RCAR_GEN1
diff --git a/arch/arm/mach-shmobile/Makefile b/arch/arm/mach-shmobile/Makefile
index 3fc48b02eb4f..332b84f8261f 100644
--- a/arch/arm/mach-shmobile/Makefile
+++ b/arch/arm/mach-shmobile/Makefile
@@ -9,6 +9,7 @@ obj-y				:= timer.o
 obj-$(CONFIG_ARCH_SH73A0)	+= setup-sh73a0.o
 obj-$(CONFIG_ARCH_R8A73A4)	+= setup-r8a73a4.o
 obj-$(CONFIG_ARCH_R8A7740)	+= setup-r8a7740.o
+obj-$(CONFIG_ARCH_R8A7743)	+= setup-r8a7743.o
 obj-$(CONFIG_ARCH_R8A7778)	+= setup-r8a7778.o
 obj-$(CONFIG_ARCH_R8A7779)	+= setup-r8a7779.o pm-r8a7779.o
 obj-$(CONFIG_ARCH_R8A7790)	+= setup-r8a7790.o
diff --git a/arch/arm/mach-shmobile/setup-r8a7743.c b/arch/arm/mach-shmobile/setup-r8a7743.c
new file mode 100644
index 000000000000..a7ecb82d219f
--- /dev/null
+++ b/arch/arm/mach-shmobile/setup-r8a7743.c
@@ -0,0 +1,34 @@
+/*
+ * r8a7743 processor support
+ *
+ * Copyright (C) 2016 Cogent Embedded, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation; of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/init.h>
+
+#include <asm/mach/arch.h>
+
+#include "common.h"
+#include "rcar-gen2.h"
+
+static const char * const r8a7743_boards_compat_dt[] __initconst = {
+	"renesas,r8a7743",
+	NULL,
+};
+
+DT_MACHINE_START(R8A7743_DT, "Generic R8A7743 (Flattened Device Tree)")
+	.init_early	= shmobile_init_delay,
+	.init_time	= rcar_gen2_timer_init,
+	.init_late	= shmobile_init_late,
+	.reserve	= rcar_gen2_reserve,
+	.dt_compat	= r8a7743_boards_compat_dt,
+MACHINE_END
-- 
2.7.0.rc3.207.g0ac5344
