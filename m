Return-Path: <SRS0+ku8b=NS=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,geert+renesas@glider.be
Date: Mon, 18 Jan 2016 14:08:48 +0900
Message-Id: <20160118050848.20358.62538.sendpatchset@little-apple>
In-Reply-To: <20160118050831.20358.83393.sendpatchset@little-apple>
References: <20160118050831.20358.83393.sendpatchset@little-apple>
Subject: [PATCH/RFC v2 02/03] ARM: shmobile: r8a7795: Hack up SYS-DMAC0 support
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

This hooks up SYS-DMAC0 as r8a7795 device node. Note that the
generic compat string is used, this should be replaced by
SoC-specific compat string. Not for upstream merge.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V1:
 - The SYS-DMAC error IRQ is updated to match the documentation.

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |   30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2016-01-15 17:29:01.860513000 +0900
@@ -350,7 +350,35 @@
 		};
 
 		dmac0: dma-controller@e6700000 {
-			/* Empty node for now */
+			compatible = "renesas,rcar-dmac";
+			reg = <0 0xe6700000 0 0x10000>;
+			interrupts =	<0 199 IRQ_TYPE_LEVEL_HIGH
+					 0 200 IRQ_TYPE_LEVEL_HIGH
+					 0 201 IRQ_TYPE_LEVEL_HIGH
+					 0 202 IRQ_TYPE_LEVEL_HIGH
+					 0 203 IRQ_TYPE_LEVEL_HIGH
+					 0 204 IRQ_TYPE_LEVEL_HIGH
+					 0 205 IRQ_TYPE_LEVEL_HIGH
+					 0 206 IRQ_TYPE_LEVEL_HIGH
+					 0 207 IRQ_TYPE_LEVEL_HIGH
+					 0 208 IRQ_TYPE_LEVEL_HIGH
+					 0 209 IRQ_TYPE_LEVEL_HIGH
+					 0 210 IRQ_TYPE_LEVEL_HIGH
+					 0 211 IRQ_TYPE_LEVEL_HIGH
+					 0 212 IRQ_TYPE_LEVEL_HIGH
+					 0 213 IRQ_TYPE_LEVEL_HIGH
+					 0 214 IRQ_TYPE_LEVEL_HIGH
+					 0 215 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 219>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
 		};
 
 		dmac1: dma-controller@e7300000 {
