Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:45182 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751021AbeEUODC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 10:03:02 -0400
Received: by mail-pl0-f68.google.com with SMTP id bi12-v6so8865934plb.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 May 2018 07:03:02 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 21 May 2018 23:04:14 +0900
Message-Id: <152691145438.14120.9546153783596652043.sendpatchset@little-apple>
Subject: [PATCH] arm64: dts: renesas: r8a77995: Add IPMMU power domains
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add power domain information to the R-Car D3 IPMMU device nodes.
As specified by the data sheet, all the IPMMU devices are always on.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20180518-v4.17-rc5

 arch/arm64/boot/dts/renesas/r8a77995.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77995.dtsi	2018-05-21 22:46:36.460607110 +0900
@@ -408,6 +408,7 @@
 			compatible = "renesas,ipmmu-r8a77995";
 			reg = <0 0xe6740000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
 
@@ -415,6 +416,7 @@
 			compatible = "renesas,ipmmu-r8a77995";
 			reg = <0 0xe7740000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
 
@@ -422,6 +424,7 @@
 			compatible = "renesas,ipmmu-r8a77995";
 			reg = <0 0xe6570000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 2>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
 
@@ -430,6 +433,7 @@
 			reg = <0 0xe67b0000 0 0x1000>;
 			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
 
@@ -437,6 +441,7 @@
 			compatible = "renesas,ipmmu-r8a77995";
 			reg = <0 0xec670000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 4>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
 
@@ -444,6 +449,7 @@
 			compatible = "renesas,ipmmu-r8a77995";
 			reg = <0 0xfd800000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 6>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
 
@@ -451,6 +457,7 @@
 			compatible = "renesas,ipmmu-r8a77995";
 			reg = <0 0xffc80000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 10>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
 
@@ -458,6 +465,7 @@
 			compatible = "renesas,ipmmu-r8a77995";
 			reg = <0 0xfe6b0000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 12>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
 
@@ -465,6 +473,7 @@
 			compatible = "renesas,ipmmu-r8a77995";
 			reg = <0 0xfebd0000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 14>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
 
@@ -472,6 +481,7 @@
 			compatible = "renesas,ipmmu-r8a77995";
 			reg = <0 0xfe990000 0 0x1000>;
 			renesas,ipmmu-main = <&ipmmu_mm 16>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
 
