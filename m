Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35289 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752446AbcINQsT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 12:48:19 -0400
Received: by mail-wm0-f66.google.com with SMTP id 133so1335379wmq.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 09:47:44 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: magnus.damm@gmail.com, horms@verge.net.au,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH] arm64: dts: r8a7796 salvator-x: External SCIF3/HSCIF3 loop
Date: Wed, 14 Sep 2016 18:47:41 +0200
Message-Id: <20160914164741.31621-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add SCIF3 and HSCIF3 as two new serial ports to the r8a7796
Salvator-X DT file.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index bdf6e05..2636742 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -18,6 +18,8 @@
 
 	aliases {
 		serial0 = &scif2;
+		serial2 = &scif3;
+		serial3 = &hscif3;
 	};
 
 	chosen {
@@ -89,6 +91,14 @@
 		groups = "scif2_data_a";
 		function = "scif2";
 	};
+	scif3_pins: scif3 { /* TX: 1_11, RX: 1_8 */
+		groups = "scif3_data_b";
+		function = "scif3";
+	};
+	hscif3_pins: hscif3 { /* TX: 2_8, RX: 2_7 */
+		groups = "hscif3_data_d";
+		function = "hscif3";
+	};
 	scif_clk_pins: scif_clk {
 		groups = "scif_clk_a";
 		function = "scif_clk";
@@ -138,6 +148,22 @@
 	status = "okay";
 };
 
+&scif3 {
+	pinctrl-0 = <&scif3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+/* SCIF3 TX -> HSCIF3 RX, HSCIF3 TX -> SCIF3 RX */
+
+&hscif3 {
+	pinctrl-0 = <&hscif3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
-- 
2.9.3
