Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52195 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757276AbcKXUP0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2016 15:15:26 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH renesas-next 2/3] ARM: dts: r8a7778: Use SoC-specific compat string for mmcif
Date: Thu, 24 Nov 2016 21:15:13 +0100
Message-Id: <1480018514-31718-3-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1480018514-31718-1-git-send-email-horms+renesas@verge.net.au>
References: <1480018514-31718-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use the SoC-specific compat string for mmcif in DT for the r8a7778 SoC.
This is in keeping with the use of compat strings for mmcif for other
Renesas ARM based SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7778.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index f3ffe1d31544..1e59eda8e66e 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -369,7 +369,7 @@
 	};
 
 	mmcif: mmc@ffe4e000 {
-		compatible = "renesas,sh-mmcif";
+		compatible = "renesas,mmcif-r8a7778", "renesas,sh-mmcif";
 		reg = <0xffe4e000 0x100>;
 		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7778_CLK_MMC>;
-- 
2.7.0.rc3.207.g0ac5344
