Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:40858 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755197AbdEOJwl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 05:52:41 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>
Subject: [PATCH] arm64: dts: renesas: r8a7795: Use GIC_SPI for HDMI interrupts
Date: Mon, 15 May 2017 12:52:41 +0300
Message-Id: <20170515095241.17703-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use the GIC_SPI macro instead of hardcoding its value in the HDMI
interrupts specifiers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Hi Simon,

Sorry for having messed that up in the original patch :-/ Feel free to squash
this fix in "arm64: dts: renesas: r8a7795: Add HDMI encoder support" if you
want to rebase, or just apply it on top.

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 1aad7433b460..ee0129634cdf 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1761,7 +1761,7 @@
 		hdmi0: hdmi0@fead0000 {
 			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
 			reg = <0 0xfead0000 0 0x10000>;
-			interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 729>, <&cpg CPG_CORE R8A7795_CLK_HDMI>;
 			clock-names = "iahb", "isfr";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -1786,7 +1786,7 @@
 		hdmi1: hdmi1@feae0000 {
 			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
 			reg = <0 0xfeae0000 0 0x10000>;
-			interrupts = <0 436 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 728>, <&cpg CPG_CORE R8A7795_CLK_HDMI>;
 			clock-names = "iahb", "isfr";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-- 
Regards,

Laurent Pinchart
