Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725952AbeLFV6h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:58:37 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 02/34] ARM: dts: r8a7744-iwg20m: Add iWave RZ/G1N Qseven SOM
Date: Thu,  6 Dec 2018 13:57:57 -0800
Message-Id: <3c248aefe73b5586347dae74b0a8d40aea1018b3.1544125558.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544125558.git.horms+renesas@verge.net.au>
References: <cover.1544125558.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Add support for iWave RZ/G1N Qseven System On Module.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7744-iwg20m.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7744-iwg20m.dtsi

diff --git a/arch/arm/boot/dts/r8a7744-iwg20m.dtsi b/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
new file mode 100644
index 000000000000..6166ae053060
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the iWave RZ/G1N Qseven SOM
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+
+#include "r8a7744.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	compatible = "iwave,g20m", "renesas,r8a7744";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x40000000>;
+	};
+
+	reg_3p3v: 3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <20000000>;
+};
-- 
2.11.0
