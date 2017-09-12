Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:35711 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751430AbdILVFT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 17:05:19 -0400
Received: by mail-lf0-f41.google.com with SMTP id d17so29519164lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Sep 2017 14:05:18 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170912210514.517628239@cogentembedded.com>
Date: Tue, 12 Sep 2017 23:37:19 +0300
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/11] dt-bindings: power: add R8A77970 SYSC power domain definitions
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=dt-bindings-power-add-R8A77970-SYSC-power-domain-definitions.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add macros usable by the device tree sources to reference R8A77970 SYSC
power domains by index.

Based on the original (and large) patch by Daisuke Matsushita
<daisuke.matsushita.ns@hitachi.com>.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 include/dt-bindings/power/r8a77970-sysc.h |   32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

Index: renesas/include/dt-bindings/power/r8a77970-sysc.h
===================================================================
--- /dev/null
+++ renesas/include/dt-bindings/power/r8a77970-sysc.h
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
