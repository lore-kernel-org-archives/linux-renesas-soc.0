Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:41638 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751028AbeDVKHa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Apr 2018 06:07:30 -0400
Received: by mail-pg0-f66.google.com with SMTP id m21so3348372pgv.8
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Apr 2018 03:07:30 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Sun, 22 Apr 2018 19:08:15 +0900
Message-Id: <152439169549.19829.11796550786939315157.sendpatchset@little-apple>
In-Reply-To: <152439168688.19829.5853068596124565316.sendpatchset@little-apple>
References: <152439168688.19829.5853068596124565316.sendpatchset@little-apple>
Subject: [PATCH 01/04] arm64: dts: renesas: r8a7795: Enable IPMMU devices
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Remove 'status = "disabled"' to make sure all IPMMU devices are enabled
in DT on the r8a7795 SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |   12 ------------
 1 file changed, 12 deletions(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2018-04-22 18:18:49.150607110 +0900
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
