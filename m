Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:58866 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750781AbeECNCp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 May 2018 09:02:45 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/3] arm64: dts: renesas: r8a7796: Correct whitespace
Date: Thu,  3 May 2018 14:38:29 +0200
Message-Id: <1525351110-13403-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1525351110-13403-1-git-send-email-geert+renesas@glider.be>
References: <1525351110-13403-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add missing spaces after commas.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rebased.

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 3fbd86590fb0ed4c..6ffab2da07cb9d67 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -143,7 +143,7 @@
 		};
 
 		a57_1: cpu@1 {
-			compatible = "arm,cortex-a57","arm,armv8";
+			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0x1>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A7796_PD_CA57_CPU1>;
@@ -166,7 +166,7 @@
 		};
 
 		a53_1: cpu@101 {
-			compatible = "arm,cortex-a53","arm,armv8";
+			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x101>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A7796_PD_CA53_CPU1>;
@@ -177,7 +177,7 @@
 		};
 
 		a53_2: cpu@102 {
-			compatible = "arm,cortex-a53","arm,armv8";
+			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x102>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A7796_PD_CA53_CPU2>;
@@ -188,7 +188,7 @@
 		};
 
 		a53_3: cpu@103 {
-			compatible = "arm,cortex-a53","arm,armv8";
+			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x103>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A7796_PD_CA53_CPU3>;
-- 
2.7.4
