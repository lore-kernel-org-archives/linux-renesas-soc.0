Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:35911 "EHLO
        mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942624AbcJ0Ohm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 10:37:42 -0400
Received: by mail-pf0-f171.google.com with SMTP id e6so18850655pfk.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 07:37:28 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Thu, 27 Oct 2016 20:18:22 +0900
Message-Id: <20161027111822.11574.3221.sendpatchset@little-apple>
Subject: [PATCH/RFC] arm64: dts: r8a7796: Add IPMMU device nodes
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add r8a7796 IPMMU nodes and keep all disabled by default.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Depends on the following DT binding that has been acked by Laurent
 but is not yet upstream or queued up in -next:
 
 [PATCH v2] iommu/ipmmu-vmsa: Add r8a7796 DT binding

 arch/arm64/boot/dts/renesas/r8a7796.dtsi |   89 ++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7796.dtsi	2016-10-27 20:12:24.830607110 +0900
@@ -224,6 +224,95 @@
 			reg = <0 0xe6060000 0 0x50c>;
 		};
 
+		ipmmu_vi: mmu@febd0000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xfebd0000 0 0x1000>; /* IPMMU-VI */
+			renesas,ipmmu-main = <&ipmmu_mm 9>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_vc0: mmu@fe6b0000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xfe6b0000 0 0x1000>; /* IPMMU-VC0 */
+			renesas,ipmmu-main = <&ipmmu_mm 8>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_pv0: mmu@fd800000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xfd800000 0 0x1000>; /* IPMMU-PV0 */
+			renesas,ipmmu-main = <&ipmmu_mm 5>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_pv1: mmu@fd950000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xfd950000 0 0x1000>; /* IPMMU-PV1 */
+			renesas,ipmmu-main = <&ipmmu_mm 6>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_ir: mmu@ff8b0000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xff8b0000 0 0x1000>; /* IPMMU-IR */
+			renesas,ipmmu-main = <&ipmmu_mm 3>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_hc: mmu@e6570000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xe6570000 0 0x1000>; /* IPMMU-HC */
+			renesas,ipmmu-main = <&ipmmu_mm 2>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_rt: mmu@ffc80000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xffc80000 0 0x1000>; /* IPMMU-RT */
+			renesas,ipmmu-main = <&ipmmu_mm 7>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_mp0: mmu@ec670000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xec670000 0 0x1000>; /* IPMMU-MP0 */
+			renesas,ipmmu-main = <&ipmmu_mm 4>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_ds0: mmu@e6740000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xe6740000 0 0x1000>; /* IPMMU-DS0 */
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_ds1: mmu@e7740000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xe7740000 0 0x1000>; /* IPMMU-DS1 */
+			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_mm: mmu@e67b0000 {
+			compatible = "renesas,ipmmu-r8a7796";
+			reg = <0 0xe67b0000 0 0x1000>; /* IPMMU-MM */
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a7796-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
