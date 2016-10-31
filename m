Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:42881 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S944932AbcJaRIY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Oct 2016 13:08:24 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        Magnus Damm <damm+renesas@opensource.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/5] arm64: dts: r8a7796: Add IPMMU device nodes
Date: Mon, 31 Oct 2016 18:08:19 +0100
Message-Id: <1477933702-13423-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1477933702-13423-1-git-send-email-geert+renesas@glider.be>
References: <1477933702-13423-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add r8a7796 IPMMU nodes and keep all disabled by default.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 89 ++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index a0ba2fa47803762b..824d2c7831621386 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -234,6 +234,95 @@
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
-- 
1.9.1
