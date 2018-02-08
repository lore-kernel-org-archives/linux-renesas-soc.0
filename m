Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:51858 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751671AbeBHKeY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Feb 2018 05:34:24 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 03/11] ARM: dts: r8a7793: Add RWDT node
Date: Thu,  8 Feb 2018 11:34:09 +0100
Message-Id: <1518086057-19448-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
References: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a device node for the Watchdog Timer (WDT) controller on the Renesas
R-Car M2-N (r8a7793) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7793.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index f0e0415682f89440..5a06ad1788b27ff1 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -126,6 +126,16 @@
 		#size-cells = <2>;
 		ranges;
 
+		rwdt: watchdog@e6020000 {
+			compatible = "renesas,r8a7793-wdt",
+				     "renesas,rcar-gen2-wdt";
+			reg = <0 0xe6020000 0 0x0c>;
+			clocks = <&cpg CPG_MOD 402>;
+			power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
+			resets = <&cpg 402>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a7793",
 				     "renesas,rcar-gen2-gpio";
-- 
2.7.4
