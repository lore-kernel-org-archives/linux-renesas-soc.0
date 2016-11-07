Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:42746 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932923AbcKGTJ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 14:09:59 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: r8a7794: Use SYSC "always-on" PM Domain for sound
Date: Mon,  7 Nov 2016 20:10:04 +0100
Message-Id: <1478545804-1330-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hook up the Audio-DMAC and sound device nodes to the SYSC "always-on" PM
Domain, for a more consistent device-power-area description in DT.

Cfr. commit 0761ff2ad0c581f3 ("ARM: dts: r8a7794: Add SYSC PM Domains").

Fixes: 320d6c5a08a4abd3 ("ARM: dts: r8a7794: add sound support")
Fixes: 298e4ee3d213a076 ("ARM: dts: r8a7794: add Audio-DMAC support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Due to race condition between audio support and SYSC PM Domains patch
series.

 arch/arm/boot/dts/r8a7794.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 7d9f0601d3ca8def..364b4aa8d1c1aa28 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -319,7 +319,7 @@
 				  "ch12";
 		clocks = <&mstp5_clks R8A7794_CLK_AUDIO_DMAC0>;
 		clock-names = "fck";
-		power-domains = <&cpg_clocks>;
+		power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
 		#dma-cells = <1>;
 		dma-channels = <13>;
 	};
@@ -1485,7 +1485,7 @@
 			      "mix.0", "mix.1",
 			      "dvc.0", "dvc.1",
 			      "clk_a", "clk_b", "clk_c", "clk_i";
-		power-domains = <&cpg_clocks>;
+		power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
 
 		status = "disabled";
 
-- 
1.9.1
