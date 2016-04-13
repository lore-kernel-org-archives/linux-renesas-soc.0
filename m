Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Kevin Hilman <khilman@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 3/7] soc: renesas: Add r8a7790 SYSC PM Domain Binding Definitions
Date: Wed, 13 Apr 2016 16:44:19 +0200
Message-Id: <1460558663-10197-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1460558663-10197-1-git-send-email-geert+renesas@glider.be>
References: <1460558663-10197-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v5:
  - No changes,

v4:
  - Add Reviewed-by,
  - Rename R8A7790_PD_SH to R8A7790_PD_SH_4A,
  - Add always-on power area,

v3:
  - New.
---
 include/dt-bindings/power/r8a7790-sysc.h | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a7790-sysc.h

diff --git a/include/dt-bindings/power/r8a7790-sysc.h b/include/dt-bindings/power/r8a7790-sysc.h
new file mode 100644
index 0000000000000000..6af4e9929bd04ba4
--- /dev/null
+++ b/include/dt-bindings/power/r8a7790-sysc.h
@@ -0,0 +1,34 @@
+/*
+ * Copyright (C) 2016 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A7790_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A7790_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A7790_PD_CA15_CPU0		 0
+#define R8A7790_PD_CA15_CPU1		 1
+#define R8A7790_PD_CA15_CPU2		 2
+#define R8A7790_PD_CA15_CPU3		 3
+#define R8A7790_PD_CA7_CPU0		 5
+#define R8A7790_PD_CA7_CPU1		 6
+#define R8A7790_PD_CA7_CPU2		 7
+#define R8A7790_PD_CA7_CPU3		 8
+#define R8A7790_PD_CA15_SCU		12
+#define R8A7790_PD_SH_4A		16
+#define R8A7790_PD_RGX			20
+#define R8A7790_PD_CA7_SCU		21
+#define R8A7790_PD_IMP			24
+
+/* Always-on power area */
+#define R8A7790_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A7790_SYSC_H__ */
-- 
1.9.1

