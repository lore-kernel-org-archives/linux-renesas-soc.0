Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:38014 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761473AbdDSJPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 05:15:55 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/8] [RFC] arm64: dts: renesas: Migrate R-Car M3-W Salvator-X to r8j7796-2x2g.dtsi
Date: Wed, 19 Apr 2017 11:15:49 +0200
Message-Id: <1492593351-13835-7-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
References: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas R-Car M3-W Salvator-X development board is equipped with an
r8j7796 SiP with 4 GiB of RAM.

Hence migrate from r8a7796.dtsi to r8j7796-2x2g.dtsi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Questions:
  - Should this file be renamed to r8j7796-salvator-x.dts?
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index 7f0ac6a9d49b8da6..26f5ff938bd2728d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -9,12 +9,12 @@
  */
 
 /dts-v1/;
-#include "r8a7796.dtsi"
+#include "r8j7796-2x2g.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	model = "Renesas Salvator-X board based on r8a7796";
-	compatible = "renesas,salvator-x", "renesas,r8a7796";
+	model = "Renesas Salvator-X board based on r8j7796";
+	compatible = "renesas,salvator-x", "renesas,r8j7796", "renesas,r8a7796";
 
 	aliases {
 		serial0 = &scif2;
@@ -27,17 +27,6 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@48000000 {
-		device_type = "memory";
-		/* first 128MB is reserved for secure area. */
-		reg = <0x0 0x48000000 0x0 0x78000000>;
-	};
-
-	memory@600000000 {
-		device_type = "memory";
-		reg = <0x6 0x00000000 0x0 0x80000000>;
-	};
-
 	reg_1p8v: regulator0 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
-- 
2.7.4
