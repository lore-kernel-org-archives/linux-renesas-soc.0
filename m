Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54642 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756141AbdDGP6d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 11:58:33 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 06/22] ARM: dts: alt: Correct clock of DU1
Date: Fri,  7 Apr 2017 11:58:07 -0400
Message-Id: <7f698bf60e3a13c991577f5360f371e2a41cf40e.1491580547.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1491580547.git.horms+renesas@verge.net.au>
References: <cover.1491580547.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The second channel of the display unit uses a different module clock
than the first channel.

Fixes: 876e7fb9f418fd86 ("ARM: shmobile: r8a7794: alt: Enable VGA port")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7794-alt.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index 3fcf76b8e923..f1eea13cdf44 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -168,7 +168,7 @@
 	status = "okay";
 
 	clocks = <&mstp7_clks R8A7794_CLK_DU0>,
-		 <&mstp7_clks R8A7794_CLK_DU0>,
+		 <&mstp7_clks R8A7794_CLK_DU1>,
 		 <&x13_clk>, <&x2_clk>;
 	clock-names = "du.0", "du.1", "dclkin.0", "dclkin.1";
 
-- 
2.7.0.rc3.207.g0ac5344
