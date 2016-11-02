Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48964 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754021AbcKBJYS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 05:24:18 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] ARM: shmobile: r8a7743: add power domain index macros
Date: Wed,  2 Nov 2016 10:24:09 +0100
Message-Id: <538321bd97188563d739e28a2f21ad874bd28b2e.1478077617.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1478077617.git.horms+renesas@verge.net.au>
References: <cover.1478077617.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Add macros usable by the device tree sources to reference R8A7743 SYSC power
domains by index.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 include/dt-bindings/power/r8a7743-sysc.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a7743-sysc.h

diff --git a/include/dt-bindings/power/r8a7743-sysc.h b/include/dt-bindings/power/r8a7743-sysc.h
new file mode 100644
index 000000000000..61cfbb2907ea
--- /dev/null
+++ b/include/dt-bindings/power/r8a7743-sysc.h
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
-- 
2.7.0.rc3.207.g0ac5344
