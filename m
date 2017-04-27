Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34249 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938428AbdD0OiA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Apr 2017 10:38:00 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: geert@glider.be, horms@verge.net.au
Cc: linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 4/8] arm64: dts: r8a7796: salvator-x: Add panel backlight support
Date: Thu, 27 Apr 2017 16:37:39 +0200
Message-Id: <1493303863-23719-5-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1493303863-23719-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1493303863-23719-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The panel backlight is controlled through a GPIO and a PWM channel.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index 14d9e51..abda84c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -133,6 +133,11 @@
 		function = "i2c2";
 	};
 
+	pwm1_pins: pwm {
+		groups = "pwm1_a";
+		function = "pwm1";
+	};
+
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
@@ -183,6 +188,16 @@
 		interrupt-parent = <&gpio2>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm1 0 50000>;
+
+		brightness-levels = <256 128 64 16 8 4 0>;
+		default-brightness-level = <6>;
+
+		enable-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &extal_clk {
@@ -235,6 +250,13 @@
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-0 = <&pwm1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &scif1 {
 	pinctrl-0 = <&scif1_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
