Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58641 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729792AbeGPIPy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 04:15:54 -0400
Date: Mon, 16 Jul 2018 09:49:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/03] arm64: dts: renesas: Add IPMMU device nodes V2
Message-ID: <20180716074939.76mes7rt5ddqnyy6@verge.net.au>
References: <152923212426.18394.1638836062311758848.sendpatchset@little-apple>
 <20180620091416.s4vdg5tgkl3mnoxd@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180620091416.s4vdg5tgkl3mnoxd@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 20, 2018 at 11:14:17AM +0200, Simon Horman wrote:
> On Sun, Jun 17, 2018 at 07:42:04PM +0900, Magnus Damm wrote:
> > arm64: dts: renesas: Add IPMMU device nodes V2
> > 
> > [PATCH v2 01/03] arm64: dts: renesas: r8a77965: Add IPMMU devices nodes
> > [PATCH v2 02/03] arm64: dts: renesas: r8a77980: Add IPMMU devices nodes
> > [PATCH v2 03/03] arm64: dts: renesas: r8a77990: Add IPMMU devices nodes
> > 
> > This series is the second attempt to add IPMMU device nodes to R-Car M3-N,
> > R-Car V3H and R-Car E3 SoCs.
> > 
> > The IPMMU DT binding changes are not yet merged upstream however they
> > have been documented by the following patches:
> > 
> > [PATCH] iommu/ipmmu-vmsa: Document R-Car M3-N IPMMU DT bindings 
> > [PATCH] iommu/ipmmu-vmsa: Document R-Car V3H and E3 IPMMU DT bindings
> > 
> > Please see each individual patch for list of changes.
> 
> Hi Magnus,
> 
> as per my comment on v1, did you consider merging these patches into one
> patch. Olof has asked that we consider such consolidation.

The above dependencies now appear have been accepted for v4.19.

I have now applied this series. I took the liberty of squashing all three
patches into one. The result is as follows.


From: Magnus Damm <damm+renesas@opensource.se>
Date: Sun, 17 Jun 2018 19:42:13 +0900
Subject: [PATCH] arm64: dts: renesas: r8a779{65,80,90}: Add IPMMU devices
 nodes

Add IPMMU device nodes for the R-Car M3-N (r8a77965),
V3H (r8a77980) and E3 (r8a77990) SoCs.

* The r8a77965 IPMMU is quite similar to r8a7796 however VP0
  has been added and PV1 has been removed. Also the IMSSTR
  bit assignment has been reworked.

* The r8a77980 IPMMU is quite similar to r8a77970 however VC0
  has been added. The IMSSTR bit assignment has also been
  reworked. Power domains are also quite different however the
  the documentation is rather unclear about this topic.

  Until we know better VC0 gets assigned to R8A77980_PD_ALWAYS_ON.

* The r8a77990 IPMMU is similar to r8a77995. Power domains are
  however different and the public documentation is still unclear.

  Based on preliminary information from the hardware team the R-Car E3
  SoC comes with an IPMMU-VP0 device in an Always-on power domain and
  the IPMMU-VC0 is placed as expected in the A3VC power domain.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 89 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 63 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 82 ++++++++++++++++++++++++++++
 3 files changed, 234 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 59afc5592ee0..0cd44461a0bd 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -704,6 +704,95 @@
 			dma-channels = <16>;
 		};
 
+		ipmmu_ds0: mmu@e6740000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xe6740000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ds1: mmu@e7740000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xe7740000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_hc: mmu@e6570000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xe6570000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 2>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ir: mmu@ff8b0000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xff8b0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 3>;
+			power-domains = <&sysc R8A77965_PD_A3IR>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_mm: mmu@e67b0000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xe67b0000 0 0x1000>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_mp: mmu@ec670000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xec670000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 4>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_pv0: mmu@fd800000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xfd800000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 6>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_rt: mmu@ffc80000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xffc80000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 10>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vc0: mmu@fe6b0000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xfe6b0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 12>;
+			power-domains = <&sysc R8A77965_PD_A3VC>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vi0: mmu@febd0000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xfebd0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 14>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vp0: mmu@fe990000 {
+			compatible = "renesas,ipmmu-r8a77965";
+			reg = <0 0xfe990000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 16>;
+			power-domains = <&sysc R8A77965_PD_A3VP>;
+			#iommu-cells = <1>;
+		};
+
 		avb: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a77965",
 				     "renesas,etheravb-rcar-gen3";
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 623ebe435417..7beb1ce99d58 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
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
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 615a0d2edffc..28eccd1d3980 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/r8a77990-sysc.h>
 
 / {
 	compatible = "renesas,r8a77990";
@@ -210,6 +211,87 @@
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
-- 
2.11.0
