Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42651 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbdGaPDs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:03:48 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 21/31] arm64: dts: r8a7796: Add missing second pair of DMA names to MSIOF nodes
Date: Mon, 31 Jul 2017 17:03:13 +0200
Message-Id: <71adc330aa7d88e7c64c66d28ff7b71ddab25465.1501509526.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501509525.git.horms+renesas@verge.net.au>
References: <cover.1501509525.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

MSIOF0 and MSIOF1 are tied to two DMA controllers through two pairs of
DMA specifiers.  However, the second pair of corresponding DMA names was
missing.

Fixes: 80fab06e258da762 ("arm64: dts: r8a7796: Add all MSIOF nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 016cdd0bf289..ef1120f4e561 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -999,7 +999,7 @@
 			clocks = <&cpg CPG_MOD 211>;
 			dmas = <&dmac1 0x41>, <&dmac1 0x40>,
 			       <&dmac2 0x41>, <&dmac2 0x40>;
-			dma-names = "tx", "rx";
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 211>;
 			#address-cells = <1>;
@@ -1015,7 +1015,7 @@
 			clocks = <&cpg CPG_MOD 210>;
 			dmas = <&dmac1 0x43>, <&dmac1 0x42>,
 			       <&dmac2 0x43>, <&dmac2 0x42>;
-			dma-names = "tx", "rx";
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 210>;
 			#address-cells = <1>;
-- 
2.1.4
