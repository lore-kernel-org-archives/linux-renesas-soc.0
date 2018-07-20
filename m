Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33214 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbeGTMvl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 08:51:41 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/9] arm64: dts: renesas: r8a77990: Remove non-existing STBE region
Date: Fri, 20 Jul 2018 14:03:32 +0200
Message-Id: <4b03df5fc8c65659e41c3531b627ff615ed8ede9.1532087303.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1532087303.git.horms+renesas@verge.net.au>
References: <cover.1532087303.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

R-Car E3 does not have the Stream Buffer for EtherAVB-IF (STBE).

Note that the RAVB driver does not use this region.

Fixes: 913a78b575c313b8 ("arm64: dts: renesas: r8a77990: Add EthernetAVB device nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index f8004608c595..615a0d2edffc 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -213,7 +213,7 @@
 		avb: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a77990",
 				     "renesas,etheravb-rcar-gen3";
-			reg = <0 0xe6800000 0 0x800>, <0 0xe6a00000 0 0x10000>;
+			reg = <0 0xe6800000 0 0x800>;
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.11.0
