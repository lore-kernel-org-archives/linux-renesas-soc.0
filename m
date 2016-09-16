Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:35722 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932873AbcIPNcC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 09:32:02 -0400
Received: by mail-lf0-f42.google.com with SMTP id l131so61513464lfl.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2016 06:32:02 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org
Cc: magnus.damm@gmail.com
Subject: [PATCH RFC 3/8] soc: renesas: rcar-sysc: add R8A7743 support
Date: Fri, 16 Sep 2016 16:31:59 +0300
Message-ID: <2597193.HJgZ9VmMaF@wasted.cogentembedded.com>
In-Reply-To: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com>
References: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for RZ/G1M (R8A7743) SoC power areas to the SYSC driver.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/soc/renesas/Makefile       |    1 +
 drivers/soc/renesas/r8a7743-sysc.c |   32 ++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rcar-sysc.c    |    3 +++
 drivers/soc/renesas/rcar-sysc.h    |    1 +
 4 files changed, 37 insertions(+)

Index: renesas/drivers/soc/renesas/r8a7743-sysc.c
===================================================================
--- /dev/null
+++ renesas/drivers/soc/renesas/r8a7743-sysc.c
@@ -0,0 +1,32 @@
+/*
+ * Renesas RZ/G1M System Controller
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
+#include <dt-bindings/power/r8a7743-sysc.h>
+
+#include "rcar-sysc.h"
+
+static const struct rcar_sysc_area r8a7743_areas[] __initconst = {
+	{ "always-on",	    0, 0, R8A7743_PD_ALWAYS_ON,	-1, PD_ALWAYS_ON },
+	{ "ca15-scu",	0x180, 0, R8A7743_PD_CA15_SCU,	R8A7743_PD_ALWAYS_ON,
+	  PD_SCU },
+	{ "ca15-cpu0",	 0x40, 0, R8A7743_PD_CA15_CPU0,	R8A7743_PD_CA15_SCU,
+	  PD_CPU_NOCR },
+	{ "ca15-cpu1",	 0x40, 1, R8A7743_PD_CA15_CPU1,	R8A7743_PD_CA15_SCU,
+	  PD_CPU_NOCR },
+	{ "sgx",	 0xc0, 0, R8A7743_PD_SGX,	R8A7743_PD_ALWAYS_ON },
+};
+
+const struct rcar_sysc_info r8a7743_sysc_info __initconst = {
+	.areas = r8a7743_areas,
+	.num_areas = ARRAY_SIZE(r8a7743_areas),
+};
Index: renesas/drivers/soc/renesas/Makefile
===================================================================
--- renesas.orig/drivers/soc/renesas/Makefile
+++ renesas/drivers/soc/renesas/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_ARCH_R8A7743)	+= rcar-sysc.o r8a7743-sysc.o
 obj-$(CONFIG_ARCH_R8A7779)	+= rcar-sysc.o r8a7779-sysc.o
 obj-$(CONFIG_ARCH_R8A7790)	+= rcar-sysc.o r8a7790-sysc.o
 obj-$(CONFIG_ARCH_R8A7791)	+= rcar-sysc.o r8a7791-sysc.o
Index: renesas/drivers/soc/renesas/rcar-sysc.c
===================================================================
--- renesas.orig/drivers/soc/renesas/rcar-sysc.c
+++ renesas/drivers/soc/renesas/rcar-sysc.c
@@ -275,6 +275,9 @@ finalize:
 }
 
 static const struct of_device_id rcar_sysc_matches[] = {
+#ifdef CONFIG_ARCH_R8A7743
+	{ .compatible = "renesas,r8a7743-sysc", .data = &r8a7743_sysc_info },
+#endif
 #ifdef CONFIG_ARCH_R8A7779
 	{ .compatible = "renesas,r8a7779-sysc", .data = &r8a7779_sysc_info },
 #endif
Index: renesas/drivers/soc/renesas/rcar-sysc.h
===================================================================
--- renesas.orig/drivers/soc/renesas/rcar-sysc.h
+++ renesas/drivers/soc/renesas/rcar-sysc.h
@@ -50,6 +50,7 @@ struct rcar_sysc_info {
 	unsigned int num_areas;
 };
 
+extern const struct rcar_sysc_info r8a7743_sysc_info;
 extern const struct rcar_sysc_info r8a7779_sysc_info;
 extern const struct rcar_sysc_info r8a7790_sysc_info;
 extern const struct rcar_sysc_info r8a7791_sysc_info;
