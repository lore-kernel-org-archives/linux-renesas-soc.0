Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:42069 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751491AbdLTFRR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 00:17:17 -0500
Received: by mail-pl0-f66.google.com with SMTP id bd8so8406496plb.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Dec 2017 21:17:16 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 20 Dec 2017 14:16:13 +0900
Message-Id: <151374697364.16330.3759605490782372006.sendpatchset@little-apple>
Subject: [PATCH/RFC] arm64: r8a77965 Salvator-X IPMMU environment prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Here's a simple prototype to get a basic IPMMU environment going on
the R-Car M3-N SoC on the r8a77965 Salvator-X board. IPMMU-MM and DS0/DS1
are used with SYS-DMAC that in turn may be used with SCIF for testing.

As based "renesas-drivers-next-2017-11-14-v4.14" is used with
[PATCH/RFC] arm64: r8a77965 Salvator-X SoC/board support prototype

This patch includes the following commits from renesas-bsp @ kernel.org
and in particular the recent "rcar-3.5.9.rc2" release:

3d6d07bafc20 soc: renesas: Add r8a77965 SYSC PM Domain Binding Definitions
a537d04be7e5 soc: renesas: rcar-sysc: Add support for R-Car M3N power areas (*)
03dec5bca11a clk: renesas: r8a77965: Add SCIF clocks
46caaa3cafbb arm64: dts: r8a77965: Add SCIF-{0,1,3,4,5} device nodes
6959e5326b1f arm64: dts: r8a77965-salvator-x: Enable SCIF1 support (*)
c226bdd7f896 clk: renesas: r8a77965: Add SYS-DMAC clocks
c62337d81daf arm64: dts: r8a77965: Add SYS-DMAC device nodes (*)
9238f852983c arm64: dts: r8a77965: Enable SCIF DMA (*)
ef1003d9e384 arm64: dts: r8a77965: Add IPMMU-MM device node
e96d39682989 arm64: dts: r8a77965: Add IPMMU-DS0, DS1 device nodes
49b59f34d7fd arm64: dts: r8a77965: Hook up SYS-DMAC/Audio-DMAC to IPMMU (*)

Original authors of commits above are:
Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Phuong Nguyen <phuong.nguyen.uj@rvc.renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Commits marked with (*) above have been updated to fit on upstream

Since this is prototype code and not suitable for mainline merge as-is:
Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt |    1 
 arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts           |    5 
 arch/arm64/boot/dts/renesas/r8a77965.dtsi                     |  225 ++++++++++
 drivers/clk/renesas/r8a77965-cpg-mssr.c                       |    8 
 drivers/soc/renesas/Kconfig                                   |    5 
 drivers/soc/renesas/Makefile                                  |    1 
 drivers/soc/renesas/r8a77965-sysc.c                           |   38 +
 drivers/soc/renesas/rcar-sysc.c                               |    3 
 drivers/soc/renesas/rcar-sysc.h                               |    1 
 include/dt-bindings/power/r8a77965-sysc.h                     |   31 +
 10 files changed, 318 insertions(+)

--- 0001/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
+++ work/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt	2017-12-20 10:53:51.960607110 +0900
@@ -17,6 +17,7 @@ Required properties:
       - "renesas,r8a7794-sysc" (R-Car E2)
       - "renesas,r8a7795-sysc" (R-Car H3)
       - "renesas,r8a7796-sysc" (R-Car M3-W)
+      - "renesas,r8a77965-sysc" (R-Car M3-N)
       - "renesas,r8a77970-sysc" (R-Car V3M)
       - "renesas,r8a77995-sysc" (R-Car D3)
   - reg: Address start and address range for the device.
--- 0002/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts	2017-12-20 10:54:24.440607110 +0900
@@ -17,6 +17,7 @@
 
 	aliases {
 		serial0 = &scif2;
+		serial1 = &scif1;
 	};
 
 	chosen {
@@ -69,6 +70,10 @@
 	clock-frequency = <16666666>;
 };
 
+&scif1 {
+	status = "okay";
+};
+
 &scif2 {
 	status = "okay";
 };
--- 0002/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77965.dtsi	2017-12-20 10:55:08.250607110 +0900
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/clock/r8a77965-cpg-mssr.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/r8a77965-sysc.h>
 
 / {
 	compatible = "renesas,r8a77965";
@@ -101,6 +102,31 @@
 			interrupt-affinity = <&a57_0>;
 		};
 
+		ipmmu_ds0: mmu@e6740000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xe6740000 0 0x1000>; /* IPMMU-DS0 */
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_ds1: mmu@e7740000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xe7740000 0 0x1000>; /* IPMMU-DS1 */
+			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_mm: mmu@e67b0000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xe67b0000 0 0x1000>; /* IPMMU-MM */
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a77965-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
@@ -126,6 +152,159 @@
 			#power-domain-cells = <1>;
 		};
 
+		dmac0: dma-controller@e6700000 {
+			compatible = "renesas,dmac-r8a77965",
+				     "renesas,rcar-dmac";
+			reg = <0 0xe6700000 0 0x10000>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 219>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			iommus = <&ipmmu_ds0 0>, <&ipmmu_ds0 1>,
+			       <&ipmmu_ds0 2>, <&ipmmu_ds0 3>,
+			       <&ipmmu_ds0 4>, <&ipmmu_ds0 5>,
+			       <&ipmmu_ds0 6>, <&ipmmu_ds0 7>,
+			       <&ipmmu_ds0 8>, <&ipmmu_ds0 9>,
+			       <&ipmmu_ds0 10>, <&ipmmu_ds0 11>,
+			       <&ipmmu_ds0 12>, <&ipmmu_ds0 13>,
+			       <&ipmmu_ds0 14>, <&ipmmu_ds0 15>;
+		};
+
+		dmac1: dma-controller@e7300000 {
+			compatible = "renesas,dmac-r8a77965",
+				     "renesas,rcar-dmac";
+			reg = <0 0xe7300000 0 0x10000>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 218>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			iommus = <&ipmmu_ds1 0>, <&ipmmu_ds1 1>,
+			       <&ipmmu_ds1 2>, <&ipmmu_ds1 3>,
+			       <&ipmmu_ds1 4>, <&ipmmu_ds1 5>,
+			       <&ipmmu_ds1 6>, <&ipmmu_ds1 7>,
+			       <&ipmmu_ds1 8>, <&ipmmu_ds1 9>,
+			       <&ipmmu_ds1 10>, <&ipmmu_ds1 11>,
+			       <&ipmmu_ds1 12>, <&ipmmu_ds1 13>,
+			       <&ipmmu_ds1 14>, <&ipmmu_ds1 15>;
+		};
+
+		dmac2: dma-controller@e7310000 {
+			compatible = "renesas,dmac-r8a77965",
+				     "renesas,rcar-dmac";
+			reg = <0 0xe7310000 0 0x10000>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 217>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			iommus = <&ipmmu_ds1 16>, <&ipmmu_ds1 17>,
+			       <&ipmmu_ds1 18>, <&ipmmu_ds1 19>,
+			       <&ipmmu_ds1 20>, <&ipmmu_ds1 21>,
+			       <&ipmmu_ds1 22>, <&ipmmu_ds1 23>,
+			       <&ipmmu_ds1 24>, <&ipmmu_ds1 25>,
+			       <&ipmmu_ds1 26>, <&ipmmu_ds1 27>,
+			       <&ipmmu_ds1 28>, <&ipmmu_ds1 29>,
+			       <&ipmmu_ds1 30>, <&ipmmu_ds1 31>;
+		};
+
+		scif0: serial@e6e60000 {
+			compatible = "renesas,scif-r8a77965",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6e60000 0 64>;
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 207>,
+				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x51>, <&dmac1 0x50>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif1: serial@e6e68000 {
+			compatible = "renesas,scif-r8a77965",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6e68000 0 64>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 206>,
+				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x53>, <&dmac1 0x52>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		scif2: serial@e6e88000 {
 			compatible = "renesas,scif-r8a77965",
 				     "renesas,rcar-gen3-scif", "renesas,scif";
@@ -135,6 +314,52 @@
 				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif3: serial@e6c50000 {
+			compatible = "renesas,scif-r8a77965",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6c50000 0 64>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 204>,
+				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x57>, <&dmac0 0x56>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif4: serial@e6c40000 {
+			compatible = "renesas,scif-r8a77965",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6c40000 0 64>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 203>,
+				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x59>, <&dmac0 0x58>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		scif5: serial@e6f30000 {
+			compatible = "renesas,scif-r8a77965",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6f30000 0 64>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 202>,
+				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x5b>, <&dmac1 0x5a>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 	};
--- 0002/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ work/drivers/clk/renesas/r8a77965-cpg-mssr.c	2017-12-20 10:54:32.590607110 +0900
@@ -96,6 +96,14 @@ static const struct cpg_core_clk r8a7796
 };
 
 static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
+	DEF_MOD("scif5",		 202,	R8A77965_CLK_S3D4),
+	DEF_MOD("scif4",		 203,	R8A77965_CLK_S3D4),
+	DEF_MOD("scif3",		 204,	R8A77965_CLK_S3D4),
+	DEF_MOD("scif1",		 206,	R8A77965_CLK_S3D4),
+	DEF_MOD("scif0",		 207,	R8A77965_CLK_S3D4),
+	DEF_MOD("sys-dmac2",		 217,	R8A77965_CLK_S0D3),
+	DEF_MOD("sys-dmac1",		 218,	R8A77965_CLK_S0D3),
+	DEF_MOD("sys-dmac0",		 219,	R8A77965_CLK_S0D3),
 	DEF_MOD("scif2",		 310,	R8A77965_CLK_S3D4),
 	DEF_MOD("intc-ap",		 408,	R8A77965_CLK_S3D1),
 };
--- 0002/drivers/soc/renesas/Kconfig
+++ work/drivers/soc/renesas/Kconfig	2017-12-20 10:53:51.960607110 +0900
@@ -14,6 +14,7 @@ config SOC_RENESAS
 	select SYSC_R8A7794 if ARCH_R8A7794
 	select SYSC_R8A7795 if ARCH_R8A7795
 	select SYSC_R8A7796 if ARCH_R8A7796
+	select SYSC_R8A77965 if ARCH_R8A77965
 	select SYSC_R8A77970 if ARCH_R8A77970
 	select SYSC_R8A77995 if ARCH_R8A77995
 
@@ -56,6 +57,10 @@ config SYSC_R8A7796
 	bool "R-Car M3-W System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
 
+config SYSC_R8A77965
+	bool "R-Car M3-N System Controller support" if COMPILE_TEST
+	select SYSC_RCAR
+
 config SYSC_R8A77970
 	bool "R-Car V3M System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
--- 0001/drivers/soc/renesas/Makefile
+++ work/drivers/soc/renesas/Makefile	2017-12-20 10:53:51.960607110 +0900
@@ -12,6 +12,7 @@ obj-$(CONFIG_SYSC_R8A7792)	+= r8a7792-sy
 obj-$(CONFIG_SYSC_R8A7794)	+= r8a7794-sysc.o
 obj-$(CONFIG_SYSC_R8A7795)	+= r8a7795-sysc.o
 obj-$(CONFIG_SYSC_R8A7796)	+= r8a7796-sysc.o
+obj-$(CONFIG_SYSC_R8A77965)	+= r8a77965-sysc.o
 obj-$(CONFIG_SYSC_R8A77970)	+= r8a77970-sysc.o
 obj-$(CONFIG_SYSC_R8A77995)	+= r8a77995-sysc.o
 
--- /dev/null
+++ work/drivers/soc/renesas/r8a77965-sysc.c	2017-12-20 10:53:52.980607110 +0900
@@ -0,0 +1,38 @@
+/*
+ * Renesas R-Car M3N System Controller
+ *
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+
+#include <linux/bug.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/power/r8a77965-sysc.h>
+
+#include "rcar-sysc.h"
+
+static const struct rcar_sysc_area r8a77965_areas[] __initconst = {
+	{ "always-on",	    0, 0, R8A77965_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
+	{ "ca57-scu",	0x1c0, 0, R8A77965_PD_CA57_SCU,  R8A77965_PD_ALWAYS_ON,
+	  PD_SCU },
+	{ "ca57-cpu0",	 0x80, 0, R8A77965_PD_CA57_CPU0, R8A77965_PD_CA57_SCU,
+	  PD_CPU_NOCR },
+	{ "ca57-cpu1",	 0x80, 1, R8A77965_PD_CA57_CPU1, R8A77965_PD_CA57_SCU,
+	  PD_CPU_NOCR },
+	{ "cr7",	0x240, 0, R8A77965_PD_CR7,	R8A77965_PD_ALWAYS_ON },
+	{ "a3vp",	0x340, 0, R8A77965_PD_A3VP,	R8A77965_PD_ALWAYS_ON },
+	{ "a3vc",	0x380, 0, R8A77965_PD_A3VC,	R8A77965_PD_ALWAYS_ON },
+	{ "a2vc1",	0x3c0, 1, R8A77965_PD_A2VC1,	R8A77965_PD_A3VC },
+	{ "3dg-a",	0x100, 0, R8A77965_PD_3DG_A,	R8A77965_PD_ALWAYS_ON },
+	{ "3dg-b",	0x100, 1, R8A77965_PD_3DG_B,	R8A77965_PD_3DG_A },
+	{ "a3ir",	0x180, 0, R8A77965_PD_A3IR,	R8A77965_PD_ALWAYS_ON },
+};
+
+const struct rcar_sysc_info r8a77965_sysc_info __initconst = {
+	.areas = r8a77965_areas,
+	.num_areas = ARRAY_SIZE(r8a77965_areas),
+};
--- 0001/drivers/soc/renesas/rcar-sysc.c
+++ work/drivers/soc/renesas/rcar-sysc.c	2017-12-20 10:53:51.960607110 +0900
@@ -290,6 +290,9 @@ static const struct of_device_id rcar_sy
 #ifdef CONFIG_SYSC_R8A77995
 	{ .compatible = "renesas,r8a77995-sysc", .data = &r8a77995_sysc_info },
 #endif
+#ifdef CONFIG_ARCH_R8A77965
+	{ .compatible = "renesas,r8a77965-sysc", .data = &r8a77965_sysc_info },
+#endif
 	{ /* sentinel */ }
 };
 
--- 0001/drivers/soc/renesas/rcar-sysc.h
+++ work/drivers/soc/renesas/rcar-sysc.h	2017-12-20 10:53:51.960607110 +0900
@@ -58,6 +58,7 @@ extern const struct rcar_sysc_info r8a77
 extern const struct rcar_sysc_info r8a7794_sysc_info;
 extern const struct rcar_sysc_info r8a7795_sysc_info;
 extern const struct rcar_sysc_info r8a7796_sysc_info;
+extern const struct rcar_sysc_info r8a77965_sysc_info;
 extern const struct rcar_sysc_info r8a77970_sysc_info;
 extern const struct rcar_sysc_info r8a77995_sysc_info;
 
--- /dev/null
+++ work/include/dt-bindings/power/r8a77965-sysc.h	2017-12-20 10:53:35.430607110 +0900
@@ -0,0 +1,31 @@
+/*
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A77965_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A77965_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A77965_PD_CA57_CPU0		 0
+#define R8A77965_PD_CA57_CPU1		 1
+#define R8A77965_PD_A3VP		 9
+#define R8A77965_PD_CA57_SCU		12
+#define R8A77965_PD_CR7			13
+#define R8A77965_PD_A3VC		14
+#define R8A77965_PD_3DG_A		17
+#define R8A77965_PD_3DG_B		18
+#define R8A77965_PD_A3IR		24
+#define R8A77965_PD_A2VC1		26
+
+/* Always-on power area */
+#define R8A77965_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A77965_SYSC_H__ */
