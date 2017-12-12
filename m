Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57806 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751234AbdLLI16 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 03:27:58 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] arm64: dts: renesas: r8a7795: sort subnodes of root node alphabetically
Date: Tue, 12 Dec 2017 09:27:52 +0100
Message-Id: <20171212082752.12806-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sort root sub-nodes alphabetically for allow for easier maintenance
of this file.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

 Based on renesas-devel-20171211-v4.15-rc3

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index a851c88e1e04..62dfc7781cc1 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -30,11 +30,6 @@
 		i2c7 = &i2c_dvfs;
 	};
 
-	psci {
-		compatible = "arm,psci-1.0", "arm,psci-0.2";
-		method = "smc";
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -208,6 +203,11 @@
 				     <&a53_3>;
 	};
 
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
-- 
2.11.0
