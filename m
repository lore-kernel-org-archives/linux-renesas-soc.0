Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:57960 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751108AbeFHLQn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jun 2018 07:16:43 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a77970: Fix VSP registers range
Date: Fri,  8 Jun 2018 14:16:54 +0300
Message-Id: <20180608111655.2725-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R8A77970 VSP and FCP nodes have overlapping register ranges, as the
SoC integrates the FCP devices in the memory range usually used by the
VSP LUT and CLUT, which are not present. Fix this by shortening the VSP
registers range to 0x5000.

Fixes: b4f92030d5d3 ("arm64: dts: renesas: r8a77970: add VSPD support")
Reported-by: Simon Horman <horms+renesas@verge.net.au>
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 98a2317a16c4..89dc4e343b7c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -776,7 +776,7 @@
 
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea20000 0 0x8000>;
+			reg = <0 0xfea20000 0 0x5000>;
 			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 623>;
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
-- 
Regards,

Laurent Pinchart
