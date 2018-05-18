Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeERLQY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:16:24 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 023/102] arm64: dts: renesas: r8a77995: sort subnodes of the root node
Date: Fri, 18 May 2018 13:14:45 +0200
Message-Id: <21559e2b0448cb43e880d46b1381008dc5e9707d.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Sort subnodes of the root node alphanumerically.

This is part of an ongoing effort to provide consistent node
order in the DT of Renesas SoCs to improve maintainability.

This should not have any run-time effect.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 82aed7ee984c..cf476556504a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -18,9 +18,11 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	psci {
-		compatible = "arm,psci-1.0", "arm,psci-0.2";
-		method = "smc";
+	/* External CAN clock - to be overridden by boards that provide it */
+	can_clk: can {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
 	};
 
 	cpus {
@@ -51,18 +53,16 @@
 		clock-frequency = <0>;
 	};
 
-	/* External CAN clock - to be overridden by boards that provide it */
-	can_clk: can {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <0>;
-	};
-
 	pmu_a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
 	scif_clk: scif {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.11.0
