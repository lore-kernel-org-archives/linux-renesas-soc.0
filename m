Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753782AbeCPOxI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:53:08 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 66/69] arm64: dts: renesas: r8a77970: sort subnodes of root node alphabetically
Date: Fri, 16 Mar 2018 15:51:36 +0100
Message-Id: <c7a99343cc30704c1d173de9bbe06adaa5e96101.1521206129.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521206129.git.horms+renesas@verge.net.au>
References: <cover.1521206129.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Sort root sub-nodes alphabetically for allow for easier maintenance of
this file.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index e44281cc1047..c6db8ea43906 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -27,11 +27,6 @@
 		i2c4 = &i2c4;
 	};
 
-	psci {
-		compatible = "arm,psci-1.0", "arm,psci-0.2";
-		method = "smc";
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -68,6 +63,11 @@
 		clock-frequency = <0>;
 	};
 
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
 	/* External SCIF clock - to be overridden by boards that provide it */
 	scif_clk: scif {
 		compatible = "fixed-clock";
-- 
2.11.0
