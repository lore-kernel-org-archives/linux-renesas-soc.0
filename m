Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34412 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751278AbcGNUUi (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 14 Jul 2016 16:20:38 -0400
Received: by mail-lf0-f51.google.com with SMTP id l69so15938655lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jul 2016 13:20:38 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] ARM: dts: r8a7792: add CAN support
Date: Thu, 14 Jul 2016 23:20:35 +0300
Message-ID: <18830980.VXHu8E8Ec7@wasted.cogentembedded.com>
In-Reply-To: <34968644.DhifNderY8@wasted.cogentembedded.com>
References: <34968644.DhifNderY8@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the generic R8A7792 parts of the CAN0/1 device nodes.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7792.dtsi |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -468,6 +468,30 @@
 			status = "disabled";
 		};
 
+		can0: can@e6e80000 {
+			compatible = "renesas,can-r8a7792",
+				     "renesas,rcar-gen2-can";
+			reg = <0 0xe6e80000 0 0x1000>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp9_clks R8A7792_CLK_CAN0>,
+				 <&rcan_clk>, <&can_clk>;
+			clock-names = "clkp1", "clkp2", "can_clk";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		can1: can@e6e88000 {
+			compatible = "renesas,can-r8a7792",
+				     "renesas,rcar-gen2-can";
+			reg = <0 0xe6e88000 0 0x1000>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mstp9_clks R8A7792_CLK_CAN1>,
+				 <&rcan_clk>, <&can_clk>;
+			clock-names = "clkp1", "clkp2", "can_clk";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		/* Special CPG clocks */
 		cpg_clocks: cpg_clocks@e6150000 {
 			compatible = "renesas,r8a7792-cpg-clocks",
