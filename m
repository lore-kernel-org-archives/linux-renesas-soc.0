Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35788 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752151AbdLGJzU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 04:55:20 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 40/54] arm64: dts: renesas: r8a77995: Add CAN support
Date: Thu,  7 Dec 2017 10:53:43 +0100
Message-Id: <acaa51a35828d1188e1917d08a3c8c0447d3109b.1512640145.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512640145.git.horms+renesas@verge.net.au>
References: <cover.1512640145.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Adds CAN controller nodes for r8a77995.

Based on a patch for r8a7796 by Chris Paterson.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 0f78592d993c..b2c8db15db53 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -346,6 +346,38 @@
 			resets = <&cpg 906>;
 		};
 
+		can0: can@e6c30000 {
+			compatible = "renesas,can-r8a77995",
+				     "renesas,rcar-gen3-can";
+			reg = <0 0xe6c30000 0 0x1000>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 916>,
+			       <&cpg CPG_CORE R8A77995_CLK_CANFD>,
+			       <&can_clk>;
+			clock-names = "clkp1", "clkp2", "can_clk";
+			assigned-clocks = <&cpg CPG_CORE R8A77995_CLK_CANFD>;
+			assigned-clock-rates = <40000000>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 916>;
+			status = "disabled";
+		};
+
+		can1: can@e6c38000 {
+			compatible = "renesas,can-r8a77995",
+				     "renesas,rcar-gen3-can";
+			reg = <0 0xe6c38000 0 0x1000>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>,
+			       <&cpg CPG_CORE R8A77995_CLK_CANFD>,
+			       <&can_clk>;
+			clock-names = "clkp1", "clkp2", "can_clk";
+			assigned-clocks = <&cpg CPG_CORE R8A77995_CLK_CANFD>;
+			assigned-clock-rates = <40000000>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			status = "disabled";
+		};
+
 		avb: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a77995",
 				     "renesas,etheravb-rcar-gen3";
-- 
2.11.0
