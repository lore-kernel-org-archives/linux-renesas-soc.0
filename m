Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34830 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753577AbeAQQT6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 11:19:58 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 12/16] ARM: dts: r8a7793: sort subnodes of root node
Date: Wed, 17 Jan 2018 17:17:13 +0100
Message-Id: <20180117161717.14589-13-horms+renesas@verge.net.au>
In-Reply-To: <20180117161717.14589-1-horms+renesas@verge.net.au>
References: <20180117161717.14589-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sort the subnodes of the soc node to improve maintainability.
The sort key is the address on the bus with instances of the same
IP block grouped together.

This patch should not introduce any functional change.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v2
* New patch
---
 arch/arm/boot/dts/r8a7793.dtsi | 90 +++++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index f2b58a28cee9..aa7d7792fb13 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -31,6 +31,35 @@
 		spi0 = &qspi;
 	};
 
+	/*
+	 * The external audio clocks are configured as 0 Hz fixed frequency
+	 * clocks by default.
+	 * Boards that provide audio clocks should override them.
+	 */
+	audio_clk_a: audio_clk_a {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+	audio_clk_b: audio_clk_b {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+	audio_clk_c: audio_clk_c {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	/* External CAN clock */
+	can_clk: can {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -73,6 +102,22 @@
 		};
 	};
 
+	/* External root clock */
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
+
+	/* External SCIF clock */
+	scif_clk: scif {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
@@ -1342,55 +1387,10 @@
 				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-	/* External root clock */
-	extal_clk: extal {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		/* This value must be overridden by the board. */
-		clock-frequency = <0>;
-	};
-
-	/*
-	 * The external audio clocks are configured as 0 Hz fixed frequency
-	 * clocks by default.
-	 * Boards that provide audio clocks should override them.
-	 */
-	audio_clk_a: audio_clk_a {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <0>;
-	};
-	audio_clk_b: audio_clk_b {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <0>;
-	};
-	audio_clk_c: audio_clk_c {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <0>;
-	};
-
 	/* External USB clock - can be overridden by the board */
 	usb_extal_clk: usb_extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <48000000>;
 	};
-
-	/* External CAN clock */
-	can_clk: can {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		/* This value must be overridden by the board. */
-		clock-frequency = <0>;
-	};
-
-	/* External SCIF clock */
-	scif_clk: scif {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		/* This value must be overridden by the board. */
-		clock-frequency = <0>;
-	};
 };
-- 
2.11.0
