Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58074 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729176AbeI1Qpa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 12:45:30 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 4/7] ARM: dts: r8a77470: Add SMP support
Date: Fri, 28 Sep 2018 12:22:11 +0200
Message-Id: <a21efdbc744c999d79ba86629a5ae35e2cba1e13.1538123642.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1538123642.git.horms+renesas@verge.net.au>
References: <cover.1538123642.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Add DT node for the Advanced Power Management Unit (APMU), add the
second CPU core, and use "renesas,apmu" as "enable-method".

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a77470.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index c053a28cd132..9aba350f3eaa 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -17,6 +17,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -28,6 +29,15 @@
 			next-level-cache = <&L2_CA7>;
 		};
 
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <1>;
+			clock-frequency = <1000000000>;
+			clocks = <&cpg CPG_CORE R8A77470_CLK_Z2>;
+			power-domains = <&sysc R8A77470_PD_CA7_CPU1>;
+			next-level-cache = <&L2_CA7>;
+		};
 
 		L2_CA7: cache-controller-0 {
 			compatible = "cache";
@@ -167,6 +177,12 @@
 			#reset-cells = <1>;
 		};
 
+		apmu@e6151000 {
+			compatible = "renesas,r8a77470-apmu", "renesas,apmu";
+			reg = <0 0xe6151000 0 0x188>;
+			cpus = <&cpu0 &cpu1>;
+		};
+
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a77470-rst";
 			reg = <0 0xe6160000 0 0x100>;
-- 
2.11.0
