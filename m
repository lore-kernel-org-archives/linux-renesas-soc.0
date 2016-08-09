Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36599 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932273AbcHIM3K (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 9 Aug 2016 08:29:10 -0400
Received: from avalon.bb.dnainternet.fi (85-23-193-79.bb.dnainternet.fi [85.23.193.79])
	by galahad.ideasonboard.com (Postfix) with ESMTPSA id E49E1208A2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Aug 2016 14:28:56 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: dts: renesas: r8a7795: Add VSP instances
Date: Tue,  9 Aug 2016 15:29:10 +0300
Message-Id: <1470745752-23738-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The r8a7795 has 9 VSP instances.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 90 ++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index f8b1c421e845..d9c6653471f4 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1274,6 +1274,16 @@
 			status = "disabled";
 		};
 
+		vspbc: vsp@fe920000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe920000 0 0x8000>;
+			interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 624>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+
+			renesas,fcp = <&fcpvb1>;
+		};
+
 		fcpvb1: fcp@fe92f000 {
 			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
 			reg = <0 0xfe92f000 0 0x200>;
@@ -1302,6 +1312,16 @@
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
+		vspbd: vsp@fe960000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe960000 0 0x8000>;
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 626>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+
+			renesas,fcp = <&fcpvb0>;
+		};
+
 		fcpvb0: fcp@fe96f000 {
 			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
 			reg = <0 0xfe96f000 0 0x200>;
@@ -1309,6 +1329,16 @@
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
+		vspi0: vsp@fe9a0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe9a0000 0 0x8000>;
+			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 631>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+
+			renesas,fcp = <&fcpvi0>;
+		};
+
 		fcpvi0: fcp@fe9af000 {
 			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
 			reg = <0 0xfe9af000 0 0x200>;
@@ -1316,6 +1346,16 @@
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
+		vspi1: vsp@fe9b0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe9b0000 0 0x8000>;
+			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 630>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+
+			renesas,fcp = <&fcpvi1>;
+		};
+
 		fcpvi1: fcp@fe9bf000 {
 			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
 			reg = <0 0xfe9bf000 0 0x200>;
@@ -1323,6 +1363,16 @@
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
+		vspi2: vsp@fe9c0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe9c0000 0 0x8000>;
+			interrupts = <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 629>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+
+			renesas,fcp = <&fcpvi2>;
+		};
+
 		fcpvi2: fcp@fe9cf000 {
 			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
 			reg = <0 0xfe9cf000 0 0x200>;
@@ -1330,6 +1380,16 @@
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
+		vspd0: vsp@fea20000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea20000 0 0x4000>;
+			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 623>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+
+			renesas,fcp = <&fcpvd0>;
+		};
+
 		fcpvd0: fcp@fea27000 {
 			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
 			reg = <0 0xfea27000 0 0x200>;
@@ -1337,6 +1397,16 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 		};
 
+		vspd1: vsp@fea28000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea28000 0 0x4000>;
+			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 622>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+
+			renesas,fcp = <&fcpvd1>;
+		};
+
 		fcpvd1: fcp@fea2f000 {
 			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
 			reg = <0 0xfea2f000 0 0x200>;
@@ -1344,6 +1414,16 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 		};
 
+		vspd2: vsp@fea30000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea30000 0 0x4000>;
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 621>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+
+			renesas,fcp = <&fcpvd2>;
+		};
+
 		fcpvd2: fcp@fea37000 {
 			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
 			reg = <0 0xfea37000 0 0x200>;
@@ -1351,6 +1431,16 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 		};
 
+		vspd3: vsp@fea38000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea38000 0 0x4000>;
+			interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 620>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+
+			renesas,fcp = <&fcpvd3>;
+		};
+
 		fcpvd3: fcp@fea3f000 {
 			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
 			reg = <0 0xfea3f000 0 0x200>;
-- 
Regards,

Laurent Pinchart
