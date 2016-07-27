Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:35604 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758039AbcG0VCW (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Jul 2016 17:02:22 -0400
Received: by mail-lf0-f49.google.com with SMTP id f93so35976951lfi.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jul 2016 14:02:21 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/6] ARM: dts: r8a7794: add Audio-DMAC support
Date: Thu, 28 Jul 2016 00:02:18 +0300
Message-ID: <6419837.qqlciQTB8q@wasted.cogentembedded.com>
In-Reply-To: <3910788.ckTpUWEs6B@wasted.cogentembedded.com>
References: <3910788.ckTpUWEs6B@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe Audio-DMAC in the R8A7794 device tree.

This patch is loosely based on the commit 8994fff67761 ("ARM: shmobile:
r8a7791: Add Audio DMAC devices to DT").

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 4:
- refreshed the patch.

Changes in version 3:
- refreshed the patch.

 arch/arm/boot/dts/r8a7794.dtsi |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
+++ renesas/arch/arm/boot/dts/r8a7794.dtsi
@@ -296,6 +296,34 @@
 		dma-channels = <15>;
 	};
 
+	audma0: dma-controller@ec700000 {
+		compatible = "renesas,dmac-r8a7794", "renesas,rcar-dmac";
+		reg = <0 0xec700000 0 0x10000>;
+		interrupts =	<GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
+				 GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "error",
+				  "ch0", "ch1", "ch2", "ch3", "ch4", "ch5",
+				  "ch6", "ch7", "ch8", "ch9", "ch10", "ch11",
+				  "ch12";
+		clocks = <&mstp5_clks R8A7794_CLK_AUDIO_DMAC0>;
+		clock-names = "fck";
+		power-domains = <&cpg_clocks>;
+		#dma-cells = <1>;
+		dma-channels = <13>;
+	};
+
 	scifa0: serial@e6c40000 {
 		compatible = "renesas,scifa-r8a7794",
 			     "renesas,rcar-gen2-scifa", "renesas,scifa";
