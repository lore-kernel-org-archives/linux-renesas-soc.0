Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56528 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752368AbcFHBAm (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 21:00:42 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 25/30] ARM: dts: kzm9d: Fix W=1 dtc warnings
Date: Wed,  8 Jun 2016 09:59:55 +0900
Message-Id: <815be9c2a436855227774f77b4d251292792964b.1465346599.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1465346599.git.horms+renesas@verge.net.au>
References: <cover.1465346599.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /pfc@e0140200/serial@e1030000 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /gpio_keys/button@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /gpio_keys/button@2 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /gpio_keys/button@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /gpio_keys/button@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@1 has a unit name, but no reg property

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/emev2-kzm9d.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/emev2-kzm9d.dts b/arch/arm/boot/dts/emev2-kzm9d.dts
index a35b851e1cd7..9eb86f8f32c5 100644
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
2.1.4
