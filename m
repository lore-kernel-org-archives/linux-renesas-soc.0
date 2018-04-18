Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:35494 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752261AbeDRUO7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 16:14:59 -0400
Received: by mail-pg0-f68.google.com with SMTP id j11so1378642pgf.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Apr 2018 13:14:59 -0700 (PDT)
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] arm64: dts: renesas: r8a77995: sort subnodes of the root node
Date: Thu, 19 Apr 2018 05:14:36 +0900
Message-Id: <1524082480-18163-2-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1524082480-18163-1-git-send-email-ykaneko0929@gmail.com>
References: <1524082480-18163-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sort subnodes of the root node alphanumerically.

This is part of an ongoing effort to provide consistent node
order in the DT of Renesas SoCs to improve maintainability.

This should not have any run-time effect.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 82aed7e..cf47655 100644
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
1.9.1
