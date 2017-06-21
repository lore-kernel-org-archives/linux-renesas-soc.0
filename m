Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52368 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751154AbdFUJbF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2017 05:31:05 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 42ADC209BD
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2017 11:30:32 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/7] arm64: dts: renesas: r8a7796: Add VSP instances
Date: Wed, 21 Jun 2017 12:31:29 +0300
Message-Id: <20170621093133.5677-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The r8a7796 has 5 VSP instances.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 28b0e2127021..ad9cd1c3199f 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1447,6 +1447,16 @@
 			power-domains = <&sysc R8A7796_PD_A3VC>;
 		};
 
+		vspb: vsp@fe960000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe960000 0 0x8000>;
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 626>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+
+			renesas,fcp = <&fcpvb0>;
+		};
+
 		fcpvb0: fcp@fe96f000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfe96f000 0 0x200>;
@@ -1454,6 +1464,16 @@
 			power-domains = <&sysc R8A7796_PD_A3VC>;
 		};
 
+		vspi0: vsp@fe9a0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe9a0000 0 0x8000>;
+			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 631>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+
+			renesas,fcp = <&fcpvi0>;
+		};
+
 		fcpvi0: fcp@fe9af000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfe9af000 0 0x200>;
@@ -1461,6 +1481,16 @@
 			power-domains = <&sysc R8A7796_PD_A3VC>;
 		};
 
+		vspd0: vsp@fea20000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea20000 0 0x4000>;
+			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 623>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+
+			renesas,fcp = <&fcpvd0>;
+		};
+
 		fcpvd0: fcp@fea27000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfea27000 0 0x200>;
@@ -1468,6 +1498,16 @@
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 		};
 
+		vspd1: vsp@fea28000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea28000 0 0x4000>;
+			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 622>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+
+			renesas,fcp = <&fcpvd1>;
+		};
+
 		fcpvd1: fcp@fea2f000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfea2f000 0 0x200>;
@@ -1475,6 +1515,16 @@
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 		};
 
+		vspd2: vsp@fea30000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea30000 0 0x4000>;
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 621>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+
+			renesas,fcp = <&fcpvd2>;
+		};
+
 		fcpvd2: fcp@fea37000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfea37000 0 0x200>;
-- 
Regards,

Laurent Pinchart
