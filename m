Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35255 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbeKZXtN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 18:49:13 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 01/40] arm64: dts: renesas: r8a774a1: Add CAN nodes
Date: Mon, 26 Nov 2018 13:54:27 +0100
Message-Id: <b823d65f3380e9d7dd19c8e015dd7f22a0a09957.1543229515.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1543229515.git.horms+renesas@verge.net.au>
References: <cover.1543229515.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Chris Paterson <chris.paterson2@renesas.com>

Add the device nodes for both RZ/G2M CAN channels.

Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 012cbb64246e..a4817a012e11 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -873,6 +873,30 @@
 			status = "disabled";
 		};
 
+		can0: can@e6c30000 {
+			compatible = "renesas,can-r8a774a1",
+				     "renesas,rcar-gen3-can";
+			reg = <0 0xe6c30000 0 0x1000>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 916>, <&can_clk>;
+			clock-names = "clkp1", "can_clk";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 916>;
+			status = "disabled";
+		};
+
+		can1: can@e6c38000 {
+			compatible = "renesas,can-r8a774a1",
+				     "renesas,rcar-gen3-can";
+			reg = <0 0xe6c38000 0 0x1000>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>, <&can_clk>;
+			clock-names = "clkp1", "can_clk";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 915>;
+			status = "disabled";
+		};
+
 		pwm0: pwm@e6e30000 {
 			compatible = "renesas,pwm-r8a774a1", "renesas,pwm-rcar";
 			reg = <0 0xe6e30000 0 0x8>;
-- 
2.11.0
