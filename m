Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:38625 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751470AbdILVFc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 17:05:32 -0400
Received: by mail-lf0-f52.google.com with SMTP id q132so29471661lfe.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Sep 2017 14:05:31 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170912210527.851901553@cogentembedded.com>
Date: Tue, 12 Sep 2017 23:37:22 +0300
To: Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 06/11] arm64: dts: renesas: r8a77970: add SYS-DMAC support
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=arm64-dts-renesas-r8a77970-add-SYS-DMAC-support.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe SYS-DMAC1/2 in the R8A77970 device tree.

Based on the original (and large) patch by Daisuke Matsushita
<daisuke.matsushita.ns@hitachi.com>.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi |   48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -122,5 +122,53 @@
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
 		};
+
+		dmac1: dma-controller@e7300000 {
+			compatible = "renesas,dmac-r8a77970",
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
+				      GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7";
+			clocks = <&cpg CPG_MOD 218>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 218>;
+			#dma-cells = <1>;
+			dma-channels = <8>;
+		};
+
+		dmac2: dma-controller@e7310000 {
+			compatible = "renesas,dmac-r8a77970",
+				     "renesas,rcar-dmac";
+			reg = <0 0xe7310000 0 0x10000>;
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7";
+			clocks = <&cpg CPG_MOD 217>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 217>;
+			#dma-cells = <1>;
+			dma-channels = <8>;
+		};
 	};
 };
