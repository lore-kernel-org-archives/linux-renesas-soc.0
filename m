Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35245 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753076AbeFGMMS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 08:12:18 -0400
Received: by mail-pg0-f67.google.com with SMTP id 15-v6so4677060pge.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jun 2018 05:12:18 -0700 (PDT)
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT 2/2] arm64: dts: renesas: r8a77965: Add PCIe device nodes
Date: Thu,  7 Jun 2018 21:11:34 +0900
Message-Id: <1528373494-18503-3-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1528373494-18503-1-git-send-email-ykaneko0929@gmail.com>
References: <1528373494-18503-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds PCIe{0,1} device nodes to R8A77965 SoC.

Based on a similar patches of the R8A7796 device tree
by Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 48 +++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index d740c79..0d39a31 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1433,13 +1433,57 @@
 		};
 
 		pciec0: pcie@fe000000 {
+			compatible = "renesas,pcie-r8a77965",
+				     "renesas,pcie-rcar-gen3";
 			reg = <0 0xfe000000 0 0x80000>;
-			/* placeholder */
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000
+				0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000
+				0x02000000 0 0x30000000 0 0x30000000 0 0x08000000
+				0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
+			/* Map all possible DDR as inbound ranges */
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
+			clock-names = "pcie", "pcie_bus";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 319>;
+			status = "disabled";
 		};
 
 		pciec1: pcie@ee800000 {
+			compatible = "renesas,pcie-r8a77965",
+				     "renesas,pcie-rcar-gen3";
 			reg = <0 0xee800000 0 0x80000>;
-			/* placeholder */
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00100000
+				0x02000000 0 0xeea00000 0 0xeea00000 0 0x00200000
+				0x02000000 0 0xc0000000 0 0xc0000000 0 0x08000000
+				0x42000000 0 0xc8000000 0 0xc8000000 0 0x08000000>;
+			/* Map all possible DDR as inbound ranges */
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 318>, <&pcie_bus_clk>;
+			clock-names = "pcie", "pcie_bus";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 318>;
+			status = "disabled";
 		};
 
 		fcpf0: fcp@fe950000 {
-- 
1.9.1
