Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:32946 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761904AbcINQqZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 12:46:25 -0400
Received: by mail-wm0-f66.google.com with SMTP id b187so3352906wme.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 09:46:24 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: horms@verge.net.au, magnus.damm@gmail.com, wsa@the-dreams.de,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 4/6] arm64: renesas: r8a7796: add I2C support
Date: Wed, 14 Sep 2016 18:46:09 +0200
Message-Id: <20160914164611.31237-5-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <20160914164611.31237-1-ulrich.hecht+renesas@gmail.com>
References: <20160914164611.31237-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 94 ++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index d7590c3..a4d8b76 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -17,6 +17,16 @@
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
+	};
+
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
@@ -239,6 +249,90 @@
 			#power-domain-cells = <1>;
 		};
 
+		i2c0: i2c@e6500000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a7796";
+			reg = <0 0xe6500000 0 0x40>;
+			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 931>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			i2c-scl-internal-delay-ns = <110>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@e6508000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a7796";
+			reg = <0 0xe6508000 0 0x40>;
+			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 930>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			i2c-scl-internal-delay-ns = <6>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@e6510000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a7796";
+			reg = <0 0xe6510000 0 0x40>;
+			interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 929>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			i2c-scl-internal-delay-ns = <6>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@e66d0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a7796";
+			reg = <0 0xe66d0000 0 0x40>;
+			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 928>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			i2c-scl-internal-delay-ns = <110>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@e66d8000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a7796";
+			reg = <0 0xe66d8000 0 0x40>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 927>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			i2c-scl-internal-delay-ns = <110>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@e66e0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a7796";
+			reg = <0 0xe66e0000 0 0x40>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 919>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			i2c-scl-internal-delay-ns = <110>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@e66e8000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r8a7796";
+			reg = <0 0xe66e8000 0 0x40>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 918>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			i2c-scl-internal-delay-ns = <6>;
+			status = "disabled";
+		};
+
 		scif2: serial@e6e88000 {
 			compatible = "renesas,scif-r8a7796",
 				     "renesas,rcar-gen3-scif", "renesas,scif";
-- 
2.9.3
