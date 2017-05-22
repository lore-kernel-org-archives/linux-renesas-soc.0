Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47786 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933918AbdEVOAD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 10:00:03 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 26/35] arm64: dts: r8a7796: Add PWM device nodes
Date: Mon, 22 May 2017 15:58:59 +0200
Message-Id: <eaef33106799e3e58984479d85c80ddf94f9159d.1495457812.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1495457812.git.horms+renesas@verge.net.au>
References: <cover.1495457812.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds PWM{0,1,2,3,4,5,6} device nodes for R8A7796 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[uli: added resets, shortened reg lengths to 8]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 70 ++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 8651fc93304d..b418a66f4cec 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -395,6 +395,76 @@
 			status = "disabled";
 		};
 
+		pwm0: pwm@e6e30000 {
+			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
+			reg = <0 0xe6e30000 0 8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@e6e31000 {
+			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
+			reg = <0 0xe6e31000 0 8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@e6e32000 {
+			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
+			reg = <0 0xe6e32000 0 8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@e6e33000 {
+			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
+			reg = <0 0xe6e33000 0 8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@e6e34000 {
+			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
+			reg = <0 0xe6e34000 0 8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@e6e35000 {
+			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
+			reg = <0 0xe6e35000 0 8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@e6e36000 {
+			compatible = "renesas,pwm-r8a7796", "renesas,pwm-rcar";
+			reg = <0 0xe6e36000 0 8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@e6500000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.1.4
