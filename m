Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56528 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751609AbcFHBAC (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 21:00:02 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 6/9] arm64: dts: r8a7795: Use SYSC "always-on" PM Domain for RWDT node
Date: Wed,  8 Jun 2016 09:59:43 +0900
Message-Id: <b186fbb6cc5550756a29bc1d0bf259a7aa632c11.1465347183.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1465347183.git.horms+renesas@verge.net.au>
References: <cover.1465347183.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Hook up the RWDT device node to the SYSC "always-on" PM Domain, for a
more consistent device-power-area description in DT.

Cfr. commit 38dbb45ee4bc ("arm64: dts: r8a7795: Use SYSC "always-on" PM
Domain")

Fixes: f43838a7ae014cba ("arm64: dts: r8a7795: Add RWDT node")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index ba87e03969ee..bf38df355006 100644
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
2.1.4
