Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:56838 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932671AbdKPJYT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 04:24:19 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, geert@glider.be
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC] arm: dts: gr-peach: Add audiocamerashield DTSi
Date: Thu, 16 Nov 2017 10:23:25 +0100
Message-Id: <1510824205-17533-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add device tree header for GR-Peach's audiocamerashield with OV7670
image sensor.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---

Hello,
   this patch adds device tree header file for GR-Peach's audiocamerashield.

More details on the shield can be found at [1].

Sending as RFC and to a limited audience for the following reason:
- the shield comes with a camera module whose sensor is not supported by
  mainline Linux. I used another module which is 'almost' pin-compatible with
  the shield, but it's not intended to be used on Peach (it's a general purpose
  arduino-compatible OV7670 camera module [2])

  Give the setup is not standard (ie. the camera module does not come with the
  shield) I'm not sure this patch can be included or not. Maybe just the CEU
  part and the associated pin-muxing?

Thanks
   j

[1] https://elinux.org/RZ-A/Boards/GR-PEACH-audiocamerashield
[2] http://www.elecfreaks.com/store/ov7670-camera-module-p-705.html
---

 arch/arm/boot/dts/gr-peach-audiocamerashield.dtsi | 81 +++++++++++++++++++++++
 arch/arm/boot/dts/r7s72100-gr-peach.dts           |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 arch/arm/boot/dts/gr-peach-audiocamerashield.dtsi

diff --git a/arch/arm/boot/dts/gr-peach-audiocamerashield.dtsi b/arch/arm/boot/dts/gr-peach-audiocamerashield.dtsi
new file mode 100644
index 0000000..7d4b3cb
--- /dev/null
+++ b/arch/arm/boot/dts/gr-peach-audiocamerashield.dtsi
@@ -0,0 +1,81 @@
+#include "r7s72100.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
+
+&pinctrl {
+	i2c1_pins: i2c1 {
+		/* P1_2 as SCL; P1_3 as SDA */
+		pinmux = <RZA1_PINMUX(1, 2, 1)>, <RZA1_PINMUX(1, 3, 1)>;
+	};
+
+	vio_pins: vio {
+		/* CEU pins: VIO_D[0-10], VIO_VD, VIO_HD, VIO_CLK */
+		pinmux = <RZA1_PINMUX(1, 0, 5)>, /* VIO_VD */
+			 <RZA1_PINMUX(1, 1, 5)>, /* VIO_HD */
+			 <RZA1_PINMUX(2, 0, 7)>, /* VIO_D0 */
+			 <RZA1_PINMUX(2, 1, 7)>, /* VIO_D1 */
+			 <RZA1_PINMUX(2, 2, 7)>, /* VIO_D2 */
+			 <RZA1_PINMUX(2, 3, 7)>, /* VIO_D3 */
+			 <RZA1_PINMUX(2, 4, 7)>, /* VIO_D4 */
+			 <RZA1_PINMUX(2, 5, 7)>, /* VIO_D5 */
+			 <RZA1_PINMUX(2, 6, 7)>, /* VIO_D6 */
+			 <RZA1_PINMUX(2, 7, 7)>, /* VIO_D7 */
+			 <RZA1_PINMUX(10, 0, 6)>; /* VIO_CLK */
+	};
+};
+
+&ceu {
+	pinctrl-names = "default";
+	pinctrl-0 = <&vio_pins>;
+
+	status = "okay";
+
+	port {
+		ceu_in: endpoint {
+			remote-endpoint = <&ov7670_out>;
+
+			bus-width = <8>;
+			hsync-active = <1>;
+			vsync-active = <1>;
+			pclk-sample = <1>;
+			data-active = <1>;
+		};
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+
+	status = "okay";
+	clock-frequency = <100000>;
+
+	ov7670: camera@21 {
+		compatible = "ovti,ov7670";
+		reg = <0x21>;
+
+		reset-gpios = <&port3 11 GPIO_ACTIVE_LOW>; /* DRV_IN */
+		powerdown-gpios = <&port3 12 GPIO_ACTIVE_HIGH>; /* STDBY */
+
+		clocks = <&xclk>;
+		clock-names = "xclk";
+
+		xclk: fixed_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <24000000>;
+		};
+
+		port {
+			ov7670_out: endpoint {
+				remote-endpoint = <&ceu_in>;
+
+				bus-width = <8>;
+				hsync-active = <1>;
+				vsync-active = <1>;
+				pclk-sample = <1>;
+				data-active = <1>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
index 9e9e890..984706c 100644
--- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
@@ -11,6 +11,7 @@

 /dts-v1/;
 #include "r7s72100.dtsi"
+#include "gr-peach-audiocamerashield.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/r7s72100-pinctrl.h>

--
2.7.4
