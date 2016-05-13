Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:36426 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752083AbcEMH4H (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 13 May 2016 03:56:07 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 04/23] ARM: dts: r8a7778: Fix W=1 dtc warnings
Date: Fri, 13 May 2016 09:55:44 +0200
Message-Id: <1463126163-29423-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
References: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

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
---
 arch/arm/boot/dts/r8a7778.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index fe787b4751d2cf05..e571d66ea0fe1721 100644
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
1.9.1
