Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f195.google.com ([209.85.210.195]:33983 "EHLO
        mail-wj0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752316AbdBCKij (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Feb 2017 05:38:39 -0500
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        gregkh@linuxfoundation.org
Cc: wsa@the-dreams.de, linux-serial@vger.kernel.org,
        magnus.damm@gmail.com, sergei.shtylyov@cogentembedded.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v4 4/4] arm64: dts: r8a7796: salvator-x: add SCIF1 (DEBUG1)
Date: Fri,  3 Feb 2017 11:38:20 +0100
Message-Id: <1486118300-12633-5-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1486118300-12633-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1486118300-12633-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enables the SCIF hooked up to the DEBUG1 connector.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index f35e96c..443eb0a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -18,6 +18,7 @@
 
 	aliases {
 		serial0 = &scif2;
+		serial1 = &scif1;
 	};
 
 	chosen {
@@ -102,6 +103,11 @@
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
+	scif1_pins: scif1 {
+		groups = "scif1_data_a", "scif1_ctrl";
+		function = "scif1";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data_a";
 		function = "scif2";
@@ -202,6 +208,14 @@
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
