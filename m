Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com
Subject: [PATCH 1/2] arm64: dts: r8a7795: salvator-x: Add GPIO keys support
Date: Mon, 14 Nov 2016 15:07:16 +0200
Message-Id: <1479128837-30985-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1479128837-30985-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479128837-30985-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The Salvator-X board as a 4 lines DIP switch and 3 push buttons
connected to SoC GPIOs, meant to be used as general-purpose test keys.
Add a corresponding node in DT, mapping (semi-randomly) the DIP switch
to keys 1-4 and the push buttons to keys A-C.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index bcaf4008d32d..ef3511cab367 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -34,6 +34,7 @@
 /dts-v1/;
 #include "r8a7795.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Renesas Salvator-X board based on r8a7795";
@@ -56,6 +57,63 @@
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
 
+	keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&keys_pins>;
+		pinctrl-names = "default";
+
+		key-1 {
+			gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_1>;
+			label = "SW4-1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-2 {
+			gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_2>;
+			label = "SW4-2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-3 {
+			gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+			label = "SW4-3";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-4 {
+			gpios = <&gpio5 23 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_4>;
+			label = "SW4-4";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-a {
+			gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_A>;
+			label = "TSW0";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-b {
+			gpios = <&gpio6 12 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_B>;
+			label = "TSW1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-c {
+			gpios = <&gpio6 13 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_C>;
+			label = "TSW2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
 	x12_clk: x12_clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -256,6 +314,11 @@
 		function = "du";
 	};
 
+	keys_pins: keys {
+		pins = "GP_5_17", "GP_5_20", "GP_5_22";
+		bias-pull-up;
+	};
+
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
-- 
Regards,

Laurent Pinchart
