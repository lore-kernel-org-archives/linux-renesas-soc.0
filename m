Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:29758 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752282AbcGUKrd (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 06:47:33 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <horms@verge.net.au>, <magnus.damm@gmail.com>,
	<robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/5] arm64: dts: salvator-x: enable usb2_phy of channel 0
Date: Thu, 21 Jul 2016 19:46:58 +0900
Message-ID: <1469098021-7692-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1469098021-7692-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1469098021-7692-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch also adds a regulator node for USB2.0 to handle VBUS on/off
by the phy-rcar-gen3-usb2 driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 98f0263..8c8bfdc 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -110,6 +110,17 @@
 			  1800000 0>;
 	};
 
+	vbus0_usb2: regulator-vbus0-usb2 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "USB20_VBUS0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio6 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	audio_clkout: audio_clkout {
 		/*
 		 * This is same as <&rcar_sound 0>
@@ -193,6 +204,11 @@
 		function = "audio_clk";
 	};
 
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
+
 	usb1_pins: usb1 {
 		groups = "usb1";
 		function = "usb1";
@@ -369,6 +385,14 @@
 	status = "okay";
 };
 
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&vbus0_usb2>;
+	status = "okay";
+};
+
 &usb2_phy1 {
 	pinctrl-0 = <&usb1_pins>;
 	pinctrl-names = "default";
-- 
1.9.1
