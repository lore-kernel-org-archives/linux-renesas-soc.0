Return-Path: <devicetree-owner@vger.kernel.org>
Subject: [PATCH 03/11] dt-bindings: power: add R8A77980 SYSC power domain
 definitions
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
Message-ID: <5177bec1-422f-688d-ea67-f15951505b1e@cogentembedded.com>
Date: Fri, 2 Feb 2018 21:29:16 +0300
MIME-Version: 1.0
In-Reply-To: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add macros usable by the device tree sources to reference R8A77980 SYSC
power domains by index.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 include/dt-bindings/power/r8a77980-sysc.h |   43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

Index: renesas/include/dt-bindings/power/r8a77980-sysc.h
===================================================================
--- /dev/null
+++ renesas/include/dt-bindings/power/r8a77980-sysc.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018 Cogent Embedded, Inc.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A77980_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A77980_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A77980_PD_A2SC2		0
+#define R8A77980_PD_A2SC3		1
+#define R8A77980_PD_A2SC4		2
+#define R8A77980_PD_A2PD0		3
+#define R8A77980_PD_A2PD1		4
+#define R8A77980_PD_CA53_CPU0		5
+#define R8A77980_PD_CA53_CPU1		6
+#define R8A77980_PD_CA53_CPU2		7
+#define R8A77980_PD_CA53_CPU3		8
+#define R8A77980_PD_A2CN		10
+#define R8A77980_PD_A3VIP		11
+#define R8A77980_PD_A2IR5		12
+#define R8A77980_PD_CR7			13
+#define R8A77980_PD_A2IR4		15
+#define R8A77980_PD_CA53_SCU		21
+#define R8A77980_PD_A2IR0		23
+#define R8A77980_PD_A3IR		24
+#define R8A77980_PD_A3VIP1		25
+#define R8A77980_PD_A3VIP2		26
+#define R8A77980_PD_A2IR1		27
+#define R8A77980_PD_A2IR2		28
+#define R8A77980_PD_A2IR3		29
+#define R8A77980_PD_A2SC0		30
+#define R8A77980_PD_A2SC1		31
+
+/* Always-on power area */
+#define R8A77980_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A77980_SYSC_H__ */
