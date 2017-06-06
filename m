Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:44880 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751422AbdFFPXx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2017 11:23:53 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 4/5] ARM: dts: iwg20m: Add iWave RZG1M Qseven SOM
Date: Tue,  6 Jun 2017 16:10:17 +0100
Message-Id: <1496761818-62126-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1496761818-62126-1-git-send-email-biju.das@bp.renesas.com>
References: <1496420523-23506-4-git-send-email-biju.das@bp.renesas.com>
 <1496761818-62126-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for iWave RZG1M Qseven System On Module.
http://www.iwavesystems.com/rz-g1m-qseven-module.html

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
---
 arch/arm/boot/dts/Makefile            |  1 +
 arch/arm/boot/dts/r8a7743-iwg20m.dtsi | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7743-iwg20m.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 3d6e288..8da0897 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -710,6 +710,7 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
 	r7s72100-rskrza1.dtb \
 	r8a73a4-ape6evm.dtb \
 	r8a7740-armadillo800eva.dtb \
+	r8a7743-iwg20d-q7.dtb \
 	r8a7743-sk-rzg1m.dtb \
 	r8a7745-sk-rzg1e.dtb \
 	r8a7778-bockw.dtb \
diff --git a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
new file mode 100644
index 0000000..001ca91
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
@@ -0,0 +1,29 @@
+/*
+ * Device Tree Source for the iWave-RZG1M-20M Qseven SOM
+ *
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+#include "r8a7743.dtsi"
+
+/ {
+	compatible = "iwave,g20m", "renesas,r8a7743";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x20000000>;
+	};
+
+	memory@200000000 {
+		device_type = "memory";
+		reg = <2 0x00000000 0 0x20000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <20000000>;
+};
-- 
1.9.1
