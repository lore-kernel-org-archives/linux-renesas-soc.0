Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo1.mail-out.ovh.net ([178.32.228.1]:52081 "EHLO
        mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750703AbcLMMxX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2016 07:53:23 -0500
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
        by mo1.mail-out.ovh.net (Postfix) with ESMTP id B9D9C27B73
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2016 13:43:54 +0100 (CET)
From: Jacopo Mondi <jacopo@jmondi.org>
To: wsa+renesas@sang-engineering.com, magnus.damm@gmail.com,
        geert@linux-m68k.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFCv2] dts: arm: renesas: koelsh: Add MAX11100 device
Date: Tue, 13 Dec 2016 13:43:46 +0100
Message-Id: <1481633026-19333-1-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1481042071-18659-1-git-send-email-jacopo@jmondi.org>
References: <1481042071-18659-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add node to test MAX11100 ADC with LED28 connected to the chip input
line.
The ADC sits on a gpio-spi master.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---

Sending as RFC only, not for inclusion.
Used to test MAX11100 ADC driver currently connected to Koelsch GPIO
expander.

v1 -> v2:
    - add fixed regulator to supply vref to max11100 ADC

---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 5405d33..1756b86 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -170,6 +170,38 @@
 			gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
 			label = "LED8";
 		};
+		led28 {
+			gpios = <&gpio5 28 GPIO_ACTIVE_HIGH>;
+			label = "LED28";
+		};
+	};
+
+	vref_adc0: regulator-vref-adc0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "ADC0 Vref";
+		regulator-min-microvolt = <4096000>;
+		regulator-max-microvolt = <4096000>;
+
+		regulator-always-on;
+	};
+
+	spi_gpio: spi-gpio@0 {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-sck = <&gpio5 27 GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio5 25 GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio5 26 GPIO_ACTIVE_LOW>;
+		status = "okay";
+
+		adc0: max11100@0 {
+			compatible = "maxim,max11100";
+			reg = <0>;
+			spi-max-frequency = <2500000>;
+			vref-supply = <&vref_adc0>;
+		};
 	};
 
 	vcc_sdhi0: regulator-vcc-sdhi0 {
-- 
2.7.4
