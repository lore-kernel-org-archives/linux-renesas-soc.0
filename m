Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34793 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751906AbdI2LzM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:55:12 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 41/48] ARM: dts: iwg22m: Enable SDHI1 controller
Date: Fri, 29 Sep 2017 13:53:33 +0200
Message-Id: <599114ee21057040c058043fdc1367878350d5e4.1506683482.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506683482.git.horms+renesas@verge.net.au>
References: <cover.1506683482.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Enable the SDHI1 controller on iWave RZ/G1E SoM.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7745-iwg22m.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22m.dtsi b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
index e306e7c5b644..f7f9ceff35a6 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
+++ b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
@@ -9,6 +9,7 @@
  */
 
 #include "r8a7745.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	compatible = "iwave,g22m", "renesas,r8a7745";
@@ -38,6 +39,12 @@
 		function = "mmc";
 	};
 
+	sdhi1_pins: sd1 {
+		groups = "sdhi1_data4", "sdhi1_ctrl";
+		function = "sdhi1";
+		power-source = <3300>;
+	};
+
 	i2c3_pins: i2c3 {
 		groups = "i2c3_b";
 		function = "i2c3";
@@ -54,6 +61,16 @@
 	status = "okay";
 };
 
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_3p3v>;
+	cd-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &i2c3 {
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
-- 
2.1.4
