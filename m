Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753996AbeCPOyw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:54:52 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 52/52] ARM: dts: silk: Add GPIO keys to DT
Date: Fri, 16 Mar 2018 15:53:11 +0100
Message-Id: <49846cbda7d3f85f0bb6cebccf8f039b51401fcb.1521208546.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521208546.git.horms+renesas@verge.net.au>
References: <cover.1521208546.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Extend the Silk board support to include SW3, SW4, SW6 and SW12. They
are all connected via GPIO lines and handled by the gpio-keys driver.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7794-silk.dts | 55 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index befd0fb880cc..351cb3b3d966 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -24,6 +24,7 @@
 /dts-v1/;
 #include "r8a7794.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "SILK";
@@ -45,6 +46,60 @@
 		reg = <0 0x40000000 0 0x40000000>;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-3 {
+			gpios = <&gpio5 10 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+			label = "SW3";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-4 {
+			gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_4>;
+			label = "SW4";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-6 {
+			gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_6>;
+			label = "SW6";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-a {
+			gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_A>;
+			label = "SW12-1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-b {
+			gpios = <&gpio3 10 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_B>;
+			label = "SW12-2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-c {
+			gpios = <&gpio3 11 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_C>;
+			label = "SW12-3";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-d {
+			gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_D>;
+			label = "SW12-4";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
 	d3_3v: regulator-d3-3v {
 		compatible = "regulator-fixed";
 		regulator-name = "D3.3V";
-- 
2.11.0
