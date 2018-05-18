Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeERLQj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:16:39 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 033/102] arm64: dts: renesas: r8a77995: Enable IPMMU devices
Date: Fri, 18 May 2018 13:14:55 +0200
Message-Id: <1c2a0de390c8c4c27c2c1dbacbecf85fcbbf9f76.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Remove 'status = "disabled"' to make sure all IPMMU devices are enabled
in DT on the r8a77995 SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
[simon: rebased]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index a97830589b0d..ba98865b0c9b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -409,7 +409,6 @@
 			reg = <0 0xe6740000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 0>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_ds1: mmu@e7740000 {
@@ -417,7 +416,6 @@
 			reg = <0 0xe7740000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 1>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_hc: mmu@e6570000 {
@@ -425,7 +423,6 @@
 			reg = <0 0xe6570000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 2>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_mm: mmu@e67b0000 {
@@ -434,7 +431,6 @@
 			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_mp: mmu@ec670000 {
@@ -442,7 +438,6 @@
 			reg = <0 0xec670000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 4>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_pv0: mmu@fd800000 {
@@ -450,7 +445,6 @@
 			reg = <0 0xfd800000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 6>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_rt: mmu@ffc80000 {
@@ -458,7 +452,6 @@
 			reg = <0 0xffc80000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 10>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vc0: mmu@fe6b0000 {
@@ -466,7 +459,6 @@
 			reg = <0 0xfe6b0000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 12>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vi0: mmu@febd0000 {
@@ -474,7 +466,6 @@
 			reg = <0 0xfebd0000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 14>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vp0: mmu@fe990000 {
@@ -482,7 +473,6 @@
 			reg = <0 0xfe990000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 16>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		avb: ethernet@e6800000 {
-- 
2.11.0
