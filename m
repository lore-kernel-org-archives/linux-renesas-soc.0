Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35637 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751673AbdFOHhA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2017 03:37:00 -0400
Received: from avalon.ideasonboard.com (unknown [IPv6:2001:268:c037:db14:f920:322a:1f4a:5bdb])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id D97AD201F5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jun 2017 09:36:35 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: r8a7795: salvator-x: Unify DU node between ES1.x and ES2.0
Date: Thu, 15 Jun 2017 10:37:16 +0300
Message-Id: <20170615073716.12395-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170615073716.12395-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170615073716.12395-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The external clocks used by the DU are identical on the H3 ES1.x and
ES2.0 SoCs. There is thus no need to duplicate DU clocks in both
r8a7795-salvator-x.dts and r8a7795-es1-salvator-x.dts, move them all to
salvator-x.dtsi.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts | 14 --------------
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts     | 14 --------------
 arch/arm64/boot/dts/renesas/salvator-x.dtsi            | 12 ++++++++++++
 3 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
index 1bb1dd61ba1c..755c5c6845b9 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
@@ -40,20 +40,6 @@
 	};
 };
 
-&du {
-	clocks = <&cpg CPG_MOD 724>,
-		 <&cpg CPG_MOD 723>,
-		 <&cpg CPG_MOD 722>,
-		 <&cpg CPG_MOD 721>,
-		 <&cpg CPG_MOD 727>,
-		 <&versaclock5 1>,
-		 <&x21_clk>,
-		 <&x22_clk>,
-		 <&versaclock5 2>;
-	clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0",
-		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
-};
-
 &ehci2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 8bcf4c0d6c4a..0322e23b0a18 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -40,20 +40,6 @@
 	};
 };
 
-&du {
-	clocks = <&cpg CPG_MOD 724>,
-		 <&cpg CPG_MOD 723>,
-		 <&cpg CPG_MOD 722>,
-		 <&cpg CPG_MOD 721>,
-		 <&cpg CPG_MOD 727>,
-		 <&versaclock5 1>,
-		 <&x21_clk>,
-		 <&x22_clk>,
-		 <&versaclock5 2>;
-	clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0",
-		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
-};
-
 &ehci2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
index 1f6b9fbb13af..d51d4f60a822 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
@@ -265,6 +265,18 @@
 	pinctrl-names = "default";
 	status = "okay";
 
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 722>,
+		 <&cpg CPG_MOD 721>,
+		 <&cpg CPG_MOD 727>,
+		 <&versaclock5 1>,
+		 <&x21_clk>,
+		 <&x22_clk>,
+		 <&versaclock5 2>;
+	clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0",
+		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
+
 	ports {
 		port@0 {
 			endpoint {
-- 
Regards,

Laurent Pinchart
