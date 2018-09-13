Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34748 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbeIMOTL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 10:19:11 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 34/58] arm64: dts: renesas: r8a774a1: Add PWM device nodes
Date: Thu, 13 Sep 2018 11:09:29 +0200
Message-Id: <9567a8566850936688c08a6392a3324631f9daeb.1536828567.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1536828567.git.horms+renesas@verge.net.au>
References: <cover.1536828567.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

This patch adds PWM[0123456] device nodes to the RZ/G2M (a.k.a R8A774A1)
device tree.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 70 +++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index dde188004283..c9ac545f08f3 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -816,6 +816,76 @@
 			status = "disabled";
 		};
 
+		pwm0: pwm@e6e30000 {
+			compatible = "renesas,pwm-r8a774a1", "renesas,pwm-rcar";
+			reg = <0 0xe6e30000 0 0x8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@e6e31000 {
+			compatible = "renesas,pwm-r8a774a1", "renesas,pwm-rcar";
+			reg = <0 0xe6e31000 0 0x8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@e6e32000 {
+			compatible = "renesas,pwm-r8a774a1", "renesas,pwm-rcar";
+			reg = <0 0xe6e32000 0 0x8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@e6e33000 {
+			compatible = "renesas,pwm-r8a774a1", "renesas,pwm-rcar";
+			reg = <0 0xe6e33000 0 0x8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@e6e34000 {
+			compatible = "renesas,pwm-r8a774a1", "renesas,pwm-rcar";
+			reg = <0 0xe6e34000 0 0x8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@e6e35000 {
+			compatible = "renesas,pwm-r8a774a1", "renesas,pwm-rcar";
+			reg = <0 0xe6e35000 0 0x8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@e6e36000 {
+			compatible = "renesas,pwm-r8a774a1", "renesas,pwm-rcar";
+			reg = <0 0xe6e36000 0 0x8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
+		};
+
 		scif0: serial@e6e60000 {
 			compatible = "renesas,scif-r8a774a1",
 				     "renesas,rcar-gen3-scif", "renesas,scif";
-- 
2.11.0
