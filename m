Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33022 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752215AbdBBRKz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Feb 2017 12:10:55 -0500
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de,
        geert@linux-m68k.org
Cc: linux-serial@vger.kernel.org, magnus.damm@gmail.com,
        sergei.shtylyov@cogentembedded.com, gregkh@linuxfoundation.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v3 7/7] arm64: dts: r8a7796: salvator-x: add SCIF1 (DEBUG1)
Date: Thu,  2 Feb 2017 18:10:20 +0100
Message-Id: <1486055420-31595-8-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1486055420-31595-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1486055420-31595-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enables the SCIF hooked up to the DEBUG1 connector.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index c3e0b9e..6370b17 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -18,6 +18,7 @@
 
 	aliases {
 		serial0 = &scif2;
+		serial1 = &scif1;
 		ethernet0 = &avb;
 	};
 
@@ -113,6 +114,11 @@
 		function = "avb";
 	};
 
+	scif1_pins: scif1 {
+		groups = "scif1_data_a", "scif1_ctrl";
+		function = "scif1";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data_a";
 		function = "scif2";
@@ -240,6 +246,14 @@
 	status = "okay";
 };
 
+&scif1 {
+	pinctrl-0 = <&scif1_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	status = "okay";
+};
+
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
