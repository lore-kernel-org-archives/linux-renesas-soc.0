Return-Path: <devicetree-owner@vger.kernel.org>
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v3 02/12] arm64: dts: h3ulcb: initial device tree
Date: Wed, 31 Aug 2016 13:02:39 +0300
Message-Id: <1472637759-14663-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the initial device tree for the R8A7795 SoC based H3ULCB low cost
board.

This commit supports the following peripherals:
- SCIF (console)

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 2:
- removed bootargs property
- removed comment related to amixer
---
Changes in version 3:
- split the big patch v2 in small ones

 arch/arm64/boot/dts/renesas/Makefile           |  2 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 51 ++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 17139f7..eb72830 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,4 +1,4 @@
-dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb
 
 always		:= $(dtb-y)
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
new file mode 100644
index 0000000..ecb9e11
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -0,0 +1,51 @@
+/*
+ * Device Tree Source for the H3ULCB board
+ *
+ * Copyright (C) 2016 Renesas Electronics Corp.
+ * Copyright (C) 2016 Cogent Embedded, Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "r8a7795.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Renesas H3ULCB board based on r8a7795";
+	compatible = "renesas,h3ulcb", "renesas,r8a7795";
+
+	aliases {
+		serial0 = &scif2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <16666666>;
+};
+
+&pfc {
+	scif2_pins: scif2 {
+		groups = "scif2_data_a";
+		function = "scif2";
+	};
+};
+
+&scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
1.9.1

