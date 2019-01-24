Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442A6C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:12:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B9392184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:12:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="DlSryEFg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbfAXPMs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:12:48 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbfAXPMs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:12:48 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 45BAE25BECF;
        Fri, 25 Jan 2019 02:12:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342761; bh=fmiffVHlP9nOaNb2Yv5xxeRdwtdBWrXMNldhrkbQlDY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DlSryEFgas5IK/Lp3ClHs4NVWnT7B2ynQC5RHrEJd9FKtJFaoUJV/B4NpxS/ArhLr
         aKkj0cbM5UJBJAVz03M0hPrOqzw0oRdWTk8TN4pl/pcmEwShb4VkOBarzuKD7Ag6b/
         E70wdxbhAkY6OMVcROf7ptJiSCYWricHw9JLZSYU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6568F940793; Thu, 24 Jan 2019 16:12:39 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 04/44] arm64: dts: renesas: Initial device tree for r8a774c0
Date:   Thu, 24 Jan 2019 16:11:58 +0100
Message-Id: <c257628dcdcc2b0f40ccbc127554f18c272e7f2d.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Basic support for the RZ/G2E SoC (a.k.a. r8a774c0).

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 186 ++++++++++++++++++++++++++++++
 1 file changed, 186 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
new file mode 100644
index 000000000000..f425d0b3a31b
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZ/G2E (R8A774C0) SoC
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/clock/r8a774c0-cpg-mssr.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/r8a774c0-sysc.h>
+
+/ {
+	compatible = "renesas,r8a774c0";
+	#address-cells = <2>;
+	#size-cells = <2>;
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
+
+	audio_clk_b: audio_clk_b {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	audio_clk_c: audio_clk_c {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	/* External CAN clock - to be overridden by boards that provide it */
+	can_clk: can {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* 1 core only at this point */
+		a53_0: cpu@0 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774C0_PD_CA53_CPU0>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+		};
+
+		L2_CA53: cache-controller-0 {
+			compatible = "cache";
+			power-domains = <&sysc R8A774C0_PD_CA53_SCU>;
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
+	/* External PCIe clock - can be overridden by the board */
+	pcie_bus_clk: pcie_bus {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	pmu_a53 {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&a53_0>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	/* External SCIF clock - to be overridden by boards that provide it */
+	scif_clk: scif {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cpg: clock-controller@e6150000 {
+			compatible = "renesas,r8a774c0-cpg-mssr";
+			reg = <0 0xe6150000 0 0x1000>;
+			clocks = <&extal_clk>;
+			clock-names = "extal";
+			#clock-cells = <2>;
+			#power-domain-cells = <0>;
+			#reset-cells = <1>;
+		};
+
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a774c0-rst";
+			reg = <0 0xe6160000 0 0x0200>;
+		};
+
+		sysc: system-controller@e6180000 {
+			compatible = "renesas,r8a774c0-sysc";
+			reg = <0 0xe6180000 0 0x0400>;
+			#power-domain-cells = <1>;
+		};
+
+		scif2: serial@e6e88000 {
+			compatible = "renesas,scif-r8a774c0",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6e88000 0 64>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 310>,
+				 <&cpg CPG_CORE R8A774C0_CLK_S3D1C>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
+			resets = <&cpg 310>;
+			status = "disabled";
+		};
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
+			clocks = <&cpg CPG_MOD 408>;
+			clock-names = "clk";
+			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
+			resets = <&cpg 408>;
+		};
+
+		prr: chipid@fff00044 {
+			compatible = "renesas,prr";
+			reg = <0 0xfff00044 0 4>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	/* External USB clocks - can be overridden by the board */
+	usb3s0_clk: usb3s0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	usb_extal_clk: usb_extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+};
-- 
2.11.0

