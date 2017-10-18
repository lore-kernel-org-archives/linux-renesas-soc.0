Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57830 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756832AbdJRH2L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2017 03:28:11 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 6/7] ARM: dts: r8a7793: Use R-Car Gen2 Ether fallback compat string
Date: Wed, 18 Oct 2017 09:27:27 +0200
Message-Id: <20171018072728.14681-7-horms+renesas@verge.net.au>
In-Reply-To: <20171018072728.14681-1-horms+renesas@verge.net.au>
References: <20171018072728.14681-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car Gen2 Ether fallback compat string
in the DT of the r8a7793 SoC.

This should have no run-time effect as the driver matches against
the per-SoC compat string before considering the fallback compat string.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7793.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 58eae569b4e0..196afec766c6 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -916,7 +916,8 @@
 	};
 
 	ether: ethernet@ee700000 {
-		compatible = "renesas,ether-r8a7793";
+		compatible = "renesas,ether-r8a7793",
+			     "renesas,rcar-gen2-ether";
 		reg = <0 0xee700000 0 0x400>;
 		interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 813>;
-- 
2.11.0
