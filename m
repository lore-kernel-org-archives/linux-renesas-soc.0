Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54687 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933632AbdDGP67 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 11:58:59 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 15/22] ARM: dts: r7s72100: add rtc clock to device tree
Date: Fri,  7 Apr 2017 11:58:16 -0400
Message-Id: <929ded3dd7ce91d9ef4143d673b4ace2eb9ab355.1491580547.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1491580547.git.horms+renesas@verge.net.au>
References: <cover.1491580547.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Chris Brandt <chris.brandt@renesas.com>

Add the realtime clock functional clock source.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100.dtsi            | 9 +++++++++
 include/dt-bindings/clock/r7s72100-clock.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 47ef53a4c8bf..9eace892fec7 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -117,6 +117,15 @@
 			clock-output-names = "ostm0", "ostm1";
 		};
 
+		mstp6_clks: mstp6_clks@fcfe042c {
+			#clock-cells = <1>;
+			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
+			reg = <0xfcfe042c 4>;
+			clocks = <&p0_clk>;
+			clock-indices = <R7S72100_CLK_RTC>;
+			clock-output-names = "rtc";
+		};
+
 		mstp7_clks: mstp7_clks@fcfe0430 {
 			#clock-cells = <1>;
 			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
index cd2ed5194255..bc256d31099a 100644
--- a/include/dt-bindings/clock/r7s72100-clock.h
+++ b/include/dt-bindings/clock/r7s72100-clock.h
@@ -29,6 +29,9 @@
 #define R7S72100_CLK_OSTM0	1
 #define R7S72100_CLK_OSTM1	0
 
+/* MSTP6 */
+#define R7S72100_CLK_RTC	0
+
 /* MSTP7 */
 #define R7S72100_CLK_ETHER	4
 
-- 
2.7.0.rc3.207.g0ac5344
