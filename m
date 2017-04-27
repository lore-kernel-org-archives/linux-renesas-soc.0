Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: linus.walleij@linaro.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com,
        robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/10] arm: dts: genmai: Add SCIF2 pin group
Date: Thu, 27 Apr 2017 10:19:51 +0200
Message-Id: <1493281194-5200-8-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add pin configuration subnode for SCIF2 serial debug interface.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 118a8e2..c28d74b 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "r7s72100.dtsi"
+#include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
 
 / {
 	model = "Genmai";
@@ -36,6 +37,14 @@
 	};
 };
 
+&pinctrl {
+
+	scif2_pins: serial2 {
+		/* P3_0 as TxD2; P3_2 as RxD2 */
+		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <13330000>;
 };
@@ -60,6 +69,9 @@
 };
 
 &scif2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif2_pins>;
+
 	status = "okay";
 };
 
-- 
2.7.4
