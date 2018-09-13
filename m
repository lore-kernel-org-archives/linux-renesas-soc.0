Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34748 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbeIMOTR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 10:19:17 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 40/58] arm64: dts: renesas: r8a77980: add PCIe support
Date: Thu, 13 Sep 2018 11:09:35 +0200
Message-Id: <ffa967e24c5817b48a3d5ecea2c12b9cdd807f0c.1536828567.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1536828567.git.horms+renesas@verge.net.au>
References: <cover.1536828567.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Describe the PCIe PHY, PCIEC, and PCIe bus clock in the R8A77980 device
tree.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 49 +++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index c099053cf5fe..d58e9f2c9883 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -98,6 +98,13 @@
 		clock-frequency = <0>;
 	};
 
+	/* External PCIe clock - can be overridden by the board */
+	pcie_bus_clk: pcie_bus {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	pmu_a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
@@ -437,6 +444,16 @@
 			status = "disabled";
 		};
 
+		pcie_phy: pcie-phy@e65d0000 {
+			compatible = "renesas,r8a77980-pcie-phy";
+			reg = <0 0xe65d0000 0 0x8000>;
+			#phy-cells = <0>;
+			clocks = <&cpg CPG_MOD 319>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 319>;
+			status = "disabled";
+		};
+
 		canfd: can@e66c0000 {
 			compatible = "renesas,r8a77980-canfd",
 				     "renesas,rcar-gen3-canfd";
@@ -1047,6 +1064,38 @@
 			resets = <&cpg 408>;
 		};
 
+		pciec: pcie@fe000000 {
+			compatible = "renesas,pcie-r8a77980",
+				     "renesas,pcie-rcar-gen3";
+			reg = <0 0xfe000000 0 0x80000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <
+				0x01000000 0 0x00000000 0 0xfe100000 0 0x0100000
+				0x02000000 0 0xfe200000 0 0xfe200000 0 0x0200000
+				0x02000000 0 0x30000000 0 0x30000000 0 0x8000000
+				0x42000000 0 0x38000000 0 0x38000000 0 0x8000000
+			>;
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000
+				      0 0x80000000>;
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 148
+					 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
+			clock-names = "pcie", "pcie_bus";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 319>;
+			phys = <&pcie_phy>;
+			phy-names = "pcie";
+			status = "disabled";
+		};
+
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfea20000 0 0x5000>;
-- 
2.11.0
