Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbeLFV6r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:58:47 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 07/34] ARM: dts: r8a7744: Add Ethernet AVB support
Date: Thu,  6 Dec 2018 13:58:02 -0800
Message-Id: <d94369fe69fd235e2109331c41f28dcfcfac28eb.1544125558.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544125558.git.horms+renesas@verge.net.au>
References: <cover.1544125558.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Add Ethernet AVB support for R8A7744 SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7744.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index ea1a78288707..4d4ddbaba456 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -376,10 +376,16 @@
 		};
 
 		avb: ethernet@e6800000 {
+			compatible = "renesas,etheravb-r8a7744",
+				     "renesas,etheravb-rcar-gen2";
 			reg = <0 0xe6800000 0 0x800>, <0 0xee0e8000 0 0x4000>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 812>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 812>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			/* placeholder */
+			status = "disabled";
 		};
 
 		scifb1: serial@e6c30000 {
-- 
2.11.0
