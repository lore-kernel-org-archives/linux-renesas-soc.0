Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:35673 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933813AbcKDVqR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 17:46:17 -0400
Received: by mail-lf0-f44.google.com with SMTP id b14so73959672lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Nov 2016 14:46:16 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: [PATCH v2 02/11] soc: renesas: rcar-sysc: add R8A7745 support
Date: Sat, 05 Nov 2016 00:46:13 +0300
Message-ID: <1834171.PEVAvqbuLx@wasted.cogentembedded.com>
In-Reply-To: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for RZ/G1E (R8A7745) SoC power areas to the R-Car SYSC driver.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 2:
- added Geert's tag.

 Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt |    1 
 drivers/soc/renesas/Makefile                                  |    1 
 drivers/soc/renesas/r8a7745-sysc.c                            |   32 ++++++++++
 drivers/soc/renesas/rcar-sysc.c                               |    3 
 drivers/soc/renesas/rcar-sysc.h                               |    1 
 5 files changed, 38 insertions(+)

Index: renesas/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
+++ renesas/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
@@ -8,6 +8,7 @@ and various coprocessors.
 Required properties:
   - compatible: Must contain exactly one of the following:
       - "renesas,r8a7743-sysc" (RZ/G1M)
+      - "renesas,r8a7745-sysc" (RZ/G1E)
       - "renesas,r8a7779-sysc" (R-Car H1)
       - "renesas,r8a7790-sysc" (R-Car H2)
       - "renesas,r8a7791-sysc" (R-Car M2-W)
Index: renesas/drivers/soc/renesas/Makefile
===================================================================
--- renesas.orig/drivers/soc/renesas/Makefile
+++ renesas/drivers/soc/renesas/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_ARCH_R8A7795)	+= rcar-rst.o
 obj-$(CONFIG_ARCH_R8A7796)	+= rcar-rst.o
 
 obj-$(CONFIG_ARCH_R8A7743)	+= rcar-sysc.o r8a7743-sysc.o
+obj-$(CONFIG_ARCH_R8A7745)	+= rcar-sysc.o r8a7745-sysc.o
 obj-$(CONFIG_ARCH_R8A7779)	+= rcar-sysc.o r8a7779-sysc.o
 obj-$(CONFIG_ARCH_R8A7790)	+= rcar-sysc.o r8a7790-sysc.o
 obj-$(CONFIG_ARCH_R8A7791)	+= rcar-sysc.o r8a7791-sysc.o
Index: renesas/drivers/soc/renesas/r8a7745-sysc.c
===================================================================
--- /dev/null
+++ renesas/drivers/soc/renesas/r8a7745-sysc.c
@@ -0,0 +1,32 @@
+/*
+ * Renesas RZ/G1E System Controller
+ *
+ * Copyright (C) 2016 Cogent Embedded Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation; of the License.
+ */
+
+#include <linux/bug.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/power/r8a7745-sysc.h>
+
+#include "rcar-sysc.h"
+
+static const struct rcar_sysc_area r8a7745_areas[] __initconst = {
+	{ "always-on",	    0, 0, R8A7745_PD_ALWAYS_ON,	-1, PD_ALWAYS_ON },
+	{ "ca7-scu",	0x100, 0, R8A7745_PD_CA7_SCU,	R8A7745_PD_ALWAYS_ON,
+	  PD_SCU },
+	{ "ca7-cpu0",	0x1c0, 0, R8A7745_PD_CA7_CPU0,	R8A7745_PD_CA7_SCU,
+	  PD_CPU_NOCR },
+	{ "ca7-cpu1",	0x1c0, 1, R8A7745_PD_CA7_CPU1,	R8A7745_PD_CA7_SCU,
+	  PD_CPU_NOCR },
+	{ "sgx",	 0xc0, 0, R8A7745_PD_SGX,	R8A7745_PD_ALWAYS_ON },
+};
+
+const struct rcar_sysc_info r8a7745_sysc_info __initconst = {
+	.areas = r8a7745_areas,
+	.num_areas = ARRAY_SIZE(r8a7745_areas),
+};
Index: renesas/drivers/soc/renesas/rcar-sysc.c
===================================================================
--- renesas.orig/drivers/soc/renesas/rcar-sysc.c
+++ renesas/drivers/soc/renesas/rcar-sysc.c
@@ -278,6 +278,9 @@ static const struct of_device_id rcar_sy
 #ifdef CONFIG_ARCH_R8A7743
 	{ .compatible = "renesas,r8a7743-sysc", .data = &r8a7743_sysc_info },
 #endif
+#ifdef CONFIG_ARCH_R8A7745
+	{ .compatible = "renesas,r8a7745-sysc", .data = &r8a7745_sysc_info },
+#endif
 #ifdef CONFIG_ARCH_R8A7779
 	{ .compatible = "renesas,r8a7779-sysc", .data = &r8a7779_sysc_info },
 #endif
Index: renesas/drivers/soc/renesas/rcar-sysc.h
===================================================================
--- renesas.orig/drivers/soc/renesas/rcar-sysc.h
+++ renesas/drivers/soc/renesas/rcar-sysc.h
@@ -51,6 +51,7 @@ struct rcar_sysc_info {
 };
 
 extern const struct rcar_sysc_info r8a7743_sysc_info;
+extern const struct rcar_sysc_info r8a7745_sysc_info;
 extern const struct rcar_sysc_info r8a7779_sysc_info;
 extern const struct rcar_sysc_info r8a7790_sysc_info;
 extern const struct rcar_sysc_info r8a7791_sysc_info;
