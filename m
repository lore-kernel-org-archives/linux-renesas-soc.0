Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47467 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754878AbdLFKX2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 05:23:28 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 25/61] ARM: dts: r8a7792: Use R-Car SDHI Gen2 fallback compat string
Date: Wed,  6 Dec 2017 11:22:20 +0100
Message-Id: <40fcacbe2f6c7a7efea9be683e62bde34afe7c13.1512555546.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512555546.git.horms+renesas@verge.net.au>
References: <cover.1512555546.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car SDHI Gen2 fallback compat string
in the DT of the r8a7792 SoC.

This should have no run-time effect as the driver matches against
the per-SoC compat string before considering the fallback compat string.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index 131f65b0426e..7b394273031e 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -507,7 +507,8 @@
 		};
 
 		sdhi0: sd@ee100000 {
-			compatible = "renesas,sdhi-r8a7792";
+			compatible = "renesas,sdhi-r8a7792",
+				     "renesas,rcar-gen2-sdhi";
 			reg = <0 0xee100000 0 0x328>;
 			interrupts = <0 165 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
-- 
2.11.0
