Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeERLQL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:16:11 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 001/102] arm64: dts: renesas: r8a77965: add usb2_phy nodes
Date: Fri, 18 May 2018 13:14:23 +0200
Message-Id: <b5857630a829a8d567627e5925a5710e5a80491a.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

This patch add usb2_phy nodes for r8a77965.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index f0871fcdd984..d498274fa0f3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -650,13 +650,26 @@
 		};
 
 		usb2_phy0: usb-phy@ee080200 {
+			compatible = "renesas,usb2-phy-r8a77965",
+				     "renesas,rcar-gen3-usb2-phy";
 			reg = <0 0xee080200 0 0x700>;
-			/* placeholder */
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 703>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 703>;
+			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		usb2_phy1: usb-phy@ee0a0200 {
+			compatible = "renesas,usb2-phy-r8a77965",
+				     "renesas,rcar-gen3-usb2-phy";
 			reg = <0 0xee0a0200 0 0x700>;
-			/* placeholder */
+			clocks = <&cpg CPG_MOD 703>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 703>;
+			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		ohci1: usb@ee0a0000 {
-- 
2.11.0
