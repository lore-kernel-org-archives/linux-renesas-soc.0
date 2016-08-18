Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:35853 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752911AbcHRTZX (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 18 Aug 2016 15:25:23 -0400
Received: by mail-lf0-f49.google.com with SMTP id g62so18402438lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2016 12:25:22 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: blanche: add SDHI0 support
Date: Thu, 18 Aug 2016 21:31:54 +0300
Message-ID: <3029697.f9plKzFKet@wasted.cogentembedded.com>
In-Reply-To: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
References: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the Blanche board dependent part of the SDHI0 (connected to the
micro-SD slot) device node along with  the necessary voltage regulator.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20160817-v4.8-rc2' of Simon Horman's
'renesas.git' repo plus the general purpose switches patch  posted yesterday.

 arch/arm/boot/dts/r8a7792-blanche.dts |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
+++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -103,6 +103,17 @@
 			gpios = <&gpio11 2 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	vcc_sdhi0: regulator-vcc-sdhi0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "SDHI0 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio11 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &extal_clk {
@@ -139,6 +150,11 @@
 		groups = "can0_data", "can_clk";
 		function = "can0";
 	};
+
+	sdhi0_pins: sdhi0 {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+	};
 };
 
 &scif0 {
@@ -161,3 +177,12 @@
 
 	status = "okay";
 };
+
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&vcc_sdhi0>;
+	cd-gpios = <&gpio11 11 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
