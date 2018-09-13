Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34748 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbeIMOT7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 10:19:59 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 31/58] arm64: dts: renesas: r8a774a1: Add IPMMU device nodes
Date: Thu, 13 Sep 2018 11:09:26 +0200
Message-Id: <8f507babc617050e7502849d008ddab548efa9c1.1536828567.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1536828567.git.horms+renesas@verge.net.au>
References: <cover.1536828567.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Add r8a774a1 IPMMU nodes.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 73 +++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 02620c89e004..8589122e3c94 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -642,6 +642,79 @@
 			dma-channels = <16>;
 		};
 
+		ipmmu_ds0: mmu@e6740000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xe6740000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ds1: mmu@e7740000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xe7740000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_hc: mmu@e6570000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xe6570000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 2>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_mm: mmu@e67b0000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xe67b0000 0 0x1000>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_mp: mmu@ec670000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xec670000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 4>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_pv0: mmu@fd800000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xfd800000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 5>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_pv1: mmu@fd950000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xfd950000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 6>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vc0: mmu@fe6b0000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xfe6b0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 8>;
+			power-domains = <&sysc 14>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vi0: mmu@febd0000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xfebd0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 9>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
 		avb: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a774a1",
 				     "renesas,etheravb-rcar-gen3";
-- 
2.11.0
