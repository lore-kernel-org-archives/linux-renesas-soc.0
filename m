Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58722 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751615AbdHXItK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 04:49:10 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, magnus.damm@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm: dts: gr-peach: Add user led device nodes
Date: Thu, 24 Aug 2017 10:48:43 +0200
Message-Id: <1503564523-31899-5-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add device nodes for user leds on gr-peach board.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-gr-peach.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
index 5ce558f..29ad54e 100644
--- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "r7s72100.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
 
 / {
@@ -51,6 +52,15 @@
 			reg = <0x00600000 0x00200000>;
 		};
 	};
+
+leds {
+		status = "okay";
+		compatible = "gpio-leds";
+
+		led1 {
+			gpios = <&port6 12 GPIO_ACTIVE_HIGH>;
+		};
+	};
 };
 
 &pinctrl {
-- 
2.7.4
