Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:40589 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S935554AbdGTSWR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jul 2017 14:22:17 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 3/4] arm: dts: rskrza1: Add SDHI1 pin group
Date: Thu, 20 Jul 2017 13:20:18 -0500
Message-Id: <20170720182019.85075-4-chris.brandt@renesas.com>
In-Reply-To: <20170720182019.85075-1-chris.brandt@renesas.com>
References: <20170720182019.85075-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add pin configuration for SDHI ch1.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index cedf887e809a..f8285b951140 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -78,6 +78,18 @@
 			 <RZA1_PINMUX(2, 10, 2)>,	/* ET_RXD2  */
 			 <RZA1_PINMUX(2, 11, 2)>;	/* ET_RXD3  */
 	};
+
+	/* SDHI ch1 on CN1 */
+	sdhi1_pins: sdhi1 {
+		pinmux = <RZA1_PINMUX(3, 8, 7)>,	/* SD_CD_1 */
+			 <RZA1_PINMUX(3, 9, 7)>,	/* SD_WP_1 */
+			 <RZA1_PINMUX(3, 10, 7)>,	/* SD_D1_1 */
+			 <RZA1_PINMUX(3, 11, 7)>,	/* SD_D0_1 */
+			 <RZA1_PINMUX(3, 12, 7)>,	/* SD_CLK_1 */
+			 <RZA1_PINMUX(3, 13, 7)>,	/* SD_CMD_1 */
+			 <RZA1_PINMUX(3, 14, 7)>,	/* SD_D3_1 */
+			 <RZA1_PINMUX(3, 15, 7)>;	/* SD_D2_1 */
+	};
 };
 
 &mtu2 {
@@ -96,6 +108,8 @@
 };
 
 &sdhi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdhi1_pins>;
 	bus-width = <4>;
 	status = "okay";
 };
-- 
2.13.0
