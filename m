Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:32877 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1171327AbdDXP0s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 11:26:48 -0400
Received: by mail-it0-f65.google.com with SMTP id z67so17959923itb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2017 08:26:48 -0700 (PDT)
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH V3] ARM: dts: r8a7791: Add GyroADC clock and device node
Date: Mon, 24 Apr 2017 17:26:32 +0200
Message-Id: <20170424152632.3478-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add node for the GyroADC block and it's associated clock.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
---
V2: - Drop the whole ad-hoc ADC clock block
V3: - Add gyroadc p_clk phandle into the mstp9 clocks node
---
 arch/arm/boot/dts/r8a7791.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 4d0c2ce59900..17b38f88bb7f 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -776,6 +776,15 @@
 		status = "disabled";
 	};
 
+	adc: adc@e6e54000 {
+		compatible = "renesas,r8a7791-gyroadc", "renesas,rcar-gyroadc";
+		reg = <0 0xe6e54000 0 64>;
+		clocks = <&mstp9_clks R8A7791_CLK_GYROADC>;
+		clock-names = "fck";
+		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+		status = "disabled";
+	};
+
 	scif2: serial@e6e58000 {
 		compatible = "renesas,scif-r8a7791", "renesas,rcar-gen2-scif",
 			     "renesas,scif";
@@ -1425,13 +1434,15 @@
 		mstp9_clks: mstp9_clks@e6150994 {
 			compatible = "renesas,r8a7791-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150994 0 4>, <0 0xe61509a4 0 4>;
-			clocks = <&cp_clk>, <&cp_clk>, <&cp_clk>, <&cp_clk>,
+			clocks = <&p_clk>,
+				 <&cp_clk>, <&cp_clk>, <&cp_clk>, <&cp_clk>,
 				 <&cp_clk>, <&cp_clk>, <&cp_clk>, <&cp_clk>,
 				 <&p_clk>, <&p_clk>, <&cpg_clocks R8A7791_CLK_QSPI>, <&hp_clk>,
 				 <&cp_clk>, <&hp_clk>, <&hp_clk>, <&hp_clk>,
 				 <&hp_clk>, <&hp_clk>;
 			#clock-cells = <1>;
 			clock-indices = <
+				R8A7791_CLK_GYROADC
 				R8A7791_CLK_GPIO7 R8A7791_CLK_GPIO6 R8A7791_CLK_GPIO5 R8A7791_CLK_GPIO4
 				R8A7791_CLK_GPIO3 R8A7791_CLK_GPIO2 R8A7791_CLK_GPIO1 R8A7791_CLK_GPIO0
 				R8A7791_CLK_RCAN1 R8A7791_CLK_RCAN0 R8A7791_CLK_QSPI_MOD R8A7791_CLK_I2C5
@@ -1439,6 +1450,7 @@
 				R8A7791_CLK_I2C1 R8A7791_CLK_I2C0
 			>;
 			clock-output-names =
+				"gyroadc",
 				"gpio7", "gpio6", "gpio5", "gpio4", "gpio3", "gpio2", "gpio1", "gpio0",
 				"rcan1", "rcan0", "qspi_mod", "i2c5", "i2c6", "i2c4", "i2c3", "i2c2",
 				"i2c1", "i2c0";
-- 
2.11.0
