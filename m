Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60779 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932629AbeBLOjp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 09:39:45 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/4] ARM: dts: r7s72100: stop grouping clocks under a "clocks" subnode
Date: Mon, 12 Feb 2018 15:39:29 +0100
Message-Id: <20180212143930.4763-4-horms+renesas@verge.net.au>
In-Reply-To: <20180212143930.4763-1-horms+renesas@verge.net.au>
References: <20180212143930.4763-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The current practice is to not group clocks under a "clocks" subnode,
but just put them together with the other on-SoC devices.

As per updates for R-Car Gen2 SoCs by Geert Uytterhoeven.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100.dtsi | 104 +++++++++++++++++++---------------------
 1 file changed, 49 insertions(+), 55 deletions(-)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 0d63dbe11e0d..d69d4810e597 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -30,62 +30,56 @@
 		spi4 = &spi4;
 	};
 
-	clocks {
-		ranges;
-		#address-cells = <1>;
-		#size-cells = <1>;
+	/* External clocks */
+	extal_clk: extal {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		/* If clk present, value must be set by board */
+		clock-frequency = <0>;
+	};
 
-		/* External clocks */
-		extal_clk: extal {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			/* If clk present, value must be set by board */
-			clock-frequency = <0>;
-		};
-
-		usb_x1_clk: usb_x1 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			/* If clk present, value must be set by board */
-			clock-frequency = <0>;
-		};
-
-		rtc_x1_clk: rtc_x1 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			/* If clk present, value must be set by board to 32678 */
-			clock-frequency = <0>;
-		};
-
-		rtc_x3_clk: rtc_x3 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			/* If clk present, value must be set by board to 4000000 */
-			clock-frequency = <0>;
-		};
-
-		/* Fixed factor clocks */
-		b_clk: b {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-			clocks = <&cpg_clocks R7S72100_CLK_PLL>;
-			clock-mult = <1>;
-			clock-div = <3>;
-		};
-		p1_clk: p1 {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-			clocks = <&cpg_clocks R7S72100_CLK_PLL>;
-			clock-mult = <1>;
-			clock-div = <6>;
-		};
-		p0_clk: p0 {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-			clocks = <&cpg_clocks R7S72100_CLK_PLL>;
-			clock-mult = <1>;
-			clock-div = <12>;
-		};
+	usb_x1_clk: usb_x1 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		/* If clk present, value must be set by board */
+		clock-frequency = <0>;
+	};
+
+	rtc_x1_clk: rtc_x1 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		/* If clk present, value must be set by board to 32678 */
+		clock-frequency = <0>;
+	};
+
+	rtc_x3_clk: rtc_x3 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		/* If clk present, value must be set by board to 4000000 */
+		clock-frequency = <0>;
+	};
+
+	/* Fixed factor clocks */
+	b_clk: b {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&cpg_clocks R7S72100_CLK_PLL>;
+		clock-mult = <1>;
+		clock-div = <3>;
+	};
+	p1_clk: p1 {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&cpg_clocks R7S72100_CLK_PLL>;
+		clock-mult = <1>;
+		clock-div = <6>;
+	};
+	p0_clk: p0 {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&cpg_clocks R7S72100_CLK_PLL>;
+		clock-mult = <1>;
+		clock-div = <12>;
 	};
 
 	cpus {
-- 
2.11.0
