Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753755AbeCPOwv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:52:51 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 51/69] arm64: dts: renesas: r8a77965: Add IIC-DVFS device node
Date: Fri, 16 Mar 2018 15:51:21 +0100
Message-Id: <8952792267fb3e14c8498e6ea9284e0da3f91a1f.1521206129.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521206129.git.horms+renesas@verge.net.au>
References: <cover.1521206129.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Populate the device node for the IIC Bus Interface for DVFS (IIC for
DVFS) on R-Car M3-N, and add an alias to fix its bus number.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 8c9648a24ee0..c1ecc1b8385f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -18,6 +18,10 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		i2c7 = &i2c_dvfs;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
@@ -663,9 +667,17 @@
 		i2c_dvfs: i2c@e60b0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-
+			compatible = "renesas,iic-r8a77965",
+				     "renesas,rcar-gen3-iic",
+				     "renesas,rmobile-iic";
 			reg = <0 0xe60b0000 0 0x425>;
-			/* placeholder */
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 926>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 926>;
+			dmas = <&dmac0 0x11>, <&dmac0 0x10>;
+			dma-names = "tx", "rx";
+			status = "disabled";
 		};
 
 		pwm0: pwm@e6e30000 {
-- 
2.11.0
