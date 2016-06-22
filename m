Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57320 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751523AbcFVDto (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 23:49:44 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3 05/13] ARM: dts: koelsch: use demuxer for I2C1
Date: Wed, 22 Jun 2016 12:43:43 +0900
Message-Id: <1466567031-20381-6-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1466567031-20381-1-git-send-email-horms+renesas@verge.net.au>
References: <1466567031-20381-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Make it possible to fallback to GPIO for I2C1 on the EXIO-C connector.

This is based on reference work for the I2C0 core of the lager/r8a7790
by Wolfram Sang.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v3
* New Patch
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index f8a7d090fd01..744a6e2be2d2 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -50,6 +50,8 @@
 	aliases {
 		serial0 = &scif0;
 		serial1 = &scif1;
+		i2c9 = "gpioi2c1";
+		i2c12 = "i2cexio1";
 	};
 
 	chosen {
@@ -287,6 +289,29 @@
 		#clock-cells = <0>;
 		clock-frequency = <148500000>;
 	};
+
+	gpioi2c1: i2c-9 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "i2c-gpio";
+		status = "disabled";
+		gpios = <&gpio7 16 GPIO_ACTIVE_HIGH /* sda */
+			 &gpio7 15 GPIO_ACTIVE_HIGH /* scl */
+			>;
+		i2c-gpio,delay-us = <5>;
+	};
+
+	/*
+	 * I2C1 is routed to EXIO connector B, pins 64 (SCL) + 66 (SDA).
+	 * A fallback to GPIO is provided.
+	 */
+	i2cexio1: i2c-12 {
+		compatible = "i2c-demux-pinctrl";
+		i2c-parent = <&i2c1>, <&gpioi2c1>;
+		i2c-bus-name = "i2c-exio1";
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
 };
 
 &du {
@@ -322,6 +347,11 @@
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
+	i2c1_pins: i2c1 {
+		groups = "i2c1";
+		function = "i2c1";
+	};
+
 	i2c2_pins: i2c2 {
 		groups = "i2c2";
 		function = "i2c2";
@@ -538,6 +568,11 @@
 	};
 };
 
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "i2c-exio1";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
-- 
2.1.4
