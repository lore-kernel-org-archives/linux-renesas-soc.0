Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34793 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752186AbdI2Lyz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:54:55 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 22/48] ARM: dts: gr-peach: Add user led device nodes
Date: Fri, 29 Sep 2017 13:53:14 +0200
Message-Id: <cfce5ac1aaf08fc0920d6572779360f80e8f3489.1506683482.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506683482.git.horms+renesas@verge.net.au>
References: <cover.1506683482.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Add device nodes for user leds on gr-peach board.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100-gr-peach.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
index bcfa6445bbaa..13d745bb56a5 100644
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
2.1.4
