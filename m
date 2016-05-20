Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:52590 "EHLO
	michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755486AbcETHnG (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 20 May 2016 03:43:06 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: r8a7795: Use SYSC "always-on" PM Domain for RWDT node
Date: Fri, 20 May 2016 09:43:02 +0200
Message-Id: <1463730182-15878-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hook up the RWDT device node to the SYSC "always-on" PM Domain, for a
more consistent device-power-area description in DT.

Cfr. commit 38dbb45ee4bc7dda ("arm64: dts: r8a7795: Use SYSC "always-on"
PM Domain").

Fixes: f43838a7ae014cba ("arm64: dts: r8a7795: Add RWDT node")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Commit 38dbb45ee4bc7dda was applied in between review and application of
commit f43838a7ae014cba.

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index ba87e03969ee562e..bf38df355006afde 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -168,7 +168,7 @@
 			compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
 			clocks = <&cpg CPG_MOD 402>;
-			power-domains = <&cpg>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
-- 
1.9.1
