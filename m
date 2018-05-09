Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:46121 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932875AbeEIMig (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 May 2018 08:38:36 -0400
Received: by mail-pg0-f68.google.com with SMTP id z4-v6so22610707pgu.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 May 2018 05:38:36 -0700 (PDT)
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: r8a77965: Add SDHI device nodes
Date: Wed,  9 May 2018 21:38:24 +0900
Message-Id: <1525869504-3361-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Add SDHI nodes to the DT of the r8a77965 SoC.

Based on several similar patches of the R8A7796 device tree
by Simon Horman <horms+renesas@verge.net.au>.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

v2 [Yoshihiro Kaneko]
* As suggested by Simon Horman
Rebased on top of the devel branch of the renesas tree.

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 36 +++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index ba0edda..510815e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -978,23 +978,51 @@
 		};
 
 		sdhi0: sd@ee100000 {
+			compatible = "renesas,sdhi-r8a77965",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 314>;
+			max-frequency = <200000000>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 314>;
+			status = "disabled";
 		};
 
 		sdhi1: sd@ee120000 {
+			compatible = "renesas,sdhi-r8a77965",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee120000 0 0x2000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 313>;
+			max-frequency = <200000000>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 313>;
+			status = "disabled";
 		};
 
 		sdhi2: sd@ee140000 {
+			compatible = "renesas,sdhi-r8a77965",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 312>;
+			max-frequency = <200000000>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 312>;
+			status = "disabled";
 		};
 
 		sdhi3: sd@ee160000 {
+			compatible = "renesas,sdhi-r8a77965",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 311>;
+			max-frequency = <200000000>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 311>;
+			status = "disabled";
 		};
 
 		gic: interrupt-controller@f1010000 {
-- 
1.9.1
