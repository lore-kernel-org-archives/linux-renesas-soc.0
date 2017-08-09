Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53767 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752228AbdHII0y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 04:26:54 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 1/3] ARM: dts: r8a7790: Use R-Car SATA Gen2 fallback compat string
Date: Wed,  9 Aug 2017 10:26:41 +0200
Message-Id: <1502267203-12229-2-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1502267203-12229-1-git-send-email-horms+renesas@verge.net.au>
References: <1502267203-12229-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car SATA Gen2 fallback compat string
in the DT of the r8a7790 SoC.

This should have no run-time effect as the driver matches against
the per-SoC compat string before the fallback compat string is considered.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7790.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 167fd57aea68..16358bf8d1db 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -873,7 +873,7 @@
 	};
 
 	sata0: sata@ee300000 {
-		compatible = "renesas,sata-r8a7790";
+		compatible = "renesas,sata-r8a7790", "renesas,rcar-gen2-sata";
 		reg = <0 0xee300000 0 0x2000>;
 		interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp8_clks R8A7790_CLK_SATA0>;
@@ -882,7 +882,7 @@
 	};
 
 	sata1: sata@ee500000 {
-		compatible = "renesas,sata-r8a7790";
+		compatible = "renesas,sata-r8a7790", "renesas,rcar-gen2-sata";
 		reg = <0 0xee500000 0 0x2000>;
 		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp8_clks R8A7790_CLK_SATA1>;
-- 
2.1.4
