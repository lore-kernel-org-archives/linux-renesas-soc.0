Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751815AbeERLR5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:17:57 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 030/102] arm64: dts: renesas: r8a7795: Enable IPMMU devices
Date: Fri, 18 May 2018 13:14:52 +0200
Message-Id: <d2ed9ffcab09f251aae6ac1d5da8a6ae62501150.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Remove 'status = "disabled"' to make sure all IPMMU devices are enabled
in DT on the r8a7795 SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index acf0c6f72a4d..32870cbaf94d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -947,7 +947,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 2>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_ir: mmu@ff8b0000 {
@@ -956,7 +955,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 3>;
 			power-domains = <&sysc R8A7795_PD_A3IR>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_mm: mmu@e67b0000 {
@@ -974,7 +972,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 4>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_pv0: mmu@fd800000 {
@@ -983,7 +980,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 6>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_pv1: mmu@fd950000 {
@@ -992,7 +988,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 7>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_pv2: mmu@fd960000 {
@@ -1001,7 +996,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 8>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_pv3: mmu@fd970000 {
@@ -1010,7 +1004,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 9>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_rt: mmu@ffc80000 {
@@ -1019,7 +1012,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 10>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vc0: mmu@fe6b0000 {
@@ -1028,7 +1020,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 12>;
 			power-domains = <&sysc R8A7795_PD_A3VC>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vc1: mmu@fe6f0000 {
@@ -1037,7 +1028,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 13>;
 			power-domains = <&sysc R8A7795_PD_A3VC>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vi0: mmu@febd0000 {
@@ -1054,7 +1044,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 15>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vp0: mmu@fe990000 {
@@ -1063,7 +1052,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 16>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vp1: mmu@fe980000 {
-- 
2.11.0
