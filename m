Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:34155 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752935AbcEaWSZ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 18:18:25 -0400
Received: by mail-lf0-f41.google.com with SMTP id k98so898923lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 May 2016 15:18:25 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/13] ARM: shmobile: r8a7792: basic SoC support
Date: Wed, 01 Jun 2016 01:18:22 +0300
Message-ID: <2352834.cNFKgiQiVO@wasted.cogentembedded.com>
In-Reply-To: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add minimal support for the R-Car V2H (R8A7792) SoC.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/mach-shmobile/Kconfig         |    5 ++++
 arch/arm/mach-shmobile/Makefile        |    1 
 arch/arm/mach-shmobile/setup-r8a7792.c |   34 +++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

Index: renesas/arch/arm/mach-shmobile/Kconfig
===================================================================
--- renesas.orig/arch/arm/mach-shmobile/Kconfig
+++ renesas/arch/arm/mach-shmobile/Kconfig
@@ -86,6 +86,11 @@ config ARCH_R8A7791
 	select ARCH_RCAR_GEN2
 	select I2C
 
+config ARCH_R8A7792
+	bool "R-Car V2H (R8A77920)"
+	select ARCH_RCAR_GEN2
+	select I2C
+
 config ARCH_R8A7793
 	bool "R-Car M2-N (R8A7793)"
 	select ARCH_RCAR_GEN2
Index: renesas/arch/arm/mach-shmobile/Makefile
===================================================================
--- renesas.orig/arch/arm/mach-shmobile/Makefile
+++ renesas/arch/arm/mach-shmobile/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_ARCH_R8A7778)	+= setup-r8a7
 obj-$(CONFIG_ARCH_R8A7779)	+= setup-r8a7779.o pm-r8a7779.o
 obj-$(CONFIG_ARCH_R8A7790)	+= setup-r8a7790.o
 obj-$(CONFIG_ARCH_R8A7791)	+= setup-r8a7791.o
+obj-$(CONFIG_ARCH_R8A7792)	+= setup-r8a7792.o
 obj-$(CONFIG_ARCH_R8A7793)	+= setup-r8a7793.o
 obj-$(CONFIG_ARCH_R8A7794)	+= setup-r8a7794.o
 obj-$(CONFIG_ARCH_EMEV2)	+= setup-emev2.o
Index: renesas/arch/arm/mach-shmobile/setup-r8a7792.c
===================================================================
--- /dev/null
+++ renesas/arch/arm/mach-shmobile/setup-r8a7792.c
@@ -0,0 +1,34 @@
+/*
+ * r8a7792 processor support
+ *
+ * Copyright (C) 2014  Renesas Electronics Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/of_platform.h>
+
+#include <asm/mach/arch.h>
+
+#include "common.h"
+#include "rcar-gen2.h"
+
+static const char * const r8a7792_boards_compat_dt[] __initconst = {
+	"renesas,r8a7792",
+	NULL,
+};
+
+DT_MACHINE_START(R8A7792_DT, "Generic R8A7792 (Flattened Device Tree)")
+	.init_early	= shmobile_init_delay,
+	.init_late	= shmobile_init_late,
+	.init_time	= rcar_gen2_timer_init,
+	.reserve	= rcar_gen2_reserve,
+	.dt_compat	= r8a7792_boards_compat_dt,
+MACHINE_END
