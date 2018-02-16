Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35310 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751459AbeBPS2F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 13:28:05 -0500
Received: by mail-lf0-f68.google.com with SMTP id a204so5264811lfa.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2018 10:28:04 -0800 (PST)
Subject: [PATCH v2 1/5] soc: renesas: rcar-sysc: add R8A77980 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
References: <ae31804b-969b-9b20-16d0-50f5dea42f08@cogentembedded.com>
Message-ID: <3a00f5ec-e642-5c7a-c243-e2a5f13e1eac@cogentembedded.com>
Date: Fri, 16 Feb 2018 21:28:02 +0300
MIME-Version: 1.0
In-Reply-To: <ae31804b-969b-9b20-16d0-50f5dea42f08@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for R-Car V3H (R8A77980) SoC power areas to the R-Car SYSC
driver.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

---
Changes in version 2:
- fixed the parents of the A2Rn, A2SCn, A2PDn, and A2CN power domains;
- added Simon's and Geert's tags.

 Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt |    1 
 drivers/soc/renesas/Kconfig                                   |    5 
 drivers/soc/renesas/Makefile                                  |    1 
 drivers/soc/renesas/r8a77980-sysc.c                           |   52 ++++++++++
 drivers/soc/renesas/rcar-sysc.c                               |    3 
 drivers/soc/renesas/rcar-sysc.h                               |    1 
 6 files changed, 63 insertions(+)

Index: renesas/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
+++ renesas/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
@@ -18,6 +18,7 @@ Required properties:
       - "renesas,r8a7795-sysc" (R-Car H3)
       - "renesas,r8a7796-sysc" (R-Car M3-W)
       - "renesas,r8a77970-sysc" (R-Car V3M)
+      - "renesas,r8a77980-sysc" (R-Car V3H)
       - "renesas,r8a77995-sysc" (R-Car D3)
   - reg: Address start and address range for the device.
   - #power-domain-cells: Must be 1.
Index: renesas/drivers/soc/renesas/Kconfig
===================================================================
--- renesas.orig/drivers/soc/renesas/Kconfig
+++ renesas/drivers/soc/renesas/Kconfig
@@ -15,6 +15,7 @@ config SOC_RENESAS
 	select SYSC_R8A7795 if ARCH_R8A7795
 	select SYSC_R8A7796 if ARCH_R8A7796
 	select SYSC_R8A77970 if ARCH_R8A77970
+	select SYSC_R8A77980 if ARCH_R8A77980
 	select SYSC_R8A77995 if ARCH_R8A77995
 
 if SOC_RENESAS
@@ -60,6 +61,10 @@ config SYSC_R8A77970
 	bool "R-Car V3M System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
 
+config SYSC_R8A77980
+	bool "R-Car V3H System Controller support" if COMPILE_TEST
+	select SYSC_RCAR
+
 config SYSC_R8A77995
 	bool "R-Car D3 System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
Index: renesas/drivers/soc/renesas/Makefile
===================================================================
--- renesas.orig/drivers/soc/renesas/Makefile
+++ renesas/drivers/soc/renesas/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_SYSC_R8A7794)	+= r8a7794-sy
 obj-$(CONFIG_SYSC_R8A7795)	+= r8a7795-sysc.o
 obj-$(CONFIG_SYSC_R8A7796)	+= r8a7796-sysc.o
 obj-$(CONFIG_SYSC_R8A77970)	+= r8a77970-sysc.o
+obj-$(CONFIG_SYSC_R8A77980)	+= r8a77980-sysc.o
 obj-$(CONFIG_SYSC_R8A77995)	+= r8a77995-sysc.o
 
 # Family
Index: renesas/drivers/soc/renesas/r8a77980-sysc.c
===================================================================
--- /dev/null
+++ renesas/drivers/soc/renesas/r8a77980-sysc.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas R-Car V3H System Controller
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018 Cogent Embedded, Inc.
+ */
+
+#include <linux/bug.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/power/r8a77980-sysc.h>
+
+#include "rcar-sysc.h"
+
+static const struct rcar_sysc_area r8a77980_areas[] __initconst = {
+	{ "always-on",	    0, 0, R8A77980_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
+	{ "ca53-scu",	0x140, 0, R8A77980_PD_CA53_SCU,	R8A77980_PD_ALWAYS_ON,
+	  PD_SCU },
+	{ "ca53-cpu0",	0x200, 0, R8A77980_PD_CA53_CPU0, R8A77980_PD_CA53_SCU,
+	  PD_CPU_NOCR },
+	{ "ca53-cpu1",	0x200, 1, R8A77980_PD_CA53_CPU1, R8A77980_PD_CA53_SCU,
+	  PD_CPU_NOCR },
+	{ "ca53-cpu2",	0x200, 2, R8A77980_PD_CA53_CPU2, R8A77980_PD_CA53_SCU,
+	  PD_CPU_NOCR },
+	{ "ca53-cpu3",	0x200, 3, R8A77980_PD_CA53_CPU3, R8A77980_PD_CA53_SCU,
+	  PD_CPU_NOCR },
+	{ "cr7",	0x240, 0, R8A77980_PD_CR7,	R8A77980_PD_ALWAYS_ON },
+	{ "a3ir",	0x180, 0, R8A77980_PD_A3IR,	R8A77980_PD_ALWAYS_ON },
+	{ "a2ir0",	0x400, 0, R8A77980_PD_A2IR0,	R8A77980_PD_A3IR },
+	{ "a2ir1",	0x400, 1, R8A77980_PD_A2IR1,	R8A77980_PD_A3IR },
+	{ "a2ir2",	0x400, 2, R8A77980_PD_A2IR2,	R8A77980_PD_A3IR },
+	{ "a2ir3",	0x400, 3, R8A77980_PD_A2IR3,	R8A77980_PD_A3IR },
+	{ "a2ir4",	0x400, 4, R8A77980_PD_A2IR4,	R8A77980_PD_A3IR },
+	{ "a2ir5",	0x400, 5, R8A77980_PD_A2IR5,	R8A77980_PD_A3IR },
+	{ "a2sc0",	0x400, 6, R8A77980_PD_A2SC0,	R8A77980_PD_A3IR },
+	{ "a2sc1",	0x400, 7, R8A77980_PD_A2SC1,	R8A77980_PD_A3IR },
+	{ "a2sc2",	0x400, 8, R8A77980_PD_A2SC2,	R8A77980_PD_A3IR },
+	{ "a2sc3",	0x400, 9, R8A77980_PD_A2SC3,	R8A77980_PD_A3IR },
+	{ "a2sc4",	0x400, 10, R8A77980_PD_A2SC4,	R8A77980_PD_A3IR },
+	{ "a2pd0",	0x400, 11, R8A77980_PD_A2PD0,	R8A77980_PD_A3IR },
+	{ "a2pd1",	0x400, 12, R8A77980_PD_A2PD1,	R8A77980_PD_A3IR },
+	{ "a2cn",	0x400, 13, R8A77980_PD_A2CN,	R8A77980_PD_A3IR },
+	{ "a3vip",	0x2c0, 0, R8A77980_PD_A3VIP,	R8A77980_PD_ALWAYS_ON },
+	{ "a3vip1",	0x300, 0, R8A77980_PD_A3VIP1,	R8A77980_PD_A3VIP },
+	{ "a3vip2",	0x280, 0, R8A77980_PD_A3VIP2,	R8A77980_PD_A3VIP },
+};
+
+const struct rcar_sysc_info r8a77980_sysc_info __initconst = {
+	.areas = r8a77980_areas,
+	.num_areas = ARRAY_SIZE(r8a77980_areas),
+};
Index: renesas/drivers/soc/renesas/rcar-sysc.c
===================================================================
--- renesas.orig/drivers/soc/renesas/rcar-sysc.c
+++ renesas/drivers/soc/renesas/rcar-sysc.c
@@ -287,6 +287,9 @@ static const struct of_device_id rcar_sy
 #ifdef CONFIG_SYSC_R8A77970
 	{ .compatible = "renesas,r8a77970-sysc", .data = &r8a77970_sysc_info },
 #endif
+#ifdef CONFIG_SYSC_R8A77980
+	{ .compatible = "renesas,r8a77980-sysc", .data = &r8a77980_sysc_info },
+#endif
 #ifdef CONFIG_SYSC_R8A77995
 	{ .compatible = "renesas,r8a77995-sysc", .data = &r8a77995_sysc_info },
 #endif
Index: renesas/drivers/soc/renesas/rcar-sysc.h
===================================================================
--- renesas.orig/drivers/soc/renesas/rcar-sysc.h
+++ renesas/drivers/soc/renesas/rcar-sysc.h
@@ -59,6 +59,7 @@ extern const struct rcar_sysc_info r8a77
 extern const struct rcar_sysc_info r8a7795_sysc_info;
 extern const struct rcar_sysc_info r8a7796_sysc_info;
 extern const struct rcar_sysc_info r8a77970_sysc_info;
+extern const struct rcar_sysc_info r8a77980_sysc_info;
 extern const struct rcar_sysc_info r8a77995_sysc_info;
 
 
