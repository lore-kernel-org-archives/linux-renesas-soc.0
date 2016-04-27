Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41654 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777AbcD0EGw (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 00:06:52 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Phil Edworthy <Phil.Edworthy@renesas.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/4] arm64: dts: r8a7795: Add PCIe nodes
Date: Wed, 27 Apr 2016 14:06:43 +1000
Message-Id: <9251024a6a148abd628785d53e3b7a42e8217cc9.1461723181.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1461723181.git.horms+renesas@verge.net.au>
References: <cover.1461723181.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Phil Edworthy <Phil.Edworthy@renesas.com>

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 57 ++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 868c10eaea48..11f9971a8543 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -131,6 +131,14 @@
 		status = "disabled";
 	};
 
+	/* External PCIe clock - can be overridden by the board */
+	pcie_bus_clk: pcie_bus {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		status = "disabled";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
@@ -1156,5 +1164,54 @@
 			power-domains = <&cpg>;
 			status = "disabled";
 		};
+		pciec0: pcie@fe000000 {
+			compatible = "renesas,pcie-r8a7795";
+			reg = <0 0xfe000000 0 0x80000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000
+				0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000
+				0x02000000 0 0x30000000 0 0x30000000 0 0x08000000
+				0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
+			/* Map all possible DDR as inbound ranges */
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
+			clock-names = "pcie", "pcie_bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		pciec1: pcie@ee800000 {
+			compatible = "renesas,pcie-r8a7795";
+			reg = <0 0xee800000 0 0x80000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000
+				0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000
+				0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000
+				0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
+			/* Map all possible DDR as inbound ranges */
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>;
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 318>, <&pcie_bus_clk>;
+			clock-names = "pcie", "pcie_bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.7.0.rc3.207.g0ac5344
