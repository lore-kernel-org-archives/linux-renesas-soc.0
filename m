Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753476AbeCPOyE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:54:04 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 23/52] ARM: dts: r8a7794: sort subnodes of root node
Date: Fri, 16 Mar 2018 15:52:42 +0100
Message-Id: <807eeaf95e2647277f89284d91d1785c2280c2c6.1521208546.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521208546.git.horms+renesas@verge.net.au>
References: <cover.1521208546.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sort the subnodes of the soc node to improve maintainability.
The sort key is the address on the bus with instances of the same
IP block grouped together.

Also re-align comment of audio_clka to match other R-Car SoCs.

This patch should not introduce any functional change.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7794.dtsi | 90 +++++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 9e5f886f53c5..d588efa6aeaa 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -33,6 +33,35 @@
 		vin1 = &vin1;
 	};
 
+	/*
+	 * The external audio clocks are configured as 0 Hz fixed frequency
+	 * clocks by default.
+	 * Boards that provide audio clocks should override them.
+	 */
+	audio_clka: audio_clka {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+	audio_clkb: audio_clkb {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+	audio_clkc: audio_clkc {
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
@@ -66,6 +95,22 @@
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
@@ -1353,55 +1398,10 @@
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
-
-	/*
-	 * The external audio clocks are configured  as 0 Hz fixed
-	 * frequency clocks by default.  Boards that provide audio
-	 * clocks should override them.
-	 */
-	audio_clka: audio_clka {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <0>;
-	};
-	audio_clkb: audio_clkb {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <0>;
-	};
-	audio_clkc: audio_clkc {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <0>;
-	};
 };
-- 
2.11.0
