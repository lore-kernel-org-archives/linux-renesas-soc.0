Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:65466 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754511AbeCSM2h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 08:28:37 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/7] arm64: dts: renesas: r8a77965: add usb2_phy nodes
Date: Mon, 19 Mar 2018 21:28:21 +0900
Message-Id: <1521462507-23287-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1521462507-23287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1521462507-23287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch add usb2_phy nodes for r8a77965.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index f0871fc..d498274 100644
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
1.9.1
