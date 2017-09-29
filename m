Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34793 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751906AbdI2LzK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:55:10 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 42/48] ARM: dts: r8a7743: Add QSPI support
Date: Fri, 29 Sep 2017 13:53:34 +0200
Message-Id: <450c03718e971880ae067dc5f94a86f961acd6c3.1506683482.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506683482.git.horms+renesas@verge.net.au>
References: <cover.1506683482.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Add the DT node for the QSPI interface to the SoC dtsi.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7743.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 266c5eca9f74..454f98060d6f 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -28,6 +28,7 @@
 		i2c6 = &iic0;
 		i2c7 = &iic1;
 		i2c8 = &iic3;
+		spi0 = &qspi;
 	};
 
 	cpus {
@@ -835,6 +836,22 @@
 			status = "disabled";
 		};
 
+		qspi: spi@e6b10000 {
+			compatible = "renesas,qspi-r8a7743", "renesas,qspi";
+			reg = <0 0xe6b10000 0 0x2c>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			dmas = <&dmac0 0x17>, <&dmac0 0x18>,
+			       <&dmac1 0x17>, <&dmac1 0x18>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 917>;
+			status = "disabled";
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a7743";
 			reg = <0 0xee100000 0 0x328>;
-- 
2.1.4
