Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:38803 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932810AbeFQKkz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jun 2018 06:40:55 -0400
Received: by mail-pf0-f195.google.com with SMTP id b74-v6so6817946pfl.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jun 2018 03:40:55 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Sun, 17 Jun 2018 19:42:31 +0900
Message-Id: <152923215125.18394.10152095394019866712.sendpatchset@little-apple>
In-Reply-To: <152923212426.18394.1638836062311758848.sendpatchset@little-apple>
References: <152923212426.18394.1638836062311758848.sendpatchset@little-apple>
Subject: [PATCH v2 03/03] arm64: dts: renesas: r8a77990: Add IPMMU devices nodes
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add IPMMU device nodes for the R-Car E3 SoC aka r8a77990.

The r8a77990 IPMMU is similar to r8a77995. Power domains are
however different and the public documentation is still unclear.

Based on preliminary information from the hardware team the R-Car E3
SoC comes with an IPMMU-VP0 device in an Always-on power domain and
the IPMMU-VC0 is placed as expected in the A3VC power domain.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---

 Changes since V1:
 - Updated patch description based on information from hardware team
 - Added Reviewed-by from Simon - thanks!

 arch/arm64/boot/dts/renesas/r8a77990.dtsi |   82 +++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/r8a77990-sysc.h>
 
 / {
 	compatible = "renesas,r8a77990";
@@ -191,6 +192,87 @@
 			#power-domain-cells = <1>;
 		};
 
+		ipmmu_ds0: mmu@e6740000 {
+			compatible = "renesas,ipmmu-r8a77990";
+			reg = <0 0xe6740000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ds1: mmu@e7740000 {
+			compatible = "renesas,ipmmu-r8a77990";
+			reg = <0 0xe7740000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_hc: mmu@e6570000 {
+			compatible = "renesas,ipmmu-r8a77990";
+			reg = <0 0xe6570000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 2>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_mm: mmu@e67b0000 {
+			compatible = "renesas,ipmmu-r8a77990";
+			reg = <0 0xe67b0000 0 0x1000>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_mp: mmu@ec670000 {
+			compatible = "renesas,ipmmu-r8a77990";
+			reg = <0 0xec670000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 4>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_pv0: mmu@fd800000 {
+			compatible = "renesas,ipmmu-r8a77990";
+			reg = <0 0xfd800000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 6>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_rt: mmu@ffc80000 {
+			compatible = "renesas,ipmmu-r8a77990";
+			reg = <0 0xffc80000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 10>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vc0: mmu@fe6b0000 {
+			compatible = "renesas,ipmmu-r8a77990";
+			reg = <0 0xfe6b0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 12>;
+			power-domains = <&sysc R8A77990_PD_A3VC>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vi0: mmu@febd0000 {
+			compatible = "renesas,ipmmu-r8a77990";
+			reg = <0 0xfebd0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 14>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vp0: mmu@fe990000 {
+			compatible = "renesas,ipmmu-r8a77990";
+			reg = <0 0xfe990000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 16>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
 		avb: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a77990",
 				     "renesas,etheravb-rcar-gen3";
