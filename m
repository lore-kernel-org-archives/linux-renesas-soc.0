Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36673 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753392AbdCTI7u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:59:50 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 02/31] ARM: dts: r8a7743: Fix SCIFB0 dmas indentation
Date: Mon, 20 Mar 2017 09:57:41 +0100
Message-Id: <c8290f9f2e1d119512e1821fc13d1d145aa23f77.1489999062.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1489999062.git.horms+renesas@verge.net.au>
References: <cover.1489999062.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Fixes: 809c013426914694 ("ARM: dts: r8a7743: add [H]SCIF{A|B} support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7743.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index d8393b97768b..c166be2f18e0 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -277,7 +277,7 @@
 			clocks = <&cpg CPG_MOD 206>;
 			clock-names = "fck";
 			dmas = <&dmac0 0x3d>, <&dmac0 0x3e>,
-		       <&dmac1 0x3d>, <&dmac1 0x3e>;
+			       <&dmac1 0x3d>, <&dmac1 0x3e>;
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
 			status = "disabled";
-- 
2.7.0.rc3.207.g0ac5344
