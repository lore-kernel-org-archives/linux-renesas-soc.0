Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53707 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161420AbcEaDca (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 23:32:30 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [RFC 2/4] ARM: dts: r8a7790: lager: use demuxer for IIC1/I2C1
Date: Tue, 31 May 2016 12:32:06 +0900
Message-Id: <1464665528-11398-3-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1464665528-11398-1-git-send-email-horms+renesas@verge.net.au>
References: <1464665528-11398-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Make it possible to select which I2C1 IP core you want to run on the
EXIO-A connector.

This is based on reference work for the I2C0 core of the lager by Wolfram Sang.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 71d62ca282ea..2e671aeafbef 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -51,6 +51,7 @@
 		serial0 = &scif0;
 		serial1 = &scifa1;
 		i2c8 = "i2cexio0";
+		i2c9 = "i2cexio1";
 	};
 
 	chosen {
@@ -270,6 +271,19 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
+
+	/*
+	 * IIC1/I2C1 is routed to EXIO connector A, pins 78 (SCL) + 80 (SDA).
+	 * For further notes see i2cexio0.
+	 */
+
+	i2cexio1: i2c-9 {
+		compatible = "i2c-demux-pinctrl";
+		i2c-parent = <&iic1>, <&i2c1>;
+		i2c-bus-name = "i2c-exio1";
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
 };
 
 &du {
@@ -392,6 +406,11 @@
 		function = "iic0";
 	};
 
+	i2c1_pins: i2c1 {
+		groups = "i2c1";
+		function = "i2c1";
+	};
+
 	iic1_pins: iic1 {
 		groups = "iic1";
 		function = "iic1";
@@ -588,10 +607,14 @@
 	pinctrl-names = "i2c-exio0";
 };
 
+&i2c1	{
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "i2c-exio1";
+};
+
 &iic1	{
-	status = "okay";
 	pinctrl-0 = <&iic1_pins>;
-	pinctrl-names = "default";
+	pinctrl-names = "i2c-exio1";
 };
 
 &iic2	{
-- 
2.1.4
