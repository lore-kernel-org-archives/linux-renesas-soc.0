Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52231 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934258AbeFYOEY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jun 2018 10:04:24 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 28/29] arm64: dts: renesas: salvator-common: Add HSCIF1 device support
Date: Mon, 25 Jun 2018 16:03:23 +0200
Message-Id: <b6d3134ddcbe4d3c3986e4e7b649467a19045949.1529933747.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1529933747.git.horms+renesas@verge.net.au>
References: <cover.1529933747.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

This patch adds pin control for HSCIF1, and supports connection with
Debug Serial-1 (CN26) on Salvator boards.

SCIF1 and HSCIF1 are sharing the pins connected to Debug Serial-1 (CN26)
on Salvator boards, and it is necessary to ensure that either SCIF1 or
HSCIF1 is enabled, not both.

As for the default of this DeviceTree, SCIF1 is connected.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Add missing "uart-has-rtscts"]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 320250d708c3..ce808d3f9f62 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -338,6 +338,15 @@
 	clock-frequency = <32768>;
 };
 
+&hscif1 {
+	pinctrl-0 = <&hscif1_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	/* Please only enable hscif1 or scif1 */
+	/* status = "okay"; */
+};
+
 &hsusb {
 	dr_mode = "otg";
 	status = "okay";
@@ -543,6 +552,11 @@
 		function = "du";
 	};
 
+	hscif1_pins: hscif1 {
+		groups = "hscif1_data_a", "hscif1_ctrl_a";
+		function = "hscif1";
+	};
+
 	i2c2_pins: i2c2 {
 		groups = "i2c2_a";
 		function = "i2c2";
@@ -708,6 +722,7 @@
 	pinctrl-names = "default";
 
 	uart-has-rtscts;
+	/* Please only enable hscif1 or scif1 */
 	status = "okay";
 };
 
-- 
2.11.0
