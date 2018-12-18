Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14B7C43444
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 17:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3D25217D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 17:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbeLRRGI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 12:06:08 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:13316 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726910AbeLRRGI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 12:06:08 -0500
X-IronPort-AV: E=Sophos;i="5.56,368,1539615600"; 
   d="scan'208";a="2958186"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Dec 2018 02:06:04 +0900
Received: from rtamta01.rta.renesas.com (transport.eroom.renesas.com [143.103.48.75])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7A1A94016D76;
        Wed, 19 Dec 2018 02:06:04 +0900 (JST)
Received: from ubuntu.localdomain (unknown [143.103.58.94])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id 8D23D1AD;
        Tue, 18 Dec 2018 17:06:03 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v4 1/2] ARM: dts: r7s9210: Initial SoC device tree
Date:   Tue, 18 Dec 2018 12:05:54 -0500
Message-Id: <20181218170555.121673-2-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181218170555.121673-1-chris.brandt@renesas.com>
References: <20181218170555.121673-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Basic support for the RZ/A2 (R7S9210) SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v3:
 * Put all peripherals under soc "simple-bus" node
 * Sorted all nodes by physical addresses
v2:
 * Fixed cpg node name to match reg address
 * Removed the clocks subnode
 * SCIF register range 18 to 0x18
 * Removed 'reset-cells' from cpg because resets not supported (yet?)
 * Sorted nodes by address (per group of device
---
 arch/arm/boot/dts/r7s9210.dtsi | 218 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 218 insertions(+)
 create mode 100644 arch/arm/boot/dts/r7s9210.dtsi

diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
new file mode 100644
index 000000000000..22baa96f5974
--- /dev/null
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the R7S9210 SoC
+ *
+ * Copyright (C) 2018 Renesas Electronics Corporation
+ *
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/r7s9210-cpg-mssr.h>
+
+/ {
+	compatible = "renesas,r7s9210";
+	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/* External clocks */
+	extal_clk: extal {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		/* Value must be set by board */
+		clock-frequency = <0>;
+	};
+
+	rtc_x1_clk: rtc_x1 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		/* If clk present, value (32678) must be set by board */
+		clock-frequency = <0>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <0>;
+			clock-frequency = <528000000>;
+			next-level-cache = <&L2>;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		L2: cache-controller@1f003000 {
+			compatible = "arm,pl310-cache";
+			reg = <0x1f003000 0x1000>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			arm,early-bresp-disable;
+			arm,full-line-zero-disable;
+			cache-unified;
+			cache-level = <2>;
+		};
+
+		scif0: serial@e8007000 {
+			compatible = "renesas,scif-r7s9210";
+			reg = <0xe8007000 0x18>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD 47>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		scif1: serial@e8007800 {
+			compatible = "renesas,scif-r7s9210";
+			reg = <0xe8007800 0x18>;
+			interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD 46>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		scif2: serial@e8008000 {
+			compatible = "renesas,scif-r7s9210";
+			reg = <0xe8008000 0x18>;
+			interrupts = <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD 45>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		scif3: serial@e8008800 {
+			compatible = "renesas,scif-r7s9210";
+			reg = <0xe8008800 0x18>;
+			interrupts = <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD 44>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		scif4: serial@e8009000 {
+			compatible = "renesas,scif-r7s9210";
+			reg = <0xe8009000 0x18>;
+			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD 43>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm0: timer@e803b000 {
+			compatible = "renesas,r7s9210-ostm", "renesas,ostm";
+			reg = <0xe803b000 0x30>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 36>;
+			clock-names = "ostm0";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm1: timer@e803c000 {
+			compatible = "renesas,r7s9210-ostm", "renesas,ostm";
+			reg = <0xe803c000 0x30>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 35>;
+			clock-names = "ostm1";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm2: timer@e803d000 {
+			compatible = "renesas,r7s9210-ostm", "renesas,ostm";
+			reg = <0xe803d000 0x30>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 34>;
+			clock-names = "ostm2";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@e8221000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0xe8221000 0x1000>,
+			      <0xe8222000 0x1000>;
+		};
+
+		cpg: clock-controller@fcfe0010 {
+			compatible = "renesas,r7s9210-cpg-mssr";
+			reg = <0xfcfe0010 0x455>;
+			clocks = <&extal_clk>;
+			clock-names = "extal";
+			#clock-cells = <2>;
+			#power-domain-cells = <0>;
+		};
+
+		wdt: watchdog@fcfe7000 {
+			compatible = "renesas,r7s9210-wdt", "renesas,rza-wdt";
+			reg = <0xfcfe7000 0x26>;
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R7S9210_CLK_P0>;
+		};
+
+		bsid: chipid@fcfe8004 {
+			compatible = "renesas,bsid";
+			reg = <0xfcfe8004 4>;
+		};
+
+		pinctrl: pin-controller@fcffe000 {
+			compatible = "renesas,r7s9210-pinctrl";
+			reg = <0xfcffe000 0x1000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 176>;
+		};
+	};
+};
-- 
2.16.1

