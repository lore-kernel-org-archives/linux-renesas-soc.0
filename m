Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbeLFV6e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:58:34 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 01/34] ARM: dts: r8a7743: Remove legacy "renesas,rcar-thermal" compatibility
Date: Thu,  6 Dec 2018 13:57:56 -0800
Message-Id: <6d2372fc77e45f23b1d20d9fe2844d2978ad9c93.1544125558.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544125558.git.horms+renesas@verge.net.au>
References: <cover.1544125558.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The thermal hardware description for the RZ/G1M SoC was added to its DTS
after the introduction of support for thermal zones, and included a
thermal-zones node from the beginning.

Hence there is no need to claim compatibility with
"renesas,rcar-thermal", which would be needed only for backwards
compatibility with kernels predating thermal zone support.

Fixes: 6c76b4f7d89e89f0 ("ARM: dts: r8a7743: Add thermal device to DT")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7743.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 24715f74ae08..3cc33f7ff7fe 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -348,8 +348,7 @@
 
 		thermal: thermal@e61f0000 {
 			compatible = "renesas,thermal-r8a7743",
-				     "renesas,rcar-gen2-thermal",
-				     "renesas,rcar-thermal";
+				     "renesas,rcar-gen2-thermal";
 			reg = <0 0xe61f0000 0 0x10>, <0 0xe61f0100 0 0x38>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 522>;
-- 
2.11.0
