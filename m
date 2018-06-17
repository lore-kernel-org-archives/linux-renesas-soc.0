Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35437 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932810AbeFQKkq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jun 2018 06:40:46 -0400
Received: by mail-pg0-f65.google.com with SMTP id 15-v6so6267802pge.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jun 2018 03:40:46 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Sun, 17 Jun 2018 19:42:22 +0900
Message-Id: <152923214214.18394.2028588895827362308.sendpatchset@little-apple>
In-Reply-To: <152923212426.18394.1638836062311758848.sendpatchset@little-apple>
References: <152923212426.18394.1638836062311758848.sendpatchset@little-apple>
Subject: [PATCH v2 02/03] arm64: dts: renesas: r8a77980: Add IPMMU devices nodes
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add IPMMU device nodes for the R-Car V3H SoC aka r8a77980.

The r8a77980 IPMMU is quite similar to r8a77970 however VC0
has been added. The IMSSTR bit assignment has also been
reworked. Power domains are also quite different however the
the documentation is rather unclear about this topic.

Until we know better VC0 gets assigned to R8A77980_PD_ALWAYS_ON.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20180614v2-v4.17

 Changes since V1:
 - Added ipmmu_vip0 and ipmmu_vip1 from 1.00 data sheet
 - Interrupt bit configuration based on 1.00 data sheet
 - Updated order of DT nodes per request by Simon

 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   63 +++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -427,6 +427,69 @@
 			};
 		};
 
+		ipmmu_ds1: mmu@e7740000 {
+			compatible = "renesas,ipmmu-r8a77980";
+			reg = <0 0xe7740000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
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
 		avb: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a77980",
 				     "renesas,etheravb-rcar-gen3";
