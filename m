Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34722 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751964AbdI2Ly0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:54:26 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 06/48] ARM: dts: r8a7793: Stop grouping clocks under a "clocks" subnode
Date: Fri, 29 Sep 2017 13:52:58 +0200
Message-Id: <c67e243ccf06aec0fece59b8a1f3eb719e07b0e3.1506683482.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506683482.git.horms+renesas@verge.net.au>
References: <cover.1506683482.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The current practice is to not group clocks under a "clocks" subnode,
but just put them together with the other on-SoC devices.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7793.dtsi | 125 ++++++++++++++++++++---------------------
 1 file changed, 60 insertions(+), 65 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index ef8009c01e66..d48b97c853cd 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -972,71 +972,66 @@
 		status = "disabled";
 	};
 
-	clocks {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		/* External root clock */
-		extal_clk: extal {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			/* This value must be overridden by the board. */
-			clock-frequency = <0>;
-		};
-
-		/*
-		 * The external audio clocks are configured as 0 Hz fixed frequency clocks by
-		 * default. Boards that provide audio clocks should override them.
-		 */
-		audio_clk_a: audio_clk_a {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <0>;
-		};
-		audio_clk_b: audio_clk_b {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <0>;
-		};
-		audio_clk_c: audio_clk_c {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <0>;
-		};
-
-		/* External USB clock - can be overridden by the board */
-		usb_extal_clk: usb_extal {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <48000000>;
-		};
-
-		/* External CAN clock */
-		can_clk: can {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			/* This value must be overridden by the board. */
-			clock-frequency = <0>;
-		};
-
-		/* External SCIF clock */
-		scif_clk: scif {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			/* This value must be overridden by the board. */
-			clock-frequency = <0>;
-		};
-
-		/* Special CPG clocks */
-		cpg: clock-controller@e6150000 {
-			compatible = "renesas,r8a7793-cpg-mssr";
-			reg = <0 0xe6150000 0 0x1000>;
-			clocks = <&extal_clk>, <&usb_extal_clk>;
-			clock-names = "extal", "usb_extal";
-			#clock-cells = <2>;
-			#power-domain-cells = <0>;
-		};
+	/* External root clock */
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
+
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
+	/* External USB clock - can be overridden by the board */
+	usb_extal_clk: usb_extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <48000000>;
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
+	/* External SCIF clock */
+	scif_clk: scif {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
+
+	/* Special CPG clocks */
+	cpg: clock-controller@e6150000 {
+		compatible = "renesas,r8a7793-cpg-mssr";
+		reg = <0 0xe6150000 0 0x1000>;
+		clocks = <&extal_clk>, <&usb_extal_clk>;
+		clock-names = "extal", "usb_extal";
+		#clock-cells = <2>;
+		#power-domain-cells = <0>;
 	};
 
 	rst: reset-controller@e6160000 {
-- 
2.1.4
