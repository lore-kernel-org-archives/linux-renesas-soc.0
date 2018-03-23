Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:46165 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755321AbeCWLc7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Mar 2018 07:32:59 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: r8a77965: Add PWM device nodes
Date: Fri, 23 Mar 2018 20:32:51 +0900
Message-Id: <1521804771-27735-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds PWM device nodes for r8a77965.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 48 ++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 6f748e94a..5dc6a7c 100644
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
 
 		du: display@feb00000 {
-- 
1.9.1
