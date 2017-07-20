Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:57598 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934345AbdGTMe7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jul 2017 08:34:59 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/4] soc: renesas: Add r8a77995 SYSC PM Domain Binding Definitions
Date: Thu, 20 Jul 2017 14:34:52 +0200
Message-Id: <1500554094-22198-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1500554094-22198-1-git-send-email-geert+renesas@glider.be>
References: <1500554094-22198-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add power domain indices for R-Car D3.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org
---
 include/dt-bindings/power/r8a77995-sysc.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a77995-sysc.h

diff --git a/include/dt-bindings/power/r8a77995-sysc.h b/include/dt-bindings/power/r8a77995-sysc.h
new file mode 100644
index 0000000000000000..09d0ed575b738aea
--- /dev/null
+++ b/include/dt-bindings/power/r8a77995-sysc.h
@@ -0,0 +1,23 @@
+/*
+ * Copyright (C) 2017 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A77995_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A77995_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A77995_PD_CA53_CPU0		 5
+#define R8A77995_PD_CA53_SCU		21
+
+/* Always-on power area */
+#define R8A77995_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A77995_SYSC_H__ */
-- 
2.7.4
