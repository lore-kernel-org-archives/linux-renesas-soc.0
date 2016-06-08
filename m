Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56528 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752998AbcFHBBA (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 21:01:00 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/3] soc: renesas: Add r8a7796 SYSC PM Domain Binding Definitions
Date: Wed,  8 Jun 2016 10:00:12 +0900
Message-Id: <74699228b99d293ec52682eed356f7b39ec644e4.1465347345.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1465347345.git.horms+renesas@verge.net.au>
References: <cover.1465347345.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 include/dt-bindings/power/r8a7796-sysc.h | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a7796-sysc.h

diff --git a/include/dt-bindings/power/r8a7796-sysc.h b/include/dt-bindings/power/r8a7796-sysc.h
new file mode 100644
index 000000000000..5b4daab44daa
--- /dev/null
+++ b/include/dt-bindings/power/r8a7796-sysc.h
@@ -0,0 +1,36 @@
+/*
+ * Copyright (C) 2016 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A7796_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A7796_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A7796_PD_CA57_CPU0		 0
+#define R8A7796_PD_CA57_CPU1		 1
+#define R8A7796_PD_CA53_CPU0		 5
+#define R8A7796_PD_CA53_CPU1		 6
+#define R8A7796_PD_CA53_CPU2		 7
+#define R8A7796_PD_CA53_CPU3		 8
+#define R8A7796_PD_CA57_SCU		12
+#define R8A7796_PD_CR7			13
+#define R8A7796_PD_A3VC			14
+#define R8A7796_PD_3DG_A		17
+#define R8A7796_PD_3DG_B		18
+#define R8A7796_PD_CA53_SCU		21
+#define R8A7796_PD_A3IR			24
+#define R8A7796_PD_A2VC0		25
+#define R8A7796_PD_A2VC1		26
+
+/* Always-on power area */
+#define R8A7796_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A7796_SYSC_H__ */
-- 
2.1.4
