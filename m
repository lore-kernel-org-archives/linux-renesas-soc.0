Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:34712 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751260AbcGWTRq (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sat, 23 Jul 2016 15:17:46 -0400
Received: by mail-lf0-f43.google.com with SMTP id l69so105169394lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Jul 2016 12:17:45 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: r8a7792: add VIN support
Date: Sat, 23 Jul 2016 22:17:42 +0300
Message-ID: <2505176.7Q9RZuLBta@wasted.cogentembedded.com>
In-Reply-To: <17288006.ERHB6654v5@wasted.cogentembedded.com>
References: <17288006.ERHB6654v5@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the generic R8A7792 parts of the VIN[0-5] device nodes.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7792.dtsi |   66 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -25,6 +25,12 @@
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
+		vin0 = &vin0;
+		vin1 = &vin1;
+		vin2 = &vin2;
+		vin3 = &vin3;
+		vin4 = &vin4;
+		vin5 = &vin5;
 };
 
 	cpus {
@@ -573,6 +579,66 @@
 			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
+
+		vin0: video@e6ef0000 {
+			compatible = "renesas,vin-r8a7792",
+				     "renesas,rcar-gen2-vin";
+			reg = <0 0xe6ef0000 0 0x1000>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp8_clks R8A7792_CLK_VIN0>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		vin1: video@e6ef1000 {
+			compatible = "renesas,vin-r8a7792",
+				     "renesas,rcar-gen2-vin";
+			reg = <0 0xe6ef1000 0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp8_clks R8A7792_CLK_VIN1>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		vin2: video@e6ef2000 {
+			compatible = "renesas,vin-r8a7792",
+				     "renesas,rcar-gen2-vin";
+			reg = <0 0xe6ef2000 0 0x1000>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp8_clks R8A7792_CLK_VIN2>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		vin3: video@e6ef3000 {
+			compatible = "renesas,vin-r8a7792",
+				     "renesas,rcar-gen2-vin";
+			reg = <0 0xe6ef3000 0 0x1000>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp8_clks R8A7792_CLK_VIN3>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		vin4: video@e6ef4000 {
+			compatible = "renesas,vin-r8a7792",
+				     "renesas,rcar-gen2-vin";
+			reg = <0 0xe6ef4000 0 0x1000>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp8_clks R8A7792_CLK_VIN4>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		vin5: video@e6ef5000 {
+			compatible = "renesas,vin-r8a7792",
+				     "renesas,rcar-gen2-vin";
+			reg = <0 0xe6ef5000 0 0x1000>;
+			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp8_clks R8A7792_CLK_VIN5>;
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
 
 		/* Special CPG clocks */
 		cpg_clocks: cpg_clocks@e6150000 {
