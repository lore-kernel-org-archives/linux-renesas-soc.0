Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36375 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752082AbcF3NPx (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 09:15:53 -0400
Received: by mail-wm0-f67.google.com with SMTP id c82so22816285wme.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jun 2016 06:15:53 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: geert@glider.be, wsa@the-dreams.de,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [TEST] Lager SD-via-MSIOF test setup
Date: Thu, 30 Jun 2016 15:15:40 +0200
Message-Id: <1467292540-14198-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

---
Hi!

This is a setup I have cooked up to check if talking to SD cards via MSIOF1
and SPI works.  It works by taking the SD2 lines off the bus by defining
them as GPIO inputs and jumpering the MSIOF pins to SD card slot 2 via EXIO
connectors like so:

EXIO_A pin         EXIO_B pin
19 (MSIOF1_SCK_3)   3 (SD2_CLK_3)
31 (MSIOF1_TXD_3)   5 (SD2_CMD_3)
33 (MSIOF1_RXD_3)  13 (SD2_DAT0_3)

(Credits for the idea go to Mr. Damm.)

It works when defining an spi-gpio device, but it does not work with the
MSIOF IP; any attempt to read from the SD card returns all zeros.

Does anybody see any obvious issue there? Did I forget anything in the
msiof1 node?

CU
Uli


 arch/arm/boot/dts/r8a7790-lager.dts | 82 +++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 15cef62..979853d 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -270,6 +270,29 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
+
+#if 0
+	spi_gpio: spi-gpio {
+		pinctrl-0 = <&msiof1_pins>;
+		pinctrl-names = "default";
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-sck = <&gpio4 8 GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
+		status = "okay";
+
+		spi@0 {
+			compatible = "mmc-spi-slot";
+			reg = <0>;
+			voltage-ranges = <3200 3400>;
+			spi-max-frequency = <25000000>;
+		};
+	};
+#endif
 };
 
 &du {
@@ -535,12 +558,24 @@
 	status = "okay";
 };
 
+#if 1
 &msiof1 {
 	pinctrl-0 = <&msiof1_pins>;
 	pinctrl-names = "default";
 
 	status = "okay";
 
+	num-chipselects = <1>;
+	cs-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;	/* SD2_DAT3 */
+
+	spi@0 {
+		compatible = "mmc-spi-slot";
+		reg = <0>;
+		voltage-ranges = <3200 3400>;
+		spi-max-frequency = <25000000>;
+	};
+
+#if 0
 	pmic: pmic@0 {
 		compatible = "renesas,r2a11302ft";
 		reg = <0>;
@@ -548,6 +583,51 @@
 		spi-cpol;
 		spi-cpha;
 	};
+#endif
+};
+#endif
+
+
+/* disable patched lines on SDHI side */
+&gpio3 {
+	sd2_clk {
+		gpio-hog;
+		gpios = <16 0>;	/* SD2_CLK */
+		input;
+	};
+	sd2_cmd {
+		gpio-hog;
+		gpios = <17 0>;	/* SD2_CMD */
+		input;
+	};
+	sd2_dat0 {
+		gpio-hog;
+		gpios = <18 0>;	/* SD2_DAT0 */
+		input;
+	};
+};
+
+/* force PMIC CS off */
+&gpio4 {
+	pmic_cs {
+		gpio-hog;
+		gpios = <9 0>;
+		output-high;
+	};
+};
+
+/* force SD2 power on, 3.3V */
+&gpio5 {
+	sd_pwr {
+		gpio-hog;
+		gpios = <25 0>;
+		output-high;
+	};
+	sd_vccq {
+		gpio-hog;
+		gpios = <30 0>;
+		output-high;
+	};
 };
 
 &sdhi0 {
@@ -563,6 +643,7 @@
 	status = "okay";
 };
 
+#if 0
 &sdhi2 {
 	pinctrl-0 = <&sdhi2_pins>;
 	pinctrl-1 = <&sdhi2_pins_uhs>;
@@ -574,6 +655,7 @@
 	sd-uhs-sdr50;
 	status = "okay";
 };
+#endif
 
 &cpu0 {
 	cpu0-supply = <&vdd_dvfs>;
-- 
2.7.4
