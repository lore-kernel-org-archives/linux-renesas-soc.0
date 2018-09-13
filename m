Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34550 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbeIMORe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 10:17:34 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 13/13] ARM: dts: r9a06g032: Use r9a06g032-sysctrl binding definitions
Date: Thu, 13 Sep 2018 11:08:36 +0200
Message-Id: <1926bd6bf20fe306797fbf366902674d2d6c20cc.1536824376.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1536824376.git.horms+renesas@verge.net.au>
References: <cover.1536824376.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Replace the hardcoded clock indices by R9A06G032_CLK_* symbols.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index afe29c95a006..3e45375b79aa 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -7,6 +7,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/r9a06g032-sysctrl.h>
 
 / {
 	compatible = "renesas,r9a06g032";
@@ -21,14 +22,14 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0>;
-			clocks = <&sysctrl 84>;
+			clocks = <&sysctrl R9A06G032_CLK_A7MP>;
 		};
 
 		cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <1>;
-			clocks = <&sysctrl 84>;
+			clocks = <&sysctrl R9A06G032_CLK_A7MP>;
 			enable-method = "renesas,r9a06g032-smp";
 			cpu-release-addr = <0 0x4000c204>;
 		};
@@ -82,7 +83,7 @@
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clocks = <&sysctrl 146>;
+			clocks = <&sysctrl R9A06G032_CLK_UART0>;
 			clock-names = "baudclk";
 			status = "disabled";
 		};
-- 
2.11.0
