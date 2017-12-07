Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35788 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752484AbdLGJy6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 04:54:58 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 19/54] arm64: dts: renesas: r8a7795: Add IPMMU device nodes
Date: Thu,  7 Dec 2017 10:53:22 +0100
Message-Id: <3b7e7848f0e88b369519e8f479cdabf6eb998af5.1512640145.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512640145.git.horms+renesas@verge.net.au>
References: <cover.1512640145.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add r8a7795 IPMMU nodes and keep all disabled by default.

This includes all IPMMU devices for r8a7795 ES2.0. Those
not present in r8a7795 ES1.x are removed from the DT for those
SoCs using delete-node. A follow-up patch will add IPMMU devices
to ES1.x which are not also present in ES2.0.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi |  25 +++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 145 +++++++++++++++++++++++++++
 2 files changed, 170 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 655dd30639c5..246323eacb56 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -21,6 +21,11 @@
 		status = "disabled";
 	};
 
+	/delete-node/ mmu@febe0000;
+	/delete-node/ mmu@fe980000;
+	/delete-node/ mmu@fd960000;
+	/delete-node/ mmu@fd970000;
+
 	/delete-node/ usb-phy@ee0e0200;
 	/delete-node/ usb@ee0e0100;
 	/delete-node/ usb@ee0e0000;
@@ -86,6 +91,26 @@
 	};
 };
 
+&ipmmu_vi0 {
+	renesas,ipmmu-main = <&ipmmu_mm 11>;
+};
+
+&ipmmu_vp0 {
+	renesas,ipmmu-main = <&ipmmu_mm 12>;
+};
+
+&ipmmu_vc0 {
+	renesas,ipmmu-main = <&ipmmu_mm 9>;
+};
+
+&ipmmu_vc1 {
+	renesas,ipmmu-main = <&ipmmu_mm 10>;
+};
+
+&ipmmu_rt {
+	renesas,ipmmu-main = <&ipmmu_mm 7>;
+};
+
 &du {
 	vsps = <&vspd0 &vspd1 &vspd2 &vspd3>;
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 42c51f2ec30b..1a091bb41b7f 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -421,6 +421,151 @@
 			resets = <&cpg 407>;
 		};
 
+		ipmmu_vi0: mmu@febd0000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfebd0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 14>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_vi1: mmu@febe0000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfebe0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 15>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_vp0: mmu@fe990000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfe990000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 16>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_vp1: mmu@fe980000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfe980000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 17>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_vc0: mmu@fe6b0000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfe6b0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 12>;
+			power-domains = <&sysc R8A7795_PD_A3VC>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_vc1: mmu@fe6f0000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfe6f0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 13>;
+			power-domains = <&sysc R8A7795_PD_A3VC>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_pv0: mmu@fd800000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfd800000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 6>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_pv2: mmu@fd960000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfd960000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 8>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_pv3: mmu@fd970000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xfd970000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 9>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_ir: mmu@ff8b0000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xff8b0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 3>;
+			power-domains = <&sysc R8A7795_PD_A3IR>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_hc: mmu@e6570000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xe6570000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 2>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_rt: mmu@ffc80000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xffc80000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 10>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_mp0: mmu@ec670000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xec670000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 4>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_ds0: mmu@e6740000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xe6740000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_ds1: mmu@e7740000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xe7740000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
+		ipmmu_mm: mmu@e67b0000 {
+			compatible = "renesas,ipmmu-r8a7795";
+			reg = <0 0xe67b0000 0 0x1000>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#iommu-cells = <1>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a7795",
 				     "renesas,rcar-dmac";
-- 
2.11.0
