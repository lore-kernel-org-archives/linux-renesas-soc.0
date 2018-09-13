Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34748 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726835AbeIMOSn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 10:18:43 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 07/58] arm64: dts: renesas: r8a77980: move IPMMU nodes
Date: Thu, 13 Sep 2018 11:09:02 +0200
Message-Id: <f14bfabc5472ebc637a9ed8c5bc4ab7b77db209f.1536828567.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1536828567.git.horms+renesas@verge.net.au>
References: <cover.1536828567.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

The IPMMU nodes should follow the GEther node, not the CAN-FD node,
according to the <unit-address> part of the startng IPMMU-DS1 node.
While moving the nodes, also do sort them by label alphanumerically...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 126 +++++++++++++++---------------
 1 file changed, 63 insertions(+), 63 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 1013da3e2ec4..fbfe65476443 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -462,69 +462,6 @@
 			};
 		};
 
-		ipmmu_ds1: mmu@e7740000 {
-			compatible = "renesas,ipmmu-r8a77980";
-			reg = <0 0xe7740000 0 0x1000>;
-			renesas,ipmmu-main = <&ipmmu_mm 0>;
-			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
-			#iommu-cells = <1>;
-		};
-
-		ipmmu_vip0: mmu@e7b00000 {
-			compatible = "renesas,ipmmu-r8a77980";
-			reg = <0 0xe7b00000 0 0x1000>;
-			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
-			#iommu-cells = <1>;
-		};
-
-		ipmmu_vip1: mmu@e7960000 {
-			compatible = "renesas,ipmmu-r8a77980";
-			reg = <0 0xe7960000 0 0x1000>;
-			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
-			#iommu-cells = <1>;
-		};
-
-		ipmmu_ir: mmu@ff8b0000 {
-			compatible = "renesas,ipmmu-r8a77980";
-			reg = <0 0xff8b0000 0 0x1000>;
-			renesas,ipmmu-main = <&ipmmu_mm 3>;
-			power-domains = <&sysc R8A77980_PD_A3IR>;
-			#iommu-cells = <1>;
-		};
-
-		ipmmu_mm: mmu@e67b0000 {
-			compatible = "renesas,ipmmu-r8a77980";
-			reg = <0 0xe67b0000 0 0x1000>;
-			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
-			#iommu-cells = <1>;
-		};
-
-		ipmmu_rt: mmu@ffc80000 {
-			compatible = "renesas,ipmmu-r8a77980";
-			reg = <0 0xffc80000 0 0x1000>;
-			renesas,ipmmu-main = <&ipmmu_mm 10>;
-			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
-			#iommu-cells = <1>;
-		};
-
-		ipmmu_vc0: mmu@fe6b0000 {
-			compatible = "renesas,ipmmu-r8a77980";
-			reg = <0 0xfe6b0000 0 0x1000>;
-			renesas,ipmmu-main = <&ipmmu_mm 12>;
-			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
-			#iommu-cells = <1>;
-		};
-
-		ipmmu_vi0: mmu@febd0000 {
-			compatible = "renesas,ipmmu-r8a77980";
-			reg = <0 0xfebd0000 0 0x1000>;
-			renesas,ipmmu-main = <&ipmmu_mm 14>;
-			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
-			#iommu-cells = <1>;
-		};
-
 		avb: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a77980",
 				     "renesas,etheravb-rcar-gen3";
@@ -722,6 +659,69 @@
 			status = "disabled";
 		};
 
+		ipmmu_ds1: mmu@e7740000 {
+			compatible = "renesas,ipmmu-r8a77980";
+			reg = <0 0xe7740000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ir: mmu@ff8b0000 {
+			compatible = "renesas,ipmmu-r8a77980";
+			reg = <0 0xff8b0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 3>;
+			power-domains = <&sysc R8A77980_PD_A3IR>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_mm: mmu@e67b0000 {
+			compatible = "renesas,ipmmu-r8a77980";
+			reg = <0 0xe67b0000 0 0x1000>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_rt: mmu@ffc80000 {
+			compatible = "renesas,ipmmu-r8a77980";
+			reg = <0 0xffc80000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 10>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vc0: mmu@fe6b0000 {
+			compatible = "renesas,ipmmu-r8a77980";
+			reg = <0 0xfe6b0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 12>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vi0: mmu@febd0000 {
+			compatible = "renesas,ipmmu-r8a77980";
+			reg = <0 0xfebd0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 14>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vip0: mmu@e7b00000 {
+			compatible = "renesas,ipmmu-r8a77980";
+			reg = <0 0xe7b00000 0 0x1000>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vip1: mmu@e7960000 {
+			compatible = "renesas,ipmmu-r8a77980";
+			reg = <0 0xe7960000 0 0x1000>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
 		mmc0: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a77980",
 				     "renesas,rcar-gen3-sdhi";
-- 
2.11.0
