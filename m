Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:36516 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751394AbcGNUVT (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 14 Jul 2016 16:21:19 -0400
Received: by mail-lf0-f45.google.com with SMTP id q132so72670843lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jul 2016 13:21:18 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] ARM: dts: blanche: add CAN0 support
Date: Thu, 14 Jul 2016 23:21:15 +0300
Message-ID: <14988679.oTJc4uy6At@wasted.cogentembedded.com>
In-Reply-To: <34968644.DhifNderY8@wasted.cogentembedded.com>
References: <34968644.DhifNderY8@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the Blanche board dependent part of the CAN0 device node along with
the CAN_CLK crystal...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7792-blanche.dts |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
+++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -60,6 +60,10 @@
 	clock-frequency = <20000000>;
 };
 
+&can_clk {
+	clock-frequency = <48000000>;
+};
+
 &pfc {
 	scif0_pins: scif0 {
 		groups = "scif0_data";
@@ -81,6 +85,11 @@
 			function = "lbsc";
 		};
 	};
+
+	can0_pins: can0 {
+		groups = "can0_data", "can_clk";
+		function = "can0";
+	};
 };
 
 &scif0 {
@@ -95,4 +104,11 @@
 	pinctrl-names = "default";
 
 	status = "okay";
+};
+
+&can0 {
+	pinctrl-0 = <&can0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
 };
