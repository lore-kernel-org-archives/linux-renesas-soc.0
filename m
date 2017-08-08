Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35269 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752624AbdHHIzm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2017 04:55:42 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/3] ARM: dts: r8a7791: Use R-Car GPIO Gen2 fallback compat string
Date: Tue,  8 Aug 2017 10:54:58 +0200
Message-Id: <1502182499-16210-3-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1502182499-16210-1-git-send-email-horms+renesas@verge.net.au>
References: <1502182499-16210-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car GPIO Gen2 fallback compat string
in the DT of the r8a7791 SoC.

This should have no run-time effect as the driver matches against
the per-SoC compat string before the fallback compat string is considered.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7791.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index ea4a8147d995..f1d1a9772153 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -933,7 +933,7 @@
 	};
 
 	sata0: sata@ee300000 {
-		compatible = "renesas,sata-r8a7791";
+		compatible = "renesas,sata-r8a7791", "renesas,rcar-gen2-sata";
 		reg = <0 0xee300000 0 0x2000>;
 		interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp8_clks R8A7791_CLK_SATA0>;
@@ -942,7 +942,7 @@
 	};
 
 	sata1: sata@ee500000 {
-		compatible = "renesas,sata-r8a7791";
+		compatible = "renesas,sata-r8a7791", "renesas,rcar-gen2-sata";
 		reg = <0 0xee500000 0 0x2000>;
 		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp8_clks R8A7791_CLK_SATA1>;
-- 
2.1.4
