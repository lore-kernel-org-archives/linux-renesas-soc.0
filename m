Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:35834 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750947AbeECNCp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 May 2018 09:02:45 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/3] arm64: dts: renesas: r8a7795: Correct whitespace
Date: Thu,  3 May 2018 14:38:28 +0200
Message-Id: <1525351110-13403-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1525351110-13403-1-git-send-email-geert+renesas@glider.be>
References: <1525351110-13403-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add missing spaces after commas.
Replace 8 consecutive spaces by a TAB.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rebased.

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 9b080a864ea1ebe4..91486b4910cee3d7 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -132,7 +132,7 @@
 		};
 
 		a57_1: cpu@1 {
-			compatible = "arm,cortex-a57","arm,armv8";
+			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0x1>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A7795_PD_CA57_CPU1>;
@@ -144,7 +144,7 @@
 		};
 
 		a57_2: cpu@2 {
-			compatible = "arm,cortex-a57","arm,armv8";
+			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0x2>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A7795_PD_CA57_CPU2>;
@@ -156,7 +156,7 @@
 		};
 
 		a57_3: cpu@3 {
-			compatible = "arm,cortex-a57","arm,armv8";
+			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0x3>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A7795_PD_CA57_CPU3>;
@@ -179,7 +179,7 @@
 		};
 
 		a53_1: cpu@101 {
-			compatible = "arm,cortex-a53","arm,armv8";
+			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x101>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A7795_PD_CA53_CPU1>;
@@ -190,7 +190,7 @@
 		};
 
 		a53_2: cpu@102 {
-			compatible = "arm,cortex-a53","arm,armv8";
+			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x102>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A7795_PD_CA53_CPU2>;
@@ -201,7 +201,7 @@
 		};
 
 		a53_3: cpu@103 {
-			compatible = "arm,cortex-a53","arm,armv8";
+			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x103>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A7795_PD_CA53_CPU3>;
@@ -262,7 +262,7 @@
 	pmu_a57 {
 		compatible = "arm,cortex-a57-pmu";
 		interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
-		                      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
 				      <&gic GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
 				      <&gic GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&a57_0>,
-- 
2.7.4
