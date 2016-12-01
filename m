Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47630 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754874AbcLAO0M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 09:26:12 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 4/4] arm64: dts: r8a7795: Use renesas,rcar-gen3-usb2-phy fallback binding
Date: Thu,  1 Dec 2016 15:25:54 +0100
Message-Id: <1480602354-1446-5-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1480602354-1446-1-git-send-email-horms+renesas@verge.net.au>
References: <1480602354-1446-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

A fallback binding for the Renesas R-Car Gen3 for USB2.0 PHY driver was
added by commit cde7bc367f09 ("phy: rcar-gen3-usb2: add fallback binding").
This patch makes use of this binding in the DT for the r8a7795 SoC.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index a39a702b904d..080f1f422cfc 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1141,7 +1141,8 @@
 		};
 
 		usb2_phy0: usb-phy@ee080200 {
-			compatible = "renesas,usb2-phy-r8a7795";
+			compatible = "renesas,usb2-phy-r8a7795",
+				     "renesas,rcar-gen3-usb2-phy";
 			reg = <0 0xee080200 0 0x700>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>;
@@ -1151,7 +1152,8 @@
 		};
 
 		usb2_phy1: usb-phy@ee0a0200 {
-			compatible = "renesas,usb2-phy-r8a7795";
+			compatible = "renesas,usb2-phy-r8a7795",
+				     "renesas,rcar-gen3-usb2-phy";
 			reg = <0 0xee0a0200 0 0x700>;
 			clocks = <&cpg CPG_MOD 702>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -1160,7 +1162,8 @@
 		};
 
 		usb2_phy2: usb-phy@ee0c0200 {
-			compatible = "renesas,usb2-phy-r8a7795";
+			compatible = "renesas,usb2-phy-r8a7795",
+				     "renesas,rcar-gen3-usb2-phy";
 			reg = <0 0xee0c0200 0 0x700>;
 			clocks = <&cpg CPG_MOD 701>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-- 
2.7.0.rc3.207.g0ac5344
