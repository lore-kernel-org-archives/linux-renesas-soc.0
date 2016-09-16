Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33011 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756314AbcIPN34 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 09:29:56 -0400
Received: by mail-lf0-f46.google.com with SMTP id h127so66269178lfh.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2016 06:29:55 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com
Subject: [PATCH RFC 2/8] ARM: shmobile: r8a7743: add power domain index macros
Date: Fri, 16 Sep 2016 16:29:52 +0300
Message-ID: <2361310.TQ5AHhpEmD@wasted.cogentembedded.com>
In-Reply-To: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com>
References: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add macros usable by the device tree sources to reference R8A7743 SYSC power
domains by index.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 include/dt-bindings/power/r8a7743-sysc.h |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

Index: renesas/include/dt-bindings/power/r8a7743-sysc.h
===================================================================
--- /dev/null
+++ renesas/include/dt-bindings/power/r8a7743-sysc.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright (C) 2016 Cogent Embedded Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A7743_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A7743_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A7743_PD_CA15_CPU0		 0
+#define R8A7743_PD_CA15_CPU1		 1
+#define R8A7743_PD_CA15_SCU		12
+#define R8A7743_PD_SGX			20
+
+/* Always-on power area */
+#define R8A7743_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A7743_SYSC_H__ */
