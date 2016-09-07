Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57254 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756483AbcIGHvA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 03:51:00 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 26/26] ARM: dts: wheat: add support for tactile switches
Date: Wed,  7 Sep 2016 09:50:13 +0200
Message-Id: <fa8f4aba72e6d619c003dab60f58ab6c7410e465.1473234372.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1473234371.git.horms+renesas@verge.net.au>
References: <cover.1473234371.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Add  support for the  tactile switches  SW2/3 (on the debug board) as a
virtual keyboard like it  was done with the Blanche board).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792-wheat.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7792-wheat.dts b/arch/arm/boot/dts/r8a7792-wheat.dts
index 0ec4bc606c61..6dbb94114a93 100644
--- a/arch/arm/boot/dts/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/r8a7792-wheat.dts
@@ -12,6 +12,7 @@
 /dts-v1/;
 #include "r8a7792.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Wheat";
@@ -56,6 +57,25 @@
 		pinctrl-names = "default";
 	};
 
+	keyboard {
+		compatible = "gpio-keys";
+
+		key-a {
+			linux,code = <KEY_A>;
+			label = "SW2";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
+		};
+		key-b {
+			linux,code = <KEY_B>;
+			label = "SW3";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio11 2 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
-- 
2.7.0.rc3.207.g0ac5344
