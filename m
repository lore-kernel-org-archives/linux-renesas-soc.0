Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56663 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751415AbdFZQ3f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2017 12:29:35 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: r8a7795: Add support for the DU
Date: Mon, 26 Jun 2017 19:29:30 +0300
Message-Id: <20170626162930.30240-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170626162930.30240-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170626162930.30240-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a compatible string and VSP links to the DU node. The H3 ES1.x and
H3 ES2.0 are compatible save for the links to the VSPs that are
described explicitly in DT, so there's no need for a new ES2-specific
compatible string.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 1 -
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index a0ba7bd21ea3..f1646334899f 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -79,6 +79,5 @@
 };
 
 &du {
-	compatible = "renesas,du-r8a7795";
 	vsps = <&vspd0 &vspd1 &vspd2 &vspd3>;
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index e31c1b660b3f..525dfedaba17 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1755,6 +1755,7 @@
 		};
 
 		du: display@feb00000 {
+			compatible = "renesas,du-r8a7795";
 			reg = <0 0xfeb00000 0 0x80000>,
 			      <0 0xfeb90000 0 0x14>;
 			reg-names = "du", "lvds.0";
@@ -1768,6 +1769,7 @@
 				 <&cpg CPG_MOD 721>,
 				 <&cpg CPG_MOD 727>;
 			clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0";
+			vsps = <&vspd0 0 &vspd1 0 &vspd2 0 &vspd0 1>;
 			status = "disabled";
 
 			ports {
-- 
Regards,

Laurent Pinchart
