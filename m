Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56528 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752955AbcFHBAw (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 21:00:52 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 24/30] ARM: dts: koelsch: Fix W=1 dtc warnings
Date: Wed,  8 Jun 2016 09:59:54 +0900
Message-Id: <a704b2769fd27e47664f901571fc0f29702721e5.1465346599.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1465346599.git.horms+renesas@verge.net.au>
References: <cover.1465346599.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Warning (unit_address_vs_reg): Node /regulator@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@2 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@5 has a unit name, but no reg property

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index da59c2844b8a..20fbc8c36a78 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -170,7 +170,7 @@
 		};
 	};
 
-	vcc_sdhi0: regulator@0 {
+	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "SDHI0 Vcc";
@@ -181,7 +181,7 @@
 		enable-active-high;
 	};
 
-	vccq_sdhi0: regulator@1 {
+	vccq_sdhi0: regulator-vccq-sdhi0 {
 		compatible = "regulator-gpio";
 
 		regulator-name = "SDHI0 VccQ";
@@ -194,7 +194,7 @@
 			  1800000 0>;
 	};
 
-	vcc_sdhi1: regulator@2 {
+	vcc_sdhi1: regulator-vcc-sdhi1 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "SDHI1 Vcc";
@@ -205,7 +205,7 @@
 		enable-active-high;
 	};
 
-	vccq_sdhi1: regulator@3 {
+	vccq_sdhi1: regulator-vccq-sdhi1 {
 		compatible = "regulator-gpio";
 
 		regulator-name = "SDHI1 VccQ";
@@ -218,7 +218,7 @@
 			  1800000 0>;
 	};
 
-	vcc_sdhi2: regulator@4 {
+	vcc_sdhi2: regulator-vcc-sdhi2 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "SDHI2 Vcc";
@@ -229,7 +229,7 @@
 		enable-active-high;
 	};
 
-	vccq_sdhi2: regulator@5 {
+	vccq_sdhi2: regulator-vccq-sdhi2 {
 		compatible = "regulator-gpio";
 
 		regulator-name = "SDHI2 VccQ";
-- 
2.1.4
