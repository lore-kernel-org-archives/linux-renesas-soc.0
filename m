Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeERLQ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:16:28 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 014/102] arm64: dts: renesas: r8a77965: Add PWM device nodes
Date: Fri, 18 May 2018 13:14:36 +0200
Message-Id: <e3ddf00f87d998e81ac1e5c925145c24bb10411d.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

This patch adds PWM device nodes for r8a77965.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 48 ++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 4371be3e869a..a41f91653d93 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -770,39 +770,73 @@
 		};
 
 		pwm0: pwm@e6e30000 {
+			compatible = "renesas,pwm-r8a77965", "renesas,pwm-rcar";
 			reg = <0 0xe6e30000 0 8>;
-			/* placeholder */
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
 		};
 
 		pwm1: pwm@e6e31000 {
+			compatible = "renesas,pwm-r8a77965", "renesas,pwm-rcar";
 			reg = <0 0xe6e31000 0 8>;
 			#pwm-cells = <2>;
-			/* placeholder */
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
 		};
 
 		pwm2: pwm@e6e32000 {
+			compatible = "renesas,pwm-r8a77965", "renesas,pwm-rcar";
 			reg = <0 0xe6e32000 0 8>;
-			/* placeholder */
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
 		};
 
 		pwm3: pwm@e6e33000 {
+			compatible = "renesas,pwm-r8a77965", "renesas,pwm-rcar";
 			reg = <0 0xe6e33000 0 8>;
-			/* placeholder */
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
 		};
 
 		pwm4: pwm@e6e34000 {
+			compatible = "renesas,pwm-r8a77965", "renesas,pwm-rcar";
 			reg = <0 0xe6e34000 0 8>;
-			/* placeholder */
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
 		};
 
 		pwm5: pwm@e6e35000 {
+			compatible = "renesas,pwm-r8a77965", "renesas,pwm-rcar";
 			reg = <0 0xe6e35000 0 8>;
-			/* placeholder */
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
 		};
 
 		pwm6: pwm@e6e36000 {
+			compatible = "renesas,pwm-r8a77965", "renesas,pwm-rcar";
 			reg = <0 0xe6e36000 0 8>;
-			/* placeholder */
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc 32>;
+			status = "disabled";
 		};
 
 		msiof0: spi@e6e90000 {
-- 
2.11.0
