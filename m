Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54614 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753663AbdFPNap (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 09:30:45 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 05/11] arm64: dts: r8a7795: h3ulcb: Add support for R-Car H3 ES2.0
Date: Fri, 16 Jun 2017 15:30:13 +0200
Message-Id: <fb5202dbebfd8fbfc68c67cbed7d4e86f43f6f86.1497617276.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1497617276.git.horms+renesas@verge.net.au>
References: <cover.1497617276.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Split off support for H3ULCB boards with the ES1.x revision of the R-Car
H3 SoC into a separate file.  The main r8a7795-h3ulcb.dts file now
corresponds to H3ULCB with R-Car H3 ES2.0 or later.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/Makefile               |  2 +-
 arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts | 42 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     |  4 +--
 3 files changed, 45 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index b6c723d8f687..d5451015950e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,5 +1,5 @@
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
-dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb r8a7795-es1-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
 
 always		:= $(dtb-y)
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
new file mode 100644
index 000000000000..95fe207cb6a3
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
@@ -0,0 +1,42 @@
+/*
+ * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board
+ *
+ * Copyright (C) 2016 Renesas Electronics Corp.
+ * Copyright (C) 2016 Cogent Embedded, Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+#define CPG_AUDIO_CLK_I		R8A7795_CLK_S0D4
+
+/dts-v1/;
+#include "r8a7795-es1.dtsi"
+#include "ulcb.dtsi"
+
+/ {
+	model = "Renesas H3ULCB board based on r8a7795 ES1.x";
+	compatible = "renesas,h3ulcb", "renesas,r8a7795";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+	};
+
+	memory@500000000 {
+		device_type = "memory";
+		reg = <0x5 0x00000000 0x0 0x40000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x40000000>;
+	};
+
+	memory@700000000 {
+		device_type = "memory";
+		reg = <0x7 0x00000000 0x0 0x40000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index 95fe207cb6a3..0426f41765f0 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -12,11 +12,11 @@
 #define CPG_AUDIO_CLK_I		R8A7795_CLK_S0D4
 
 /dts-v1/;
-#include "r8a7795-es1.dtsi"
+#include "r8a7795.dtsi"
 #include "ulcb.dtsi"
 
 / {
-	model = "Renesas H3ULCB board based on r8a7795 ES1.x";
+	model = "Renesas H3ULCB board based on r8a7795 ES2.0+";
 	compatible = "renesas,h3ulcb", "renesas,r8a7795";
 
 	memory@48000000 {
-- 
2.1.4
