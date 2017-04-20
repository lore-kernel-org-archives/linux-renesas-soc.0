Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb0-f182.google.com ([209.85.213.182]:33958 "EHLO
        mail-yb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S946428AbdDTOv6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 10:51:58 -0400
Received: by mail-yb0-f182.google.com with SMTP id 11so25573289ybw.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Apr 2017 07:51:58 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        sergei.shtylyov@cogentembedded.com, geert+renesas@glider.be
Date: Thu, 20 Apr 2017 23:46:57 +0900
Message-Id: <149269961740.23335.7950127209713140684.sendpatchset@little-apple>
Subject: [PATCH] ARM: dts: blanche: Add support for HSCIF0 on CN5
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

r8a7792 Blanche has depending on dip switch and jumper settings
either HSCIF0 or CAN0 exposed on the on-board CN5 connector.

This patch adds HSCIF0 to the Blanche dts as serial2.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Currently the r8a7792 PFC is lacking support for HSCIF devices
 so the PFC driver needs to be updated to avoid error messages
 on the boot console.

 arch/arm/boot/dts/r8a7792-blanche.dts |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

--- 0001/arch/arm/boot/dts/r8a7792-blanche.dts
+++ work/arch/arm/boot/dts/r8a7792-blanche.dts	2017-04-20 23:35:50.440607110 +0900
@@ -21,6 +21,7 @@
 	aliases {
 		serial0 = &scif0;
 		serial1 = &scif3;
+		serial2 = &hscif0;
 	};
 
 	chosen {
@@ -207,6 +208,11 @@
 		function = "scif3";
 	};
 
+	hscif0_pins: hscif0 {
+		groups = "hscif0_data", "hscif0_ctrl";
+		function = "hscif0";
+	};
+
 	lan89218_pins: lan89218 {
 		intc {
 			groups = "intc_irq0";
@@ -253,6 +259,14 @@
 	status = "okay";
 };
 
+&hscif0 {
+	pinctrl-0 = <&hscif0_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	status = "okay";
+};
+
 &can0 {
 	pinctrl-0 = <&can0_pins>;
 	pinctrl-names = "default";
