Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54577 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754148AbdDGP6J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 11:58:09 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/4] arm64: dts: r8a7795: Correct SATA device size to 2MiB
Date: Fri,  7 Apr 2017 11:57:59 -0400
Message-Id: <e9f0089b2d8a3d450b8ec02eccfb92b950110fbe.1491578743.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1491578743.git.horms+renesas@verge.net.au>
References: <cover.1491578743.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Update the r8a7795 SATA device node to use a 2MiB I/O space as specified
in the "72. Serial-ATA" section of R-Car-Gen3-rev0.52E.pdf

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 55c09f1b89c9..e58175084b57 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1209,7 +1209,7 @@
 
 		sata: sata@ee300000 {
 			compatible = "renesas,sata-r8a7795";
-			reg = <0 0xee300000 0 0x1fff>;
+			reg = <0 0xee300000 0 0x200000>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 815>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-- 
2.7.0.rc3.207.g0ac5344
