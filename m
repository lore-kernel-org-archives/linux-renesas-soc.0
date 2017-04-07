Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54687 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933632AbdDGP7B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 11:59:01 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 16/22] ARM: dts: r7s72100: add RTC_X clock inputs to device tree
Date: Fri,  7 Apr 2017 11:58:17 -0400
Message-Id: <deddcb891d0d2b4f437dea9bdea4752982c4b133.1491580547.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1491580547.git.horms+renesas@verge.net.au>
References: <cover.1491580547.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Chris Brandt <chris.brandt@renesas.com>

Add the RTC clocks to device tree. The frequencies must be fixed values
according to the hardware manual.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 9eace892fec7..9db46ac08ba7 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -51,6 +51,20 @@
 			clock-frequency = <0>;
 		};
 
+		rtc_x1_clk: rtc_x1 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			/* If clk present, value must be set by board to 32678 */
+			clock-frequency = <0>;
+		};
+
+		rtc_x3_clk: rtc_x3 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			/* If clk present, value must be set by board to 4000000 */
+			clock-frequency = <0>;
+		};
+
 		/* Fixed factor clocks */
 		b_clk: b {
 			#clock-cells = <0>;
-- 
2.7.0.rc3.207.g0ac5344
