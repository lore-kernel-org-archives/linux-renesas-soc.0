Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:38168 "EHLO
        mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751281AbeDVKHz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Apr 2018 06:07:55 -0400
Received: by mail-pf0-f179.google.com with SMTP id o76so2165755pfi.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Apr 2018 03:07:55 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Sun, 22 Apr 2018 19:08:41 +0900
Message-Id: <152439172110.19829.3765593463963614506.sendpatchset@little-apple>
In-Reply-To: <152439168688.19829.5853068596124565316.sendpatchset@little-apple>
References: <152439168688.19829.5853068596124565316.sendpatchset@little-apple>
Subject: [PATCH 04/04] arm64: dts: renesas: r8a77995: Enable IPMMU devices
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Remove 'status = "disabled"' to make sure all IPMMU devices are enabled
in DT on the r8a77995 SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77995.dtsi |   10 ----------
 1 file changed, 10 deletions(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77995.dtsi	2018-04-22 18:25:39.340607110 +0900
@@ -108,7 +108,6 @@
 			reg = <0 0xfebd0000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 14>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vp0: mmu@fe990000 {
@@ -116,7 +115,6 @@
 			reg = <0 0xfe990000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 16>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_vc0: mmu@fe6b0000 {
@@ -124,7 +122,6 @@
 			reg = <0 0xfe6b0000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 12>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_pv0: mmu@fd800000 {
@@ -132,7 +129,6 @@
 			reg = <0 0xfd800000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 6>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_hc: mmu@e6570000 {
@@ -140,7 +136,6 @@
 			reg = <0 0xe6570000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 2>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_rt: mmu@ffc80000 {
@@ -148,7 +143,6 @@
 			reg = <0 0xffc80000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 10>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_mp: mmu@ec670000 {
@@ -156,7 +150,6 @@
 			reg = <0 0xec670000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 4>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_ds0: mmu@e6740000 {
@@ -164,7 +157,6 @@
 			reg = <0 0xe6740000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 0>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_ds1: mmu@e7740000 {
@@ -172,7 +164,6 @@
 			reg = <0 0xe7740000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 1>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_mm: mmu@e67b0000 {
@@ -181,7 +172,6 @@
 			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 
