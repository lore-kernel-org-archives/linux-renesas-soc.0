Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34495 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752318AbdI2LyD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:54:03 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 5/8] dt-bindings: power: add R8A77970 SYSC power domain definitions
Date: Fri, 29 Sep 2017 13:52:52 +0200
Message-Id: <833bdb47c826a1a64daac194c98887d1d68f2ce8.1506676368.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506676368.git.horms+renesas@verge.net.au>
References: <cover.1506676368.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Add macros usable by the device tree sources to reference R8A77970 SYSC
power domains by index.

Based on the original (and large) patch by Daisuke Matsushita
<daisuke.matsushita.ns@hitachi.com>.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 include/dt-bindings/power/r8a77970-sysc.h | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a77970-sysc.h

diff --git a/include/dt-bindings/power/r8a77970-sysc.h b/include/dt-bindings/power/r8a77970-sysc.h
new file mode 100644
index 000000000000..bf54779d1625
--- /dev/null
+++ b/include/dt-bindings/power/r8a77970-sysc.h
@@ -0,0 +1,32 @@
+/*
+ * Copyright (C) 2017 Cogent Embedded Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A77970_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A77970_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A77970_PD_CA53_CPU0		 5
+#define R8A77970_PD_CA53_CPU1		 6
+#define R8A77970_PD_CR7			13
+#define R8A77970_PD_CA53_SCU		21
+#define R8A77970_PD_A2IR0		23
+#define R8A77970_PD_A3IR			24
+#define R8A77970_PD_A2IR1		27
+#define R8A77970_PD_A2IR2		28
+#define R8A77970_PD_A2IR3		29
+#define R8A77970_PD_A2SC0		30
+#define R8A77970_PD_A2SC1		31
+
+/* Always-on power area */
+#define R8A77970_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A77970_SYSC_H__ */
-- 
2.1.4
