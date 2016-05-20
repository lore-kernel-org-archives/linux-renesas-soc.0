Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:46559 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755370AbcETHKT (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 20 May 2016 03:10:19 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 16/23] ARM: dts: kzm9d: Fix W=1 dtc warnings
Date: Fri, 20 May 2016 09:10:07 +0200
Message-Id: <1463728214-13838-17-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
References: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /pfc@e0140200/serial@e1030000 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /gpio_keys/button@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /gpio_keys/button@2 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /gpio_keys/button@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /gpio_keys/button@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@1 has a unit name, but no reg property

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 arch/arm/boot/dts/emev2-kzm9d.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/emev2-kzm9d.dts b/arch/arm/boot/dts/emev2-kzm9d.dts
index a35b851e1cd7678a..9eb86f8f32c5afc0 100644
--- a/arch/arm/boot/dts/emev2-kzm9d.dts
+++ b/arch/arm/boot/dts/emev2-kzm9d.dts
@@ -18,7 +18,7 @@
 	model = "EMEV2 KZM9D Board";
 	compatible = "renesas,kzm9d", "renesas,emev2";
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x8000000>;
 	};
@@ -33,28 +33,28 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		button@1 {
+		one {
 			debounce_interval = <50>;
 			wakeup-source;
 			label = "DSW2-1";
 			linux,code = <KEY_1>;
 			gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
 		};
-		button@2 {
+		two {
 			debounce_interval = <50>;
 			wakeup-source;
 			label = "DSW2-2";
 			linux,code = <KEY_2>;
 			gpios = <&gpio0 15 GPIO_ACTIVE_HIGH>;
 		};
-		button@3 {
+		three {
 			debounce_interval = <50>;
 			wakeup-source;
 			label = "DSW2-3";
 			linux,code = <KEY_3>;
 			gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
 		};
-		button@4 {
+		four {
 			debounce_interval = <50>;
 			wakeup-source;
 			label = "DSW2-4";
@@ -63,7 +63,7 @@
 		};
 	};
 
-	reg_1p8v: regulator@0 {
+	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -72,7 +72,7 @@
 		regulator-boot-on;
 	};
 
-	reg_3p3v: regulator@1 {
+	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
 		regulator-min-microvolt = <3300000>;
@@ -104,7 +104,7 @@
 };
 
 &pfc {
-	uart1_pins: serial@e1030000 {
+	uart1_pins: uart1 {
 		groups = "uart1_ctrl", "uart1_data";
 		function = "uart1";
 	};
-- 
1.9.1
