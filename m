Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:59220 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754345AbeFTNx1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jun 2018 09:53:27 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77990: Remove non-existing STBE region
Date: Wed, 20 Jun 2018 15:53:23 +0200
Message-Id: <20180620135323.29225-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car E3 does not have the Stream Buffer for EtherAVB-IF (STBE).

Note that the RAVB driver does not use this region.

Fixes: 913a78b575c313b8 ("arm64: dts: renesas: r8a77990: Add EthernetAVB device nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index f8004608c5954913..615a0d2edffc150f 100644
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
2.17.1
