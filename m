Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E759CC169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8BFB20863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="IgrzmjkS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbfBHLOf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:14:35 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46395 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLOf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:14:35 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 75BBA25BF16;
        Fri,  8 Feb 2019 22:14:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624459; bh=BUxNtVRoMGIhJ1aMgQNK/FSCnfMroFvEmZHYPQiAHBs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IgrzmjkSYjOHBQJ4gVvPXswd6SBOGXXJZLK9RAf6EPoy7MUuo16bsM8A28cly/pRs
         DBIzA9JheSa6f63hJSCp4FG0AFuMpN4zCNpAPe2Y1p8d9Ao7iCSTJ9Egcw8hixyR8o
         aJWKZJfRx5FMfzkyHqP/O1FweMm1jieHcUWDe6x8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DBE5C940974; Fri,  8 Feb 2019 12:14:15 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 09/12] ARM: dts: r7s9210: Initial SoC device tree
Date:   Fri,  8 Feb 2019 12:14:10 +0100
Message-Id: <bbbcd02b825529076951a37ee632cdb33df414c7.1549623128.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549623128.git.horms+renesas@verge.net.au>
References: <cover.1549623128.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Chris Brandt <chris.brandt@renesas.com>

Basic support for the RZ/A2 (R7S9210) SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
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
2.11.0

