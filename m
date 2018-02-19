Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:35428 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752563AbeBSLuC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 06:50:02 -0500
Received: by mail-pl0-f67.google.com with SMTP id bb3so5499179plb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2018 03:50:02 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 19 Feb 2018 20:49:51 +0900
Message-Id: <151904099108.30541.17932604596131550090.sendpatchset@little-apple>
In-Reply-To: <151904097369.30541.12132732484797103163.sendpatchset@little-apple>
References: <151904097369.30541.12132732484797103163.sendpatchset@little-apple>
Subject: [PATCH 02/02] ARM: dts: silk: Add GPIO keys to DT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Extend the Silk board support to include SW3, SW4, SW6 and SW12. They
are all connected via GPIO lines and handled by the gpio-keys driver.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/r8a7794-silk.dts |   55 ++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

--- 0002/arch/arm/boot/dts/r8a7794-silk.dts
+++ work/arch/arm/boot/dts/r8a7794-silk.dts	2018-02-19 20:24:48.960607110 +0900
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
