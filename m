Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:35860 "EHLO
        mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934485AbcJ0Ntb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 09:49:31 -0400
Received: by mail-pf0-f178.google.com with SMTP id e6so17990871pfk.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 06:49:18 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Thu, 27 Oct 2016 19:29:05 +0900
Message-Id: <20161027102905.26426.98680.sendpatchset@little-apple>
In-Reply-To: <20161027102856.26426.48132.sendpatchset@little-apple>
References: <20161027102856.26426.48132.sendpatchset@little-apple>
Subject: [PATCH 01/04] arm64: dts: r8a7795: Add IPMMU device nodes
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add r8a7795 IPMMU nodes and keep all disabled by default.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |  113 ++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2016-10-27 18:03:38.940607110 +0900
@@ -413,6 +413,119 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 		};
 
+		ipmmu_vi: mmu@febd0000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfebd0000 0 0x1000>; /* IPMMU-VI */
+			renesas,ipmmu-main = <&ipmmu_mm 11>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_vp: mmu@fe990000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfe990000 0 0x1000>; /* IPMMU-VP */
+			renesas,ipmmu-main = <&ipmmu_mm 12>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_vc0: mmu@fe6b0000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfe6b0000 0 0x1000>; /* IPMMU-VC0 */
+			renesas,ipmmu-main = <&ipmmu_mm 9>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_vc1: mmu@fe6f0000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfe6f0000 0 0x1000>; /* IPMMU-VC1 */
+			renesas,ipmmu-main = <&ipmmu_mm 10>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_pv0: mmu@fd800000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfd800000 0 0x1000>; /* IPMMU-PV0 */
+			renesas,ipmmu-main = <&ipmmu_mm 6>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_ir: mmu@ff8b0000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xff8b0000 0 0x1000>; /* IPMMU-IR */
+			renesas,ipmmu-main = <&ipmmu_mm 3>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_hc: mmu@e6570000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xe6570000 0 0x1000>; /* IPMMU-HC */
+			renesas,ipmmu-main = <&ipmmu_mm 2>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_rt: mmu@ffc80000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xffc80000 0 0x1000>; /* IPMMU-RT */
+			renesas,ipmmu-main = <&ipmmu_mm 7>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_mp0: mmu@ec670000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xec670000 0 0x1000>; /* IPMMU-MP0 */
+			renesas,ipmmu-main = <&ipmmu_mm 4>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_mp1: mmu@ec680000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xec680000 0 0x1000>; /* IPMMU-MP1 */
+			renesas,ipmmu-main = <&ipmmu_mm 5>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_sy: mmu@e7730000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xe7730000 0 0x1000>; /* IPMMU-SY */
+			renesas,ipmmu-main = <&ipmmu_mm 8>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_ds0: mmu@e6740000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xe6740000 0 0x1000>; /* IPMMU-DS0 */
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_ds1: mmu@e7740000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xe7740000 0 0x1000>; /* IPMMU-DS1 */
+			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_mm: mmu@e67b0000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xe67b0000 0 0x1000>; /* IPMMU-MM */
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a7795",
 				     "renesas,rcar-dmac";
