Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56197 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752607AbcHQLcY (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 17 Aug 2016 07:32:24 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RTF 5/7] arm64: dts: r8a7796: Add GPIO device nodes
Date: Wed, 17 Aug 2016 13:31:54 +0200
Message-Id: <1471433516-4478-6-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1471433516-4478-1-git-send-email-horms+renesas@verge.net.au>
References: <1471433516-4478-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Add GPIO device nodes to the DT of the r8a7796 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 112 +++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index faea5a960abc..2741535f8b15 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -107,6 +107,118 @@
 			status = "disabled";
 		};
 
+		gpio0: gpio@e6050000 {
+			compatible = "renesas,gpio-r8a7796",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6050000 0 0x50>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 0 16>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 912>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+		};
+
+		gpio1: gpio@e6051000 {
+			compatible = "renesas,gpio-r8a7796",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6051000 0 0x50>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 32 29>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 911>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+		};
+
+		gpio2: gpio@e6052000 {
+			compatible = "renesas,gpio-r8a7796",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6052000 0 0x50>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 64 15>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 910>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+		};
+
+		gpio3: gpio@e6053000 {
+			compatible = "renesas,gpio-r8a7796",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6053000 0 0x50>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 96 16>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 909>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+		};
+
+		gpio4: gpio@e6054000 {
+			compatible = "renesas,gpio-r8a7796",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6054000 0 0x50>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 128 18>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 908>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+		};
+
+		gpio5: gpio@e6055000 {
+			compatible = "renesas,gpio-r8a7796",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6055000 0 0x50>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 160 26>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 907>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+		};
+
+		gpio6: gpio@e6055400 {
+			compatible = "renesas,gpio-r8a7796",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6055400 0 0x50>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 192 32>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 906>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+		};
+
+		gpio7: gpio@e6055800 {
+			compatible = "renesas,gpio-r8a7796",
+				     "renesas,gpio-rcar";
+			reg = <0 0xe6055800 0 0x50>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 224 4>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 905>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+		};
+
 		pfc: pfc@e6060000 {
 			compatible = "renesas,pfc-r8a7796";
 			reg = <0 0xe6060000 0 0x50c>;
-- 
2.7.0.rc3.207.g0ac5344
