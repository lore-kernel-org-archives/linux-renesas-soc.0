Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:47620 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932098AbdC2RbO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 13:31:14 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 4/7] ARM: dts: r7s72100: add RTC_X clock inputs to device tree
Date: Wed, 29 Mar 2017 10:30:32 -0700
Message-Id: <20170329173035.67477-5-chris.brandt@renesas.com>
In-Reply-To: <20170329173035.67477-1-chris.brandt@renesas.com>
References: <20170329173035.67477-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the RTC clocks to device tree. The frequencies must be fixed values
according to the hardware manual.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 6a1448be4e10..632a6a481be8 100644
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
2.11.0
