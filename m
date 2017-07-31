Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42651 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbdGaPDr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:03:47 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 19/31] arm64: dts: r8a7795: Add support for the DU
Date: Mon, 31 Jul 2017 17:03:11 +0200
Message-Id: <f0499b9fe1b26ddfeec49d2ee03863775e02d3bd.1501509526.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501509525.git.horms+renesas@verge.net.au>
References: <cover.1501509525.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Add a compatible string and VSP links to the DU node. The H3 ES1.x and
H3 ES2.0 are compatible save for the links to the VSPs that are
described explicitly in DT, so there's no need for a new ES2-specific
compatible string.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
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
index 2df8fb0d6ff2..14c72e5cb7a0 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1917,6 +1917,7 @@
 		};
 
 		du: display@feb00000 {
+			compatible = "renesas,du-r8a7795";
 			reg = <0 0xfeb00000 0 0x80000>,
 			      <0 0xfeb90000 0 0x14>;
 			reg-names = "du", "lvds.0";
@@ -1930,6 +1931,7 @@
 				 <&cpg CPG_MOD 721>,
 				 <&cpg CPG_MOD 727>;
 			clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0";
+			vsps = <&vspd0 0 &vspd1 0 &vspd2 0 &vspd0 1>;
 			status = "disabled";
 
 			ports {
-- 
2.1.4
