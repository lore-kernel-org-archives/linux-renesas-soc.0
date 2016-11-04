Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41388 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751154AbcKDJoQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 05:44:16 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 01/12] arm64: dts: r8a7795: salvator-x: enable UHS for SDHI 0 & 3
Date: Fri,  4 Nov 2016 10:43:56 +0100
Message-Id: <2a927eeaf6b64f39b4f0907417f85c7ee1d26119.1478251192.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1478251192.git.horms+renesas@verge.net.au>
References: <cover.1478251192.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index b1eab6876f8c..ff4e4fe843ed 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -237,11 +237,25 @@
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
+		power-source = <3300>;
+	};
+
+	sdhi0_pins_uhs: sd0_uhs {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+		power-source = <1800>;
 	};
 
 	sdhi3_pins: sd3 {
 		groups = "sdhi3_data4", "sdhi3_ctrl";
 		function = "sdhi3";
+		power-source = <3300>;
+	};
+
+	sdhi3_pins_uhs: sd3_uhs {
+		groups = "sdhi3_data4", "sdhi3_ctrl";
+		function = "sdhi3";
+		power-source = <1800>;
 	};
 
 	sound_pins: sound {
@@ -371,25 +385,29 @@
 
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdhi0_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
 
 	vmmc-supply = <&vcc_sdhi0>;
 	vqmmc-supply = <&vccq_sdhi0>;
 	cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
 	wp-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
 	bus-width = <4>;
+	sd-uhs-sdr50;
 	status = "okay";
 };
 
 &sdhi3 {
 	pinctrl-0 = <&sdhi3_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdhi3_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
 
 	vmmc-supply = <&vcc_sdhi3>;
 	vqmmc-supply = <&vccq_sdhi3>;
 	cd-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
 	wp-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
 	bus-width = <4>;
+	sd-uhs-sdr50;
 	status = "okay";
 };
 
-- 
2.7.0.rc3.207.g0ac5344
