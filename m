Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45036 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730106AbeGZUJ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 16:09:28 -0400
Received: by mail-lj1-f194.google.com with SMTP id q127-v6so2357378ljq.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jul 2018 11:51:20 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: r8a77980: move IPMMU nodes
To: Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
Message-ID: <5f7daa87-b0b3-faa7-0331-640c39961b4a@cogentembedded.com>
Date: Thu, 26 Jul 2018 21:51:18 +0300
MIME-Version: 1.0
In-Reply-To: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The IPMMU nodes should follow the GEther node, not the CAN-FD node,
according to the <unit-address> part of the startng IPMMU-DS1 node.
While moving the nodes, also do sort them by label alphanumerically...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'renesas-devel-20180726-v4.18-rc6' tag of Simon
Horman's 'renesas.git' repo.

 arch/arm64/boot/dts/renesas/r8a77980.dtsi |  126 +++++++++++++++---------------
 1 file changed, 63 insertions(+), 63 deletions(-)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
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
