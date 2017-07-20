Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:37310 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S935512AbdGTSWT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jul 2017 14:22:19 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 4/4] arm: dts: rskrza1: Add LED0 pin support
Date: Thu, 20 Jul 2017 13:20:19 -0500
Message-Id: <20170720182019.85075-5-chris.brandt@renesas.com>
In-Reply-To: <20170720182019.85075-1-chris.brandt@renesas.com>
References: <20170720182019.85075-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add pin configuration for LED0 which is connected to a GPIO.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index f8285b951140..5dcaaf131d27 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -10,6 +10,7 @@
 
 /dts-v1/;
 #include "r7s72100.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
 
 / {
@@ -34,6 +35,15 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 	};
+
+	leds {
+		status = "okay";
+		compatible = "gpio-leds";
+
+		led0 {
+			gpios = <&port7 1 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &extal_clk {
-- 
2.13.0
