Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52202 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965155AbcKXUPa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2016 15:15:30 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH renesas-next 1/3] ARM: dts: r8a73a4: Use SoC-specific compat string for mmcif
Date: Thu, 24 Nov 2016 21:15:12 +0100
Message-Id: <1480018514-31718-2-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1480018514-31718-1-git-send-email-horms+renesas@verge.net.au>
References: <1480018514-31718-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use the SoC-specific compat string for mmcif in DT for the r8a73a4 SoC.
This is in keeping with the use of compat strings for mmcif for other
Renesas ARM based SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a73a4.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index 53183ffe04c1..b138584b8800 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -440,7 +440,7 @@
 	};
 
 	mmcif0: mmc@ee200000 {
-		compatible = "renesas,sh-mmcif";
+		compatible = "renesas,mmcif-r8a73a4", "renesas,sh-mmcif";
 		reg = <0 0xee200000 0 0x80>;
 		interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A73A4_CLK_MMCIF0>;
@@ -450,7 +450,7 @@
 	};
 
 	mmcif1: mmc@ee220000 {
-		compatible = "renesas,sh-mmcif";
+		compatible = "renesas,mmcif-r8a73a4", "renesas,sh-mmcif";
 		reg = <0 0xee220000 0 0x80>;
 		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A73A4_CLK_MMCIF1>;
-- 
2.7.0.rc3.207.g0ac5344
