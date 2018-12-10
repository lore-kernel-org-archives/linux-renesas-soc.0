Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:23480 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726871AbeLJMBN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 07:01:13 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] ARM: dts: r8a7743: Fix sorting of rwdt node
Date: Mon, 10 Dec 2018 11:52:30 +0000
Message-Id: <1544442750-39442-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Watchdog node is incorrectly placed on r8a7743 SoC dtsi. This patch fixes
the sorting order.

Fixes: b5beb5d4c81c358f50a8310108 ("ARM: dts: r8a7743: Add watchdog support to SoC dtsi")

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7743.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 3cc33f7..7b731c7 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -154,6 +154,16 @@
 		#size-cells = <2>;
 		ranges;
 
+		rwdt: watchdog@e6020000 {
+			compatible = "renesas,r8a7743-wdt",
+				     "renesas,rcar-gen2-wdt";
+			reg = <0 0xe6020000 0 0x0c>;
+			clocks = <&cpg CPG_MOD 402>;
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 402>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a7743",
 				     "renesas,rcar-gen2-gpio";
@@ -310,16 +320,6 @@
 			reg = <0 0xe6160000 0 0x100>;
 		};
 
-		rwdt: watchdog@e6020000 {
-			compatible = "renesas,r8a7743-wdt",
-				     "renesas,rcar-gen2-wdt";
-			reg = <0 0xe6020000 0 0x0c>;
-			clocks = <&cpg CPG_MOD 402>;
-			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
-			resets = <&cpg 402>;
-			status = "disabled";
-		};
-
 		sysc: system-controller@e6180000 {
 			compatible = "renesas,r8a7743-sysc";
 			reg = <0 0xe6180000 0 0x200>;
-- 
2.7.4
