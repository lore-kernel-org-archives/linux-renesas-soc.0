Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:35994 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932521AbcFLU4y (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 12 Jun 2016 16:56:54 -0400
Received: by mail-lf0-f51.google.com with SMTP id q132so36134547lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Jun 2016 13:56:53 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org
Cc: magnus.damm@gmail.com
Subject: [PATCH v5 03/12] soc: renesas: rcar-sysc: add R8A7792 support
Date: Sun, 12 Jun 2016 23:56:50 +0300
Message-ID: <1897480.o0ohe3SCrB@wasted.cogentembedded.com>
In-Reply-To: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for R-Car V2H (R8A7792) SoC power areas to the SYSC driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 5:
- refreshed the patch.

Changes in version 2:
- added Geert's tag.

 drivers/soc/renesas/Makefile       |    1 +
 drivers/soc/renesas/r8a7792-sysc.c |   34 ++++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rcar-sysc.c    |    3 +++
 drivers/soc/renesas/rcar-sysc.h    |    1 +
 4 files changed, 39 insertions(+)

Index: renesas/drivers/soc/renesas/Makefile
===================================================================
--- renesas.orig/drivers/soc/renesas/Makefile
+++ renesas/drivers/soc/renesas/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_ARCH_R8A7779)	+= rcar-sysc.o r8a7779-sysc.o
 obj-$(CONFIG_ARCH_R8A7790)	+= rcar-sysc.o r8a7790-sysc.o
 obj-$(CONFIG_ARCH_R8A7791)	+= rcar-sysc.o r8a7791-sysc.o
+obj-$(CONFIG_ARCH_R8A7792)	+= rcar-sysc.o r8a7792-sysc.o
 # R-Car M2-N is identical to R-Car M2-W w.r.t. power domains.
 obj-$(CONFIG_ARCH_R8A7793)	+= rcar-sysc.o r8a7791-sysc.o
 obj-$(CONFIG_ARCH_R8A7794)	+= rcar-sysc.o r8a7794-sysc.o
Index: renesas/drivers/soc/renesas/r8a7792-sysc.c
===================================================================
--- /dev/null
+++ renesas/drivers/soc/renesas/r8a7792-sysc.c
@@ -0,0 +1,34 @@
+/*
+ * Renesas R-Car V2H (R8A7792) System Controller
+ *
+ * Copyright (C) 2016 Cogent Embedded Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+
+#include <linux/bug.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/power/r8a7792-sysc.h>
+
+#include "rcar-sysc.h"
+
+static const struct rcar_sysc_area r8a7792_areas[] __initconst = {
+	{ "always-on",	    0, 0, R8A7792_PD_ALWAYS_ON,	-1, PD_ALWAYS_ON },
+	{ "ca15-scu",	0x180, 0, R8A7792_PD_CA15_SCU,	R8A7792_PD_ALWAYS_ON,
+	  PD_SCU },
+	{ "ca15-cpu0",	 0x40, 0, R8A7792_PD_CA15_CPU0,	R8A7792_PD_CA15_SCU,
+	  PD_CPU_NOCR },
+	{ "ca15-cpu1",	 0x40, 1, R8A7792_PD_CA15_CPU1,	R8A7792_PD_CA15_SCU,
+	  PD_CPU_NOCR },
+	{ "sgx",	 0xc0, 0, R8A7792_PD_SGX,	R8A7792_PD_ALWAYS_ON },
+	{ "imp",	0x140, 0, R8A7792_PD_IMP,	R8A7792_PD_ALWAYS_ON },
+};
+
+const struct rcar_sysc_info r8a7792_sysc_info __initconst = {
+	.areas = r8a7792_areas,
+	.num_areas = ARRAY_SIZE(r8a7792_areas),
+};
Index: renesas/drivers/soc/renesas/rcar-sysc.c
===================================================================
--- renesas.orig/drivers/soc/renesas/rcar-sysc.c
+++ renesas/drivers/soc/renesas/rcar-sysc.c
@@ -293,6 +293,9 @@ static const struct of_device_id rcar_sy
 #ifdef CONFIG_ARCH_R8A7791
 	{ .compatible = "renesas,r8a7791-sysc", .data = &r8a7791_sysc_info },
 #endif
+#ifdef CONFIG_ARCH_R8A7792
+	{ .compatible = "renesas,r8a7792-sysc", .data = &r8a7792_sysc_info },
+#endif
 #ifdef CONFIG_ARCH_R8A7793
 	/* R-Car M2-N is identical to R-Car M2-W w.r.t. power domains. */
 	{ .compatible = "renesas,r8a7793-sysc", .data = &r8a7791_sysc_info },
Index: renesas/drivers/soc/renesas/rcar-sysc.h
===================================================================
--- renesas.orig/drivers/soc/renesas/rcar-sysc.h
+++ renesas/drivers/soc/renesas/rcar-sysc.h
@@ -53,6 +53,7 @@ struct rcar_sysc_info {
 extern const struct rcar_sysc_info r8a7779_sysc_info;
 extern const struct rcar_sysc_info r8a7790_sysc_info;
 extern const struct rcar_sysc_info r8a7791_sysc_info;
+extern const struct rcar_sysc_info r8a7792_sysc_info;
 extern const struct rcar_sysc_info r8a7794_sysc_info;
 extern const struct rcar_sysc_info r8a7795_sysc_info;
 extern const struct rcar_sysc_info r8a7796_sysc_info;
