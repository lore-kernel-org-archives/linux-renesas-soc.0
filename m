Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56042 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752802AbcEYBLv (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 24 May 2016 21:11:51 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] rm64: dts: r8a7795: Drop 0x from unit address of gic
Date: Wed, 25 May 2016 10:11:40 +0900
Message-Id: <1464138700-12219-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Drop 0x from unit address of gic as this is the desired form for
a unit address.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
As suggested by Geert Uytterhoeven
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index a4f4ec8daa21..04eb0bc65634 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -153,7 +153,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		gic: interrupt-controller@0xf1010000 {
+		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
-- 
2.1.4
