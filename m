Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:37374 "EHLO
        mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760919AbdKRDsl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2017 22:48:41 -0500
Received: by mail-pf0-f172.google.com with SMTP id t69so3340176pfg.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2017 19:48:40 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, takeshi.kihara.df@renesas.com
Date: Sat, 18 Nov 2017 12:47:09 +0900
Message-Id: <151097682972.24214.12026497447985739664.sendpatchset@little-apple>
Subject: [PATCH/RFC] arm64: r8a77965 Salvator-X SoC/board support prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Here's a simple prototype hack to get the R-Car M3-N SoC working with
the r8a77965 Salvator-X that is available in my remote access rack.

This code will allow me to test and development IPMMU features on
latest mainline together with new hardware such as r8a77965.

As base the most recent renesas-drivers release is used, and since the
regular tag is optimized for stability and lacking various -next trees
this code is based on "renesas-drivers-next-2017-11-14-v4.14".

The following patches are picked from renesas-bsp @ kernel.org and
in particular the recent "rcar-3.5.9.rc2" release:

dca5c4d1adc6 arm64: renesas: Add Renesas R8A77965 Kconfig support
6f3c0086b8b2 soc: renesas: identify R-Car M3N
711dec8fc1df soc: renesas: rcar-rst: Add R8A77965 support (*)
c8418d81dd26 clk: renesas: Add r8a77965 CPG Core Clock Definitions
d642ad7d1a40 clk: renesas: cpg-mssr: Add support for R-Car M3N (*)
4cec6dcde2f5 arm64: dts: r8a77965: Add Renesas R8A77965 SoC support (*)
92be4952a4d5 arm64: dts: r8a77965-salvator-x: Add Salvator-X board on R8A77965 SoC support (*)
1c69363cc1eb arm64: dts: r8a77965-salvator-x: Add reserved memory regions

Commits above original author is Kihara-san:
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Commits marked with (*) above have been updated to fit on upstream

Since this is prototype code and not suitable for mainline merge as-is:
Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Documentation/devicetree/bindings/arm/shmobile.txt           |    4 
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt |    5 
 arch/arm64/Kconfig.platforms                                 |    6 
 arch/arm64/boot/dts/renesas/Makefile                         |    1 
 arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts          |   79 ++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi                    |  141 +++++++
 drivers/clk/renesas/Kconfig                                  |    5 
 drivers/clk/renesas/Makefile                                 |    1 
 drivers/clk/renesas/r8a77965-cpg-mssr.c                      |  195 ++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c                       |    6 
 drivers/clk/renesas/renesas-cpg-mssr.h                       |    1 
 drivers/soc/renesas/Kconfig                                  |    4 
 drivers/soc/renesas/rcar-rst.c                               |    1 
 drivers/soc/renesas/renesas-soc.c                            |    8 
 include/dt-bindings/clock/r8a77965-cpg-mssr.h                |   66 +++
 15 files changed, 519 insertions(+), 4 deletions(-)

--- 0001/Documentation/devicetree/bindings/arm/shmobile.txt
+++ work/Documentation/devicetree/bindings/arm/shmobile.txt	2017-11-18 12:31:14.510607110 +0900
@@ -39,6 +39,8 @@ SoCs:
     compatible = "renesas,r8a7795"
   - R-Car M3-W (R8A77960)
     compatible = "renesas,r8a7796"
+  - R-Car M3-N (R8A77965)
+    compatible = "renesas,r8a77965"
   - R-Car V3M (R8A77970)
     compatible = "renesas,r8a77970"
   - R-Car D3 (R8A77995)
@@ -102,6 +104,8 @@ Boards:
     compatible = "renesas,salvator-x", "renesas,r8a7795"
   - Salvator-X (RTP0RC7796SIPB0011S)
     compatible = "renesas,salvator-x", "renesas,r8a7796"
+  - Salvator-X (RTP0RC7796SIPB0011S (M3-N))
+    compatible = "renesas,salvator-x", "renesas,r8a77965"
   - Salvator-XS (Salvator-X 2nd version, RTP0RC7795SIPB0012S)
     compatible = "renesas,salvator-xs", "renesas,r8a7795"
   - Salvator-XS (Salvator-X 2nd version, RTP0RC7796SIPB0012S)
--- 0001/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ work/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt	2017-11-18 12:31:14.510607110 +0900
@@ -22,6 +22,7 @@ Required Properties:
       - "renesas,r8a7794-cpg-mssr" for the r8a7794 SoC (R-Car E2)
       - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC (R-Car H3)
       - "renesas,r8a7796-cpg-mssr" for the r8a7796 SoC (R-Car M3-W)
+      - "renesas,r8a77965-cpg-mssr" for the r8a77965 SoC (R-Car M3-N)
       - "renesas,r8a77970-cpg-mssr" for the r8a77970 SoC (R-Car V3M)
       - "renesas,r8a77995-cpg-mssr" for the r8a77995 SoC (R-Car D3)
 
@@ -32,8 +33,8 @@ Required Properties:
     clock-names
   - clock-names: List of external parent clock names. Valid names are:
       - "extal" (r8a7743, r8a7745, r8a7790, r8a7791, r8a7792, r8a7793, r8a7794,
-		 r8a7795, r8a7796, r8a77970, r8a77995)
-      - "extalr" (r8a7795, r8a7796, r8a77970)
+		 r8a7795, r8a7796, r8a77965, r8a77970, r8a77995)
+      - "extalr" (r8a7795, r8a7796, r8a77965, r8a77970)
       - "usb_extal" (r8a7743, r8a7745, r8a7790, r8a7791, r8a7793, r8a7794)
 
   - #clock-cells: Must be 2
--- 0001/arch/arm64/Kconfig.platforms
+++ work/arch/arm64/Kconfig.platforms	2017-11-18 12:31:14.510607110 +0900
@@ -198,6 +198,12 @@ config ARCH_R8A77995
 	help
 	  This enables support for the Renesas R-Car D3 SoC.
 
+config ARCH_R8A77965
+	bool "Renesas R-Car M3N SoC Platform"
+	depends on ARCH_RENESAS
+	help
+	  This enables support for the Renesas R-Car M3N SoC.
+
 config ARCH_STRATIX10
 	bool "Altera's Stratix 10 SoCFPGA Family"
 	help
--- 0001/arch/arm64/boot/dts/renesas/Makefile
+++ work/arch/arm64/boot/dts/renesas/Makefile	2017-11-18 12:31:14.510607110 +0900
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-m3ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb
 dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
 
--- /dev/null
+++ work/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts	2017-11-18 12:31:15.540607110 +0900
@@ -0,0 +1,79 @@
+/*
+ * Device Tree Source for the Salvator-X board
+ *
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "r8a77965.dtsi"
+
+/ {
+	model = "Renesas Salvator-X board based on r8a77965";
+	compatible = "renesas,salvator-x", "renesas,r8a77965";
+
+	aliases {
+		serial0 = &scif2;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* device specific region for Lossy Decompression */
+		lossy_decompress: linux,lossy_decompress {
+			no-map;
+			reg = <0x00000000 0x54000000 0x0 0x03000000>;
+		};
+
+		/* For Audio DSP */
+		adsp_reserved: linux,adsp {
+			compatible = "shared-dma-pool";
+			reusable;
+			reg = <0x00000000 0x57000000 0x0 0x01000000>;
+		};
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			reg = <0x00000000 0x58000000 0x0 0x18000000>;
+			linux,cma-default;
+		};
+
+		/* device specific region for contiguous allocations */
+		mmp_reserved: linux,multimedia {
+			compatible = "shared-dma-pool";
+			reusable;
+			reg = <0x00000000 0x70000000 0x0 0x10000000>;
+		};
+	};
+};
+
+&extal_clk {
+	clock-frequency = <16666666>;
+};
+
+&scif2 {
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <14745600>;
+	status = "okay";
+};
--- /dev/null
+++ work/arch/arm64/boot/dts/renesas/r8a77965.dtsi	2017-11-18 12:31:15.530607110 +0900
@@ -0,0 +1,141 @@
+/*
+ * Device Tree Source for the r8a77965 SoC
+ *
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+#include <dt-bindings/clock/r8a77965-cpg-mssr.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "renesas,r8a77965";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* 1 core only at this point */
+		a57_0: cpu@0 {
+			compatible = "arm,cortex-a57", "arm,armv8";
+			reg = <0x0>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA57>;
+			enable-method = "psci";
+		};
+
+		L2_CA57: cache-controller@0 {
+			compatible = "cache";
+			reg = <0>;
+			cache-unified;
+			cache-level = <2>;
+		};
+	};
+
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	extalr_clk: extalr {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	/* External SCIF clock - to be overridden by boards that provide it */
+	scif_clk: scif {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic: interrupt-controller@f1010000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x0 0xf1010000 0 0x1000>,
+			      <0x0 0xf1020000 0 0x20000>,
+			      <0x0 0xf1040000 0 0x20000>,
+			      <0x0 0xf1060000 0 0x20000>;
+			interrupts = <GIC_PPI 9
+					(GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
+		};
+
+		timer {
+			compatible = "arm,armv8-timer";
+			interrupts = <GIC_PPI 13
+					(GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 14
+					(GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 11
+					(GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 10
+					(GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+		};
+
+		pmu_a57 {
+			compatible = "arm,cortex-a57-pmu";
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-affinity = <&a57_0>;
+		};
+
+		cpg: clock-controller@e6150000 {
+			compatible = "renesas,r8a77965-cpg-mssr";
+			reg = <0 0xe6150000 0 0x1000>;
+			clocks = <&extal_clk>, <&extalr_clk>;
+			clock-names = "extal", "extalr";
+			#clock-cells = <2>;
+			#power-domain-cells = <0>;
+		};
+
+		prr: chipid@fff00044 {
+			compatible = "renesas,prr";
+			reg = <0 0xfff00044 0 4>;
+		};
+
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a77965-rst";
+			reg = <0 0xe6160000 0 0x0200>;
+		};
+
+		sysc: system-controller@e6180000 {
+			compatible = "renesas,r8a77965-sysc";
+			reg = <0 0xe6180000 0 0x0400>;
+			#power-domain-cells = <1>;
+		};
+
+		scif2: serial@e6e88000 {
+			compatible = "renesas,scif-r8a77965",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6e88000 0 64>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 310>,
+				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+	};
+};
--- 0001/drivers/clk/renesas/Kconfig
+++ work/drivers/clk/renesas/Kconfig	2017-11-18 12:31:14.510607110 +0900
@@ -15,6 +15,7 @@ config CLK_RENESAS
 	select CLK_R8A7794 if ARCH_R8A7794
 	select CLK_R8A7795 if ARCH_R8A7795
 	select CLK_R8A7796 if ARCH_R8A7796
+	select CLK_R8A77965 if ARCH_R8A77965
 	select CLK_R8A77970 if ARCH_R8A77970
 	select CLK_R8A77995 if ARCH_R8A77995
 	select CLK_SH73A0 if ARCH_SH73A0
@@ -96,6 +97,10 @@ config CLK_R8A7796
 	bool "R-Car M3-W clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
 
+config CLK_R8A77965
+	bool "R-Car M3-N clock support" if COMPILE_TEST
+	select CLK_RCAR_GEN3_CPG
+
 config CLK_R8A77970
 	bool "R-Car V3M clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
--- 0001/drivers/clk/renesas/Makefile
+++ work/drivers/clk/renesas/Makefile	2017-11-18 12:31:14.510607110 +0900
@@ -14,6 +14,7 @@ obj-$(CONFIG_CLK_R8A7792)		+= r8a7792-cp
 obj-$(CONFIG_CLK_R8A7794)		+= r8a7794-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7795)		+= r8a7795-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7796)		+= r8a7796-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A77965)		+= r8a77965-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77970)		+= r8a77970-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77995)		+= r8a77995-cpg-mssr.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
--- /dev/null
+++ work/drivers/clk/renesas/r8a77965-cpg-mssr.c	2017-11-18 12:31:15.560607110 +0900
@@ -0,0 +1,195 @@
+/*
+ * r8a77965 Clock Pulse Generator / Module Standby and Software Reset
+ *
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ *
+ * Based on r8a7796-cpg-mssr.c
+ *
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ * Copyright (C) 2016 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/soc/renesas/rcar-rst.h>
+
+#include <dt-bindings/clock/r8a77965-cpg-mssr.h>
+
+#include "renesas-cpg-mssr.h"
+#include "rcar-gen3-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R8A77965_CLK_OSC,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_EXTALR,
+
+	/* Internal Core Clocks */
+	CLK_MAIN,
+	CLK_PLL0,
+	CLK_PLL1,
+	CLK_PLL3,
+	CLK_PLL4,
+	CLK_PLL1_DIV2,
+	CLK_PLL1_DIV4,
+	CLK_S0,
+	CLK_S1,
+	CLK_S2,
+	CLK_S3,
+	CLK_SDSRC,
+	CLK_SSPSRC,
+
+	/* Module Clocks */
+	MOD_CLK_BASE
+};
+
+static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",  CLK_EXTAL),
+	DEF_INPUT("extalr", CLK_EXTALR),
+
+	/* Internal Core Clocks */
+	DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_GEN3_MAIN, CLK_EXTAL),
+	DEF_BASE(".pll0",       CLK_PLL0, CLK_TYPE_GEN3_PLL0, CLK_MAIN),
+	DEF_BASE(".pll1",       CLK_PLL1, CLK_TYPE_GEN3_PLL1, CLK_MAIN),
+	DEF_BASE(".pll3",       CLK_PLL3, CLK_TYPE_GEN3_PLL3, CLK_MAIN),
+	DEF_BASE(".pll4",       CLK_PLL4, CLK_TYPE_GEN3_PLL4, CLK_MAIN),
+
+	DEF_FIXED(".pll1_div2", CLK_PLL1_DIV2,     CLK_PLL1,       2, 1),
+	DEF_FIXED(".pll1_div4", CLK_PLL1_DIV4,     CLK_PLL1_DIV2,  2, 1),
+	DEF_FIXED(".s0",        CLK_S0,            CLK_PLL1_DIV2,  2, 1),
+	DEF_FIXED(".s1",        CLK_S1,            CLK_PLL1_DIV2,  3, 1),
+	DEF_FIXED(".s2",        CLK_S2,            CLK_PLL1_DIV2,  4, 1),
+	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
+
+	/* Core Clock Outputs */
+	DEF_FIXED("ztr",        R8A77965_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
+	DEF_FIXED("ztrd2",      R8A77965_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
+	DEF_FIXED("zt",         R8A77965_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
+	DEF_FIXED("zx",         R8A77965_CLK_ZX,    CLK_PLL1_DIV2,  2, 1),
+	DEF_FIXED("s0d1",       R8A77965_CLK_S0D1,  CLK_S0,         1, 1),
+	DEF_FIXED("s0d2",       R8A77965_CLK_S0D2,  CLK_S0,         2, 1),
+	DEF_FIXED("s0d3",       R8A77965_CLK_S0D3,  CLK_S0,         3, 1),
+	DEF_FIXED("s0d4",       R8A77965_CLK_S0D4,  CLK_S0,         4, 1),
+	DEF_FIXED("s0d6",       R8A77965_CLK_S0D6,  CLK_S0,         6, 1),
+	DEF_FIXED("s0d8",       R8A77965_CLK_S0D8,  CLK_S0,         8, 1),
+	DEF_FIXED("s0d12",      R8A77965_CLK_S0D12, CLK_S0,        12, 1),
+	DEF_FIXED("s1d1",       R8A77965_CLK_S1D1,  CLK_S1,         1, 1),
+	DEF_FIXED("s1d2",       R8A77965_CLK_S1D2,  CLK_S1,         2, 1),
+	DEF_FIXED("s1d4",       R8A77965_CLK_S1D4,  CLK_S1,         4, 1),
+	DEF_FIXED("s2d1",       R8A77965_CLK_S2D1,  CLK_S2,         1, 1),
+	DEF_FIXED("s2d2",       R8A77965_CLK_S2D2,  CLK_S2,         2, 1),
+	DEF_FIXED("s2d4",       R8A77965_CLK_S2D4,  CLK_S2,         4, 1),
+	DEF_FIXED("s3d1",       R8A77965_CLK_S3D1,  CLK_S3,         1, 1),
+	DEF_FIXED("s3d2",       R8A77965_CLK_S3D2,  CLK_S3,         2, 1),
+	DEF_FIXED("s3d4",       R8A77965_CLK_S3D4,  CLK_S3,         4, 1),
+
+	DEF_FIXED("cl",         R8A77965_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
+	DEF_FIXED("cp",         R8A77965_CLK_CP,    CLK_EXTAL,      2, 1),
+};
+
+static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
+	DEF_MOD("scif2",		 310,	R8A77965_CLK_S3D4),
+	DEF_MOD("intc-ap",		 408,	R8A77965_CLK_S3D1),
+};
+
+static const unsigned int r8a77965_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
+};
+
+/*
+ * CPG Clock Data
+ */
+
+/*
+ *   MD		EXTAL		PLL0	PLL1	PLL3	PLL4
+ * 14 13 19 17	(MHz)
+ *-----------------------------------------------------------
+ * 0  0  0  0	16.66 x 1	x180	x192	x192	x144
+ * 0  0  0  1	16.66 x 1	x180	x192	x128	x144
+ * 0  0  1  0	Prohibited setting
+ * 0  0  1  1	16.66 x 1	x180	x192	x192	x144
+ * 0  1  0  0	20    x 1	x150	x160	x160	x120
+ * 0  1  0  1	20    x 1	x150	x160	x106	x120
+ * 0  1  1  0	Prohibited setting
+ * 0  1  1  1	20    x 1	x150	x160	x160	x120
+ * 1  0  0  0	25    x 1	x120	x128	x128	x96
+ * 1  0  0  1	25    x 1	x120	x128	x84	x96
+ * 1  0  1  0	Prohibited setting
+ * 1  0  1  1	25    x 1	x120	x128	x128	x96
+ * 1  1  0  0	33.33 / 2	x180	x192	x192	x144
+ * 1  1  0  1	33.33 / 2	x180	x192	x128	x144
+ * 1  1  1  0	Prohibited setting
+ * 1  1  1  1	33.33 / 2	x180	x192	x192	x144
+ */
+#define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 11) | \
+					 (((md) & BIT(13)) >> 11) | \
+					 (((md) & BIT(19)) >> 18) | \
+					 (((md) & BIT(17)) >> 17))
+
+static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
+	/* EXTAL div	PLL1 mult	PLL3 mult */
+	{ 1,		192,		192,	},
+	{ 1,		192,		128,	},
+	{ 0, /* Prohibited setting */		},
+	{ 1,		192,		192,	},
+	{ 1,		160,		160,	},
+	{ 1,		160,		106,	},
+	{ 0, /* Prohibited setting */		},
+	{ 1,		160,		160,	},
+	{ 1,		128,		128,	},
+	{ 1,		128,		84,	},
+	{ 0, /* Prohibited setting */		},
+	{ 1,		128,		128,	},
+	{ 2,		192,		192,	},
+	{ 2,		192,		128,	},
+	{ 0, /* Prohibited setting */		},
+	{ 2,		192,		192,	},
+};
+
+static int __init r8a77965_cpg_mssr_init(struct device *dev)
+{
+	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
+	u32 cpg_mode;
+	int error;
+
+	error = rcar_rst_read_mode_pins(&cpg_mode);
+	if (error)
+		return error;
+
+	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
+	if (!cpg_pll_config->extal_div) {
+		dev_err(dev, "Prohibited setting (cpg_mode=0x%x)\n", cpg_mode);
+		return -EINVAL;
+	}
+
+	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
+}
+
+const struct cpg_mssr_info r8a77965_cpg_mssr_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r8a77965_core_clks,
+	.num_core_clks = ARRAY_SIZE(r8a77965_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r8a77965_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r8a77965_mod_clks),
+	.num_hw_mod_clks = 12 * 32,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r8a77965_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r8a77965_crit_mod_clks),
+
+	/* Callbacks */
+	.init = r8a77965_cpg_mssr_init,
+	.cpg_clk_register = rcar_gen3_cpg_clk_register,
+};
--- 0001/drivers/clk/renesas/renesas-cpg-mssr.c
+++ work/drivers/clk/renesas/renesas-cpg-mssr.c	2017-11-18 12:31:14.510607110 +0900
@@ -705,6 +705,12 @@ static const struct of_device_id cpg_mss
 		.data = &r8a77995_cpg_mssr_info,
 	},
 #endif
+#ifdef CONFIG_ARCH_R8A77965
+	{
+		.compatible = "renesas,r8a77965-cpg-mssr",
+		.data = &r8a77965_cpg_mssr_info,
+	},
+#endif
 	{ /* sentinel */ }
 };
 
--- 0001/drivers/clk/renesas/renesas-cpg-mssr.h
+++ work/drivers/clk/renesas/renesas-cpg-mssr.h	2017-11-18 12:31:14.510607110 +0900
@@ -139,6 +139,7 @@ extern const struct cpg_mssr_info r8a779
 extern const struct cpg_mssr_info r8a7794_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7795_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7796_cpg_mssr_info;
+extern const struct cpg_mssr_info r8a77965_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77970_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77995_cpg_mssr_info;
 
--- 0001/drivers/soc/renesas/Kconfig
+++ work/drivers/soc/renesas/Kconfig	2017-11-18 12:31:14.510607110 +0900
@@ -3,8 +3,8 @@ config SOC_RENESAS
 	default y if ARCH_RENESAS
 	select SOC_BUS
 	select RST_RCAR if ARCH_RCAR_GEN1 || ARCH_RCAR_GEN2 || \
-			   ARCH_R8A7795 || ARCH_R8A7796 || ARCH_R8A77970 || \
-			   ARCH_R8A77995
+			   ARCH_R8A7795 || ARCH_R8A7796 || ARCH_R8A77965 || \
+			   ARCH_R8A77970 || ARCH_R8A77995
 	select SYSC_R8A7743 if ARCH_R8A7743
 	select SYSC_R8A7745 if ARCH_R8A7745
 	select SYSC_R8A7779 if ARCH_R8A7779
--- 0001/drivers/soc/renesas/rcar-rst.c
+++ work/drivers/soc/renesas/rcar-rst.c	2017-11-18 12:31:14.510607110 +0900
@@ -41,6 +41,7 @@ static const struct of_device_id rcar_rs
 	/* R-Car Gen3 is handled like R-Car Gen2 */
 	{ .compatible = "renesas,r8a7795-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a7796-rst", .data = &rcar_rst_gen2 },
+	{ .compatible = "renesas,r8a77965-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a77970-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a77995-rst", .data = &rcar_rst_gen2 },
 	{ /* sentinel */ }
--- 0001/drivers/soc/renesas/renesas-soc.c
+++ work/drivers/soc/renesas/renesas-soc.c	2017-11-18 12:31:14.510607110 +0900
@@ -154,6 +154,11 @@ static const struct renesas_soc soc_rcar
 	.id	= 0x58,
 };
 
+static const struct renesas_soc soc_rcar_m3_n __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen3,
+	.id	= 0x55,
+};
+
 static const struct renesas_soc soc_shmobile_ag5 __initconst __maybe_unused = {
 	.family	= &fam_shmobile,
 	.id	= 0x37,
@@ -215,6 +220,9 @@ static const struct of_device_id renesas
 #ifdef CONFIG_ARCH_R8A77995
 	{ .compatible = "renesas,r8a77995",	.data = &soc_rcar_d3 },
 #endif
+#ifdef CONFIG_ARCH_R8A77965
+	{ .compatible = "renesas,r8a77965",	.data = &soc_rcar_m3_n },
+#endif
 #ifdef CONFIG_ARCH_SH73A0
 	{ .compatible = "renesas,sh73a0",	.data = &soc_shmobile_ag5 },
 #endif
--- /dev/null
+++ work/include/dt-bindings/clock/r8a77965-cpg-mssr.h	2017-11-18 12:31:15.540607110 +0900
@@ -0,0 +1,66 @@
+/*
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A77965_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A77965_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a77965 CPG Core Clocks */
+#define R8A77965_CLK_Z			0
+#define R8A77965_CLK_ZR			1
+#define R8A77965_CLK_ZG			2
+#define R8A77965_CLK_ZTR		3
+#define R8A77965_CLK_ZTRD2		4
+#define R8A77965_CLK_ZT			5
+#define R8A77965_CLK_ZX			6
+#define R8A77965_CLK_S0D1		7
+#define R8A77965_CLK_S0D2		8
+#define R8A77965_CLK_S0D3		9
+#define R8A77965_CLK_S0D4		10
+#define R8A77965_CLK_S0D6		11
+#define R8A77965_CLK_S0D8		12
+#define R8A77965_CLK_S0D12		13
+#define R8A77965_CLK_S1D1		14
+#define R8A77965_CLK_S1D2		15
+#define R8A77965_CLK_S1D4		16
+#define R8A77965_CLK_S2D1		17
+#define R8A77965_CLK_S2D2		18
+#define R8A77965_CLK_S2D4		19
+#define R8A77965_CLK_S3D1		20
+#define R8A77965_CLK_S3D2		21
+#define R8A77965_CLK_S3D4		22
+#define R8A77965_CLK_LB			23
+#define R8A77965_CLK_CL			24
+#define R8A77965_CLK_ZB3		25
+#define R8A77965_CLK_ZB3D2		26
+#define R8A77965_CLK_CR			27
+#define R8A77965_CLK_CRD2		28
+#define R8A77965_CLK_SD0H		29
+#define R8A77965_CLK_SD0		30
+#define R8A77965_CLK_SD1H		31
+#define R8A77965_CLK_SD1		32
+#define R8A77965_CLK_SD2H		33
+#define R8A77965_CLK_SD2		34
+#define R8A77965_CLK_SD3H		35
+#define R8A77965_CLK_SD3		36
+#define R8A77965_CLK_SSP2		37
+#define R8A77965_CLK_SSP1		38
+#define R8A77965_CLK_SSPRS		39
+#define R8A77965_CLK_RPC		40
+#define R8A77965_CLK_RPCD2		41
+#define R8A77965_CLK_MSO		42
+#define R8A77965_CLK_CANFD		43
+#define R8A77965_CLK_HDMI		44
+#define R8A77965_CLK_CSI0		45
+#define R8A77965_CLK_CP			46
+#define R8A77965_CLK_CPEX		47
+#define R8A77965_CLK_R			48
+#define R8A77965_CLK_OSC		49
+
+#endif /* __DT_BINDINGS_CLOCK_R8A77965_CPG_MSSR_H__ */
