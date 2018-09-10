Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:12555 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728127AbeIJTgJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 15:36:09 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/3] soc: renesas: rcar-sysc: Add r8a774c0 support
Date: Mon, 10 Sep 2018 15:41:27 +0100
Message-Id: <1536590488-23270-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1536590488-23270-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1536590488-23270-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for the RZ/G2E (R8A774C0) SoC power areas to the
R-Car SYSC driver.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig         |  5 +++
 drivers/soc/renesas/Makefile        |  1 +
 drivers/soc/renesas/r8a774c0-sysc.c | 68 +++++++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rcar-sysc.c     |  3 ++
 drivers/soc/renesas/rcar-sysc.h     |  1 +
 5 files changed, 78 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a774c0-sysc.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 00d4c9d..163e666 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -10,6 +10,7 @@ config SOC_RENESAS
 	select SYSC_R8A7745 if ARCH_R8A7745
 	select SYSC_R8A77470 if ARCH_R8A77470
 	select SYSC_R8A774A1 if ARCH_R8A774A1
+	select SYSC_R8A774C0 if ARCH_R8A774C0
 	select SYSC_R8A7779 if ARCH_R8A7779
 	select SYSC_R8A7790 if ARCH_R8A7790
 	select SYSC_R8A7791 if ARCH_R8A7791 || ARCH_R8A7793
@@ -42,6 +43,10 @@ config SYSC_R8A774A1
 	bool "RZ/G2M System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
 
+config SYSC_R8A774C0
+	bool "RZ/G2E System Controller support" if COMPILE_TEST
+	select SYSC_RCAR
+
 config SYSC_R8A7779
 	bool "R-Car H1 System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 6adb9d6..3bdd7db 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_SYSC_R8A7743)	+= r8a7743-sysc.o
 obj-$(CONFIG_SYSC_R8A7745)	+= r8a7745-sysc.o
 obj-$(CONFIG_SYSC_R8A77470)	+= r8a77470-sysc.o
 obj-$(CONFIG_SYSC_R8A774A1)	+= r8a774a1-sysc.o
+obj-$(CONFIG_SYSC_R8A774C0)	+= r8a774c0-sysc.o
 obj-$(CONFIG_SYSC_R8A7779)	+= r8a7779-sysc.o
 obj-$(CONFIG_SYSC_R8A7790)	+= r8a7790-sysc.o
 obj-$(CONFIG_SYSC_R8A7791)	+= r8a7791-sysc.o
diff --git a/drivers/soc/renesas/r8a774c0-sysc.c b/drivers/soc/renesas/r8a774c0-sysc.c
new file mode 100644
index 0000000..e1ac4c0
--- /dev/null
+++ b/drivers/soc/renesas/r8a774c0-sysc.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2E System Controller
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ *
+ * Based on Renesas R-Car E3 System Controller
+ */
+
+#include <linux/bug.h>
+#include <linux/kernel.h>
+#include <linux/sys_soc.h>
+
+#include <dt-bindings/power/r8a774c0-sysc.h>
+
+#include "rcar-sysc.h"
+
+static struct rcar_sysc_area r8a774c0_areas[] __initdata = {
+	{ "always-on",	    0, 0, R8A774C0_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
+	{ "ca53-scu",	0x140, 0, R8A774C0_PD_CA53_SCU,  R8A774C0_PD_ALWAYS_ON,
+	  PD_SCU },
+	{ "ca53-cpu0",	0x200, 0, R8A774C0_PD_CA53_CPU0, R8A774C0_PD_CA53_SCU,
+	  PD_CPU_NOCR },
+	{ "ca53-cpu1",	0x200, 1, R8A774C0_PD_CA53_CPU1, R8A774C0_PD_CA53_SCU,
+	  PD_CPU_NOCR },
+	{ "a3vc",	0x380, 0, R8A774C0_PD_A3VC,	R8A774C0_PD_ALWAYS_ON },
+	{ "a2vc1",	0x3c0, 1, R8A774C0_PD_A2VC1,	R8A774C0_PD_A3VC },
+	{ "3dg-a",	0x100, 0, R8A774C0_PD_3DG_A,	R8A774C0_PD_ALWAYS_ON },
+	{ "3dg-b",	0x100, 1, R8A774C0_PD_3DG_B,	R8A774C0_PD_3DG_A },
+};
+
+static void __init rcar_sysc_fix_parent(struct rcar_sysc_area *areas,
+					unsigned int num_areas, u8 id,
+					int new_parent)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_areas; i++)
+		if (areas[i].isr_bit == id) {
+			areas[i].parent = new_parent;
+			return;
+		}
+}
+
+/* Fixups for RZ/G2E ES1.0 revision */
+static const struct soc_device_attribute r8a774c0[] __initconst = {
+	{ .soc_id = "r8a774c0", .revision = "ES1.0" },
+	{ /* sentinel */ }
+};
+
+static int __init r8a774c0_sysc_init(void)
+{
+	if (soc_device_match(r8a774c0)) {
+		rcar_sysc_fix_parent(r8a774c0_areas,
+				     ARRAY_SIZE(r8a774c0_areas),
+				     R8A774C0_PD_3DG_A, R8A774C0_PD_3DG_B);
+		rcar_sysc_fix_parent(r8a774c0_areas,
+				     ARRAY_SIZE(r8a774c0_areas),
+				     R8A774C0_PD_3DG_B, R8A774C0_PD_ALWAYS_ON);
+	}
+
+	return 0;
+}
+
+const struct rcar_sysc_info r8a774c0_sysc_info __initconst = {
+	.init = r8a774c0_sysc_init,
+	.areas = r8a774c0_areas,
+	.num_areas = ARRAY_SIZE(r8a774c0_areas),
+};
diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index fe32f7a..e63d7a2 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -278,6 +278,9 @@ static const struct of_device_id rcar_sysc_matches[] __initconst = {
 #ifdef CONFIG_SYSC_R8A774A1
 	{ .compatible = "renesas,r8a774a1-sysc", .data = &r8a774a1_sysc_info },
 #endif
+#ifdef CONFIG_SYSC_R8A774C0
+	{ .compatible = "renesas,r8a774c0-sysc", .data = &r8a774c0_sysc_info },
+#endif
 #ifdef CONFIG_SYSC_R8A7779
 	{ .compatible = "renesas,r8a7779-sysc", .data = &r8a7779_sysc_info },
 #endif
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index 33defe6..dc71f49 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -53,6 +53,7 @@ extern const struct rcar_sysc_info r8a7743_sysc_info;
 extern const struct rcar_sysc_info r8a7745_sysc_info;
 extern const struct rcar_sysc_info r8a77470_sysc_info;
 extern const struct rcar_sysc_info r8a774a1_sysc_info;
+extern const struct rcar_sysc_info r8a774c0_sysc_info;
 extern const struct rcar_sysc_info r8a7779_sysc_info;
 extern const struct rcar_sysc_info r8a7790_sysc_info;
 extern const struct rcar_sysc_info r8a7791_sysc_info;
-- 
2.7.4
