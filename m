Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47991 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752929AbcHOI4V (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 15 Aug 2016 04:56:21 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 10/26] ARM: dts: blanche: add CAN0 support
Date: Mon, 15 Aug 2016 10:55:29 +0200
Message-Id: <38584104eafb6ed40ca06c8421dcc369c9015c1d.1471251169.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1471251169.git.horms+renesas@verge.net.au>
References: <cover.1471251169.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Define the Blanche board dependent part of the CAN0 device node along with
the CAN_CLK crystal.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792-blanche.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7792-blanche.dts b/arch/arm/boot/dts/r8a7792-blanche.dts
index 4777a609ff81..eeffba870211 100644
--- a/arch/arm/boot/dts/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/r8a7792-blanche.dts
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
@@ -96,3 +105,10 @@
 
 	status = "okay";
 };
+
+&can0 {
+	pinctrl-0 = <&can0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.7.0.rc3.207.g0ac5344
