Return-Path: <SRS0+93W/=OP=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,geert+renesas@glider.be
Date: Tue, 16 Feb 2016 11:26:44 +0900
Message-Id: <20160216022644.12147.42064.sendpatchset@little-apple>
In-Reply-To: <20160216022635.12147.46525.sendpatchset@little-apple>
References: <20160216022635.12147.46525.sendpatchset@little-apple>
Subject: [PATCH 01/02] arm64: dts: r8a7795: Add INTC-EX device node
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add a single r8a7795 INTC-EX device node to support
external IRQ pins IRQ0 -> IRQ5.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2016-02-16 11:01:37.760513000 +0900
@@ -357,6 +357,21 @@
 			reg = <0 0xe6060000 0 0x50c>;
 		};
 
+		intc_ex: interrupt-controller@e61c0000 {
+			compatible = "renesas,intc-ex-r8a7795", "renesas,irqc";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			reg = <0 0xe61c0000 0 0x200>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 407>;
+			power-domains = <&cpg>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a7795",
 				     "renesas,rcar-dmac";
