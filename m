Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbeLFV7Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:24 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 24/34] ARM: dts: r8a7744: Add VSP support
Date: Thu,  6 Dec 2018 13:58:19 -0800
Message-Id: <eddcbe813dd3c8247840859bf4d04b3423d35f8f.1544125558.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544125558.git.horms+renesas@verge.net.au>
References: <cover.1544125558.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Add VSP support to SoC DT.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7744.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 094e1c4107e9..be84400c08ad 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -1367,6 +1367,33 @@
 			resets = <&cpg 408>;
 		};
 
+		vsp@fe928000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe928000 0 0x8000>;
+			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 131>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 131>;
+		};
+
+		vsp@fe930000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe930000 0 0x8000>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 128>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 128>;
+		};
+
+		vsp@fe938000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe938000 0 0x8000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 127>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 127>;
+		};
+
 		du: display@feb00000 {
 			reg = <0 0xfeb00000 0 0x40000>,
 			      <0 0xfeb90000 0 0x1c>;
-- 
2.11.0
