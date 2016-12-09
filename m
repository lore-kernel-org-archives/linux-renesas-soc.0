Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36698 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933572AbcLIMg1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2016 07:36:27 -0500
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de,
        geert@linux-m68k.org
Cc: linux-serial@vger.kernel.org, magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 7/7] arm64: dts: r8a7796: salvator-x: add SCIF1 (DEBUG1)
Date: Fri,  9 Dec 2016 13:36:11 +0100
Message-Id: <1481286971-16667-8-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1481286971-16667-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1481286971-16667-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enables the SCIF hooked up to the DEBUG1 connector.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index da46ac7..9204691 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -18,6 +18,7 @@
 
 	aliases {
 		serial0 = &scif2;
+		serial1 = &scif1;
 		ethernet0 = &avb;
 	};
 
@@ -140,6 +141,11 @@
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
+	scif1_pins: scif1 {
+		groups = "scif1_data_a";
+		function = "scif1";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data_a";
 		function = "scif2";
@@ -280,6 +286,12 @@
 	status = "okay";
 };
 
+&scif1 {
+	pinctrl-0 = <&scif1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
