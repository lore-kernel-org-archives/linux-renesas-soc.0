Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:57964 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751137AbeFHLQn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jun 2018 07:16:43 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a77995: Fix VSP registers range
Date: Fri,  8 Jun 2018 14:16:55 +0300
Message-Id: <20180608111655.2725-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180608111655.2725-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180608111655.2725-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R8A77995 VSP and FCP nodes have overlapping register ranges, as the
SoC integrates the FCP devices in the memory range usually used by the
VSP LUT and CLUT, which are not present. Fix this by shortening the VSP
registers range to 0x5000.

Fixes: 295952a183d3 ("arm64: dts: renesas: r8a77995: add VSP instances")
Reported-by: Simon Horman <horms+renesas@verge.net.au>
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index eb23c85c561b..49ca64285092 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -704,7 +704,7 @@
 
 		vspbs: vsp@fe960000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfe960000 0 0x8000>;
+			reg = <0 0xfe960000 0 0x5000>;
 			interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 627>;
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
@@ -714,7 +714,7 @@
 
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea20000 0 0x8000>;
+			reg = <0 0xfea20000 0 0x5000>;
 			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 623>;
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
@@ -724,7 +724,7 @@
 
 		vspd1: vsp@fea28000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea28000 0 0x8000>;
+			reg = <0 0xfea28000 0 0x5000>;
 			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 622>;
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
-- 
Regards,

Laurent Pinchart
