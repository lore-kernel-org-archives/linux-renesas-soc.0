Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41388 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760355AbcKDJo3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 05:44:29 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 10/12] arm64: dts: r8a7796: salvator: enable on board eMMC
Date: Fri,  4 Nov 2016 10:44:05 +0100
Message-Id: <38548328fe3ff931063ce81ed3c3b5867c5fb233.1478251192.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1478251192.git.horms+renesas@verge.net.au>
References: <cover.1478251192.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 44 +++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index 08c335afd970..a9c296b1e1b7 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -31,6 +31,24 @@
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
+	reg_1p8v: regulator0 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator1 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
@@ -78,7 +96,6 @@
 		states = <3300000 1
 			  1800000 0>;
 	};
-
 };
 
 &pfc {
@@ -106,6 +123,18 @@
 		power-source = <1800>;
 	};
 
+	sdhi2_pins: sd2 {
+		groups = "sdhi2_data8", "sdhi2_ctrl";
+		function = "sdhi2";
+		power-source = <3300>;
+	};
+
+	sdhi2_pins_uhs: sd2_uhs {
+		groups = "sdhi2_data8", "sdhi2_ctrl";
+		function = "sdhi2";
+		power-source = <1800>;
+	};
+
 	sdhi3_pins: sd3 {
 		groups = "sdhi3_data4", "sdhi3_ctrl";
 		function = "sdhi3";
@@ -141,6 +170,19 @@
 	status = "okay";
 };
 
+&sdhi2 {
+	/* used for on-board 8bit eMMC */
+	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
 &sdhi3 {
 	pinctrl-0 = <&sdhi3_pins>;
 	pinctrl-1 = <&sdhi3_pins_uhs>;
-- 
2.7.0.rc3.207.g0ac5344
