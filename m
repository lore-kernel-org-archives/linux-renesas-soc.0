Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753643AbeCPOyI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:54:08 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 31/52] ARM: dts: r8a7743: Add VSP support
Date: Fri, 16 Mar 2018 15:52:50 +0100
Message-Id: <0565605aa9887a3d6423fb08c0cbb0de3a22f838.1521208546.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521208546.git.horms+renesas@verge.net.au>
References: <cover.1521208546.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Add VSP support to SoC DT.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7743.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 11a1263211eb..1d9073ba0ce0 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -1630,6 +1630,33 @@
 			status = "disabled";
 		};
 
+		vsp@fe928000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe928000 0 0x8000>;
+			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 131>;
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 131>;
+		};
+
+		vsp@fe930000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe930000 0 0x8000>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 128>;
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 128>;
+		};
+
+		vsp@fe938000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe938000 0 0x8000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 127>;
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 127>;
+		};
+
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7743";
 			reg = <0 0xfeb00000 0 0x40000>,
-- 
2.11.0
