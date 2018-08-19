Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:55586 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbeHSW4n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 19 Aug 2018 18:56:43 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F025CD
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Aug 2018 21:44:05 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: salvator-common: Add GPIO keys support
Date: Sun, 19 Aug 2018 22:44:55 +0300
Message-Id: <20180819194455.25096-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Salvator-X and XS boards have a 4 lines DIP switch and 3 push
buttons connected to SoC GPIOs, meant to be used as general-purpose test
keys. Add a corresponding node in DT, mapping (semi-randomly) the DIP
switch to keys 1-4 and the push buttons to keys A-C.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 63 ++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 7d3d866a0063..77d626baa9f3 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -29,6 +29,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	aliases {
@@ -86,6 +87,63 @@
 		};
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
 	reg_1p8v: regulator0 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
@@ -567,6 +625,11 @@
 		function = "intc_ex";
 	};
 
+	keys_pins: keys {
+		pins = "GP_5_17", "GP_5_20", "GP_5_22";
+		bias-pull-up;
+	};
+
 	pwm1_pins: pwm1 {
 		groups = "pwm1_a";
 		function = "pwm1";
-- 
Regards,

Laurent Pinchart
