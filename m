Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56528 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751684AbcFHBAE (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 21:00:04 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 8/9] arm64: dts: salvator-x: Fix W=1 dtc warnings
Date: Wed,  8 Jun 2016 09:59:45 +0900
Message-Id: <4a4e2138d6bb5e6b80e283df73c1acabb0b992f7.1465347183.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1465347183.git.horms+renesas@verge.net.au>
References: <cover.1465347183.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Warning (unit_address_vs_reg): Node /regulator@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@2 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@4 has a unit name, but no reg property

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 84082922edb2..98f02631a0f0 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -62,7 +62,7 @@
 		clock-frequency = <24576000>;
 	};
 
-	vcc_sdhi0: regulator@1 {
+	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "SDHI0 Vcc";
@@ -73,7 +73,7 @@
 		enable-active-high;
 	};
 
-	vccq_sdhi0: regulator@2 {
+	vccq_sdhi0: regulator-vccq-sdhi0 {
 		compatible = "regulator-gpio";
 
 		regulator-name = "SDHI0 VccQ";
@@ -86,7 +86,7 @@
 			  1800000 0>;
 	};
 
-	vcc_sdhi3: regulator@3 {
+	vcc_sdhi3: regulator-vcc-sdhi3 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "SDHI3 Vcc";
@@ -97,7 +97,7 @@
 		enable-active-high;
 	};
 
-	vccq_sdhi3: regulator@4 {
+	vccq_sdhi3: regulator-vccq-sdhi3 {
 		compatible = "regulator-gpio";
 
 		regulator-name = "SDHI3 VccQ";
-- 
2.1.4
