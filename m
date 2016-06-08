Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56528 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751684AbcFHBA0 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 21:00:26 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 13/30] ARM: dts: r8a7778: Fix W=1 dtc warnings
Date: Wed,  8 Jun 2016 09:59:43 +0900
Message-Id: <51f20c93383805cd4ec9c2f7e180c3dea7aefa81.1465346599.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1465346599.git.horms+renesas@verge.net.au>
References: <cover.1465346599.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@5 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@6 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@7 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@8 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,src/src@9 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@5 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@6 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@7 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@8 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /sound@ffd90000/rcar_sound,ssi/ssi@9 has a unit name, but no reg property

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7778.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index fe787b4751d2..e571d66ea0fe 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -276,23 +276,23 @@
 		status = "disabled";
 
 		rcar_sound,src {
-			src3: src@3 { };
-			src4: src@4 { };
-			src5: src@5 { };
-			src6: src@6 { };
-			src7: src@7 { };
-			src8: src@8 { };
-			src9: src@9 { };
+			src3: src-3 { };
+			src4: src-4 { };
+			src5: src-5 { };
+			src6: src-6 { };
+			src7: src-7 { };
+			src8: src-8 { };
+			src9: src-9 { };
 		};
 
 		rcar_sound,ssi {
-			ssi3: ssi@3 { interrupts = <GIC_SPI 0x85 IRQ_TYPE_LEVEL_HIGH>; };
-			ssi4: ssi@4 { interrupts = <GIC_SPI 0x85 IRQ_TYPE_LEVEL_HIGH>; };
-			ssi5: ssi@5 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
-			ssi6: ssi@6 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
-			ssi7: ssi@7 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
-			ssi8: ssi@8 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
-			ssi9: ssi@9 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi3: ssi-3 { interrupts = <GIC_SPI 0x85 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi4: ssi-4 { interrupts = <GIC_SPI 0x85 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi5: ssi-5 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi6: ssi-6 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi7: ssi-7 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi8: ssi-8 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
+			ssi9: ssi-9 { interrupts = <GIC_SPI 0x86 IRQ_TYPE_LEVEL_HIGH>; };
 		};
 	};
 
-- 
2.1.4
