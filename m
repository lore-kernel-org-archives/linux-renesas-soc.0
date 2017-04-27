Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:49149 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1034791AbdD0TLx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Apr 2017 15:11:53 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] ARM: dts: r7s72100: add usb clocks to device tree
Date: Thu, 27 Apr 2017 12:10:45 -0700
Message-Id: <20170427191045.21199-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This adds the USB0 and USB1 clocks to the device tree.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100.dtsi            | 6 +++---
 include/dt-bindings/clock/r7s72100-clock.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index fb54cb5d3fad..4ed12a4d9d51 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -144,9 +144,9 @@
 			#clock-cells = <1>;
 			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0xfcfe0430 4>;
-			clocks = <&b_clk>;
-			clock-indices = <R7S72100_CLK_ETHER>;
-			clock-output-names = "ether";
+			clocks = <&b_clk>, <&p1_clk>, <&p1_clk>;
+			clock-indices = <R7S72100_CLK_ETHER R7S72100_CLK_USB0 R7S72100_CLK_USB1>;
+			clock-output-names = "ether", "usb0", "usb1";
 		};
 
 		mstp8_clks: mstp8_clks@fcfe0434 {
diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
index bc256d31099a..dcd2072151fc 100644
--- a/include/dt-bindings/clock/r7s72100-clock.h
+++ b/include/dt-bindings/clock/r7s72100-clock.h
@@ -34,6 +34,8 @@
 
 /* MSTP7 */
 #define R7S72100_CLK_ETHER	4
+#define R7S72100_CLK_USB0	1
+#define R7S72100_CLK_USB1	0
 
 /* MSTP8 */
 #define R7S72100_CLK_MMCIF	4
-- 
2.11.0
