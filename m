Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:39544 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751301AbdKTPqn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2017 10:46:43 -0500
Received: by mail-wm0-f67.google.com with SMTP id x63so7002758wmf.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2017 07:46:42 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
Cc: wsa@the-dreams.de, Chris.Paterson2@renesas.com,
        magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 1/3] arm64: dts: r8a77995: add SYS-DMAC nodes
Date: Mon, 20 Nov 2017 16:46:34 +0100
Message-Id: <1511192796-2268-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1511192796-2268-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1511192796-2268-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Differs from other Gen3 SoCs in that each controller only supports eight
channels.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 72 +++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 788e3af..04a392a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -155,6 +155,78 @@
 			resets = <&cpg 407>;
 		};
 
+		dmac0: dma-controller@e6700000 {
+			compatible = "renesas,dmac-r8a77995",
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
+				      GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7";
+			clocks = <&cpg CPG_MOD 219>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 219>;
+			#dma-cells = <1>;
+			dma-channels = <8>;
+		};
+
+		dmac1: dma-controller@e7300000 {
+			compatible = "renesas,dmac-r8a77995",
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
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7";
+			clocks = <&cpg CPG_MOD 218>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 218>;
+			#dma-cells = <1>;
+			dma-channels = <8>;
+		};
+
+		dmac2: dma-controller@e7310000 {
+			compatible = "renesas,dmac-r8a77995",
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
+				      GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7";
+			clocks = <&cpg CPG_MOD 217>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 217>;
+			#dma-cells = <1>;
+			dma-channels = <8>;
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a77995",
 				     "renesas,rcar-gen3-gpio",
-- 
2.7.4
