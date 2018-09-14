Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:59414 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728127AbeINOYX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 10:24:23 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, Ulrich Hecht <uli@fpond.eu>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 12/16] arm64: dts: renesas: r8a77990: Add I2C device nodes
Date: Fri, 14 Sep 2018 12:10:42 +0300
Message-Id: <20180914091046.483-13-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Add device nodes for I2C ch{0,1,2,3,4,5,6,7} to R-Car E3 R8A77990 device
tree.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 123 ++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index ae89260baad9..abb14af76c0e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -14,6 +14,17 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -185,6 +196,118 @@
 			resets = <&cpg 906>;
 		};
 
+		i2c0: i2c@e6500000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a77990",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe6500000 0 0x40>;
+			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 931>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 931>;
+			i2c-scl-internal-delay-ns = <110>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@e6508000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a77990",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe6508000 0 0x40>;
+			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 930>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 930>;
+			i2c-scl-internal-delay-ns = <6>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@e6510000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a77990",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe6510000 0 0x40>;
+			interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 929>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 929>;
+			i2c-scl-internal-delay-ns = <6>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@e66d0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a77990",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe66d0000 0 0x40>;
+			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 928>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 928>;
+			i2c-scl-internal-delay-ns = <110>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@e66d8000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a77990",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe66d8000 0 0x40>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 927>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 927>;
+			i2c-scl-internal-delay-ns = <6>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@e66e0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a77990",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe66e0000 0 0x40>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 919>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 919>;
+			i2c-scl-internal-delay-ns = <6>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@e66e8000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a77990",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe66e8000 0 0x40>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 918>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 918>;
+			i2c-scl-internal-delay-ns = <6>;
+			status = "disabled";
+		};
+
+		i2c7: i2c@e6690000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a77990",
+				     "renesas,rcar-gen3-i2c";
+			reg = <0 0xe6690000 0 0x40>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1003>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 1003>;
+			i2c-scl-internal-delay-ns = <6>;
+			status = "disabled";
+		};
+
 		pfc: pin-controller@e6060000 {
 			compatible = "renesas,pfc-r8a77990";
 			reg = <0 0xe6060000 0 0x508>;
-- 
Regards,

Laurent Pinchart
