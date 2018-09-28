Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57700 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729118AbeI1Qng (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 12:43:36 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 01/14] arm64: dts: renesas: Remove unneeded status from thermal nodes
Date: Fri, 28 Sep 2018 12:20:12 +0200
Message-Id: <c79661eb5060e2bf18875d86caf3324b4ab4c03f.1538125184.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1538125184.git.horms+renesas@verge.net.au>
References: <cover.1538125184.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The thermal device is supposed to be always enabled.  As the default
value of the status property is "okay", there is no need to make this
explicit in SoC-specific .dtsi files where no override is involved.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 1 -
 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 1 -
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 1 -
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 046fc937da14..012cbb64246e 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -358,7 +358,6 @@
 			power-domains = <&sysc 32>;
 			resets = <&cpg 522>;
 			#thermal-sensor-cells = <1>;
-			status = "okay";
 		};
 
 		intc_ex: interrupt-controller@e61c0000 {
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index abb361e41ef6..83077fdd7e4a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -455,7 +455,6 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 522>;
 			#thermal-sensor-cells = <1>;
-			status = "okay";
 		};
 
 		intc_ex: interrupt-controller@e61c0000 {
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 28a0794a4190..947bfc2fe335 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -434,7 +434,6 @@
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 522>;
 			#thermal-sensor-cells = <1>;
-			status = "okay";
 		};
 
 		intc_ex: interrupt-controller@e61c0000 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 3437d5e34f6a..31d23196e720 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -350,7 +350,6 @@
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 522>;
 			#thermal-sensor-cells = <1>;
-			status = "okay";
 		};
 
 		intc_ex: interrupt-controller@e61c0000 {
-- 
2.11.0
