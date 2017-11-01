Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55692 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752216AbdKAKgn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Nov 2017 06:36:43 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v4 14/15] arm64: dts: renesas: r8a7795: Enable IPMMU-VI, VP, DS0, DS1 and MM
Date: Wed,  1 Nov 2017 11:34:51 +0100
Message-Id: <20171101103452.7491-15-horms+renesas@verge.net.au>
In-Reply-To: <20171101103452.7491-1-horms+renesas@verge.net.au>
References: <20171101103452.7491-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Enable the r8a7795 device nodes for IPMMU-VI, IPMMU-VP, IPMMU-DS0,
IPMMU-DS1 and the shared IPMMU-MM device.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v4 [Simon Horman]
* Broke out of larger patch

v1 - v3 [Magnus Damm]
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index f7c9dc2174f9..8995254d2933 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -426,7 +426,6 @@
 			reg = <0 0xfebd0000 0 0x1000>; /* IPMMU-VI0 */
 			renesas,ipmmu-main = <&ipmmu_mm 14>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vi1: mmu@febe0000 {
@@ -448,7 +447,6 @@
 			reg = <0 0xfe980000 0 0x1000>; /* IPMMU-VP1 */
 			renesas,ipmmu-main = <&ipmmu_mm 17>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vc0: mmu@fe6b0000 {
@@ -528,7 +526,6 @@
 			reg = <0 0xe6740000 0 0x1000>; /* IPMMU-DS0 */
 			renesas,ipmmu-main = <&ipmmu_mm 0>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_ds1: mmu@e7740000 {
@@ -536,7 +533,6 @@
 			reg = <0 0xe7740000 0 0x1000>; /* IPMMU-DS1 */
 			renesas,ipmmu-main = <&ipmmu_mm 1>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_mm: mmu@e67b0000 {
@@ -545,7 +541,6 @@
 			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		dmac0: dma-controller@e6700000 {
-- 
2.11.0
