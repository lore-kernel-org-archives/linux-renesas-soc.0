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
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 5/7] soc: renesas: Add r8a7793 SYSC PM Domain Binding Definitions
Date: Thu,  7 Apr 2016 14:20:18 +0200
Message-Id: <1460031620-13240-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1460031620-13240-1-git-send-email-geert+renesas@glider.be>
References: <1460031620-13240-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car M2-N is identical to R-Car M2-W w.r.t. power domains, so reuse the
definitions from the latter.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Rename R8A7793_PD_SH to R8A7793_PD_SH_4A,
  - Use the numbers directly, to make the header file self-contained,
  - Add always-on power area,

v3:
  - New.
---
 include/dt-bindings/power/r8a7793-sysc.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a7793-sysc.h

diff --git a/include/dt-bindings/power/r8a7793-sysc.h b/include/dt-bindings/power/r8a7793-sysc.h
new file mode 100644
index 0000000000000000..b5693df3d830ed42
--- /dev/null
+++ b/include/dt-bindings/power/r8a7793-sysc.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright (C) 2016 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A7793_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A7793_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ *
+ * Note that R-Car M2-N is identical to R-Car M2-W w.r.t. power domains.
+ */
+
+#define R8A7793_PD_CA15_CPU0		 0
+#define R8A7793_PD_CA15_CPU1		 1
+#define R8A7793_PD_CA15_SCU		12
+#define R8A7793_PD_SH_4A		16
+#define R8A7793_PD_SGX			20
+
+/* Always-on power area */
+#define R8A7793_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A7793_SYSC_H__ */
-- 
1.9.1

