Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 1/6] ARM: dts: r8a7779: Add SYSC PM domains
Date: Wed,  9 Mar 2016 20:18:50 +0100
Message-Id: <1457551135-22078-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1457551135-22078-1-git-send-email-geert+renesas@glider.be>
References: <1457551135-22078-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a device node for the System Controller.
Hook up ARM CPU cores 1-3 to their respective PM domains.
Note that ARM CPU core 0 cannot be shut off.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Drop power area hiearchy from DT,
  - Switch to "#power-domain-cells = <1>",

v2:
  - Correct sysc "reg" property (#address/size-cells = 1, not 2),
  - Change one-line summary prefix to match current arm-soc practices,
  - Update compatible values.
---
 arch/arm/boot/dts/r8a7779.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index a0cc08e6295b0396..540f3c57a7b32356 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/clock/r8a7779-clock.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/power/r8a7779-sysc.h>
 
 / {
 	compatible = "renesas,r8a7779";
@@ -34,18 +35,21 @@
 			compatible = "arm,cortex-a9";
 			reg = <1>;
 			clock-frequency = <1000000000>;
+			power-domains = <&sysc R8A7779_PD_ARM1>;
 		};
 		cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <2>;
 			clock-frequency = <1000000000>;
+			power-domains = <&sysc R8A7779_PD_ARM2>;
 		};
 		cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <3>;
 			clock-frequency = <1000000000>;
+			power-domains = <&sysc R8A7779_PD_ARM3>;
 		};
 	};
 
@@ -591,4 +595,10 @@
 				"mmc1", "mmc0";
 		};
 	};
+
+	sysc: system-controller@ffd85000 {
+		compatible = "renesas,r8a7779-sysc";
+		reg = <0xffd85000 0x0200>;
+		#power-domain-cells = <1>;
+	};
 };
-- 
1.9.1

