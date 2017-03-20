Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35406 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752346AbdCTIno (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:43:44 -0400
Received: by mail-pg0-f65.google.com with SMTP id g2so18562042pge.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2017 01:42:10 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Mon, 20 Mar 2017 17:36:40 +0900
Message-Id: <148999900079.20118.15652941383661817796.sendpatchset@little-apple>
In-Reply-To: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
References: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
Subject: [PATCH v3 09/09] arm64: dts: r8a7795: Enable IPMMU-VI, VP, MP1, DS0, DS1 and MM
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Enable the r8a7795 device nodes for IPMMU-VI, IPMMU-VP, IPMMU-MP1,
IPMMU-DS0, IPMMU-DS1 and the shared IPMMU-MM device.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V2:
 - New patch

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    6 ------
 1 file changed, 6 deletions(-)

--- 0016/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2017-03-20 16:41:34.980607110 +0900
@@ -412,7 +412,6 @@
 			reg = <0 0xfebd0000 0 0x1000>; /* IPMMU-VI */
 			renesas,ipmmu-main = <&ipmmu_mm 11>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vp: mmu@fe990000 {
@@ -420,7 +419,6 @@
 			reg = <0 0xfe990000 0 0x1000>; /* IPMMU-VP */
 			renesas,ipmmu-main = <&ipmmu_mm 12>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vc0: mmu@fe6b0000 {
@@ -484,7 +482,6 @@
 			reg = <0 0xec680000 0 0x1000>; /* IPMMU-MP1 */
 			renesas,ipmmu-main = <&ipmmu_mm 5>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_sy: mmu@e7730000 {
@@ -500,7 +497,6 @@
 			reg = <0 0xe6740000 0 0x1000>; /* IPMMU-DS0 */
 			renesas,ipmmu-main = <&ipmmu_mm 0>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_ds1: mmu@e7740000 {
@@ -508,7 +504,6 @@
 			reg = <0 0xe7740000 0 0x1000>; /* IPMMU-DS1 */
 			renesas,ipmmu-main = <&ipmmu_mm 1>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_mm: mmu@e67b0000 {
@@ -517,7 +512,6 @@
 			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		dmac0: dma-controller@e6700000 {
