Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55692 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752310AbdKAKgR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Nov 2017 06:36:17 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/7] arm64: dts: renesas: r8a7796: Add IPMMU device nodes
Date: Wed,  1 Nov 2017 11:34:52 +0100
Message-Id: <20171101103458.7582-2-horms+renesas@verge.net.au>
In-Reply-To: <20171101103458.7582-1-horms+renesas@verge.net.au>
References: <20171101103458.7582-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add r8a7796 IPMMU nodes and keep all disabled by default.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
[simon: update names]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 89 ++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 8c94a313d9e1..cef1901736a8 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -357,6 +357,95 @@
 					     <&a53_3>;
 		};
 
+		ipmmu_vi0: mmu@febd0000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xfebd0000 0 0x1000>; /* IPMMU-VI0 */
+			renesas,ipmmu-main = <&ipmmu_mm 9>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_vc0: mmu@fe6b0000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xfe6b0000 0 0x1000>; /* IPMMU-VC0 */
+			renesas,ipmmu-main = <&ipmmu_mm 8>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_pv0: mmu@fd800000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xfd800000 0 0x1000>; /* IPMMU-PV0 */
+			renesas,ipmmu-main = <&ipmmu_mm 5>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_pv1: mmu@fd950000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xfd950000 0 0x1000>; /* IPMMU-PV1 */
+			renesas,ipmmu-main = <&ipmmu_mm 6>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_ir: mmu@ff8b0000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xff8b0000 0 0x1000>; /* IPMMU-IR */
+			renesas,ipmmu-main = <&ipmmu_mm 3>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_hc: mmu@e6570000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xe6570000 0 0x1000>; /* IPMMU-HC */
+			renesas,ipmmu-main = <&ipmmu_mm 2>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_rt: mmu@ffc80000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xffc80000 0 0x1000>; /* IPMMU-RT */
+			renesas,ipmmu-main = <&ipmmu_mm 7>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_mp: mmu@ec670000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xec670000 0 0x1000>; /* IPMMU-MP */
+			renesas,ipmmu-main = <&ipmmu_mm 4>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_ds0: mmu@e6740000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xe6740000 0 0x1000>; /* IPMMU-DS0 */
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_ds1: mmu@e7740000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xe7740000 0 0x1000>; /* IPMMU-DS1 */
+			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_mm: mmu@e67b0000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xe67b0000 0 0x1000>; /* IPMMU-MM */
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a7796-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
-- 
2.11.0
