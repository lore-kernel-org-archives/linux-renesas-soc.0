Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57763 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751646AbdEJHFG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 03:05:06 -0400
Received: from avalon.ideasonboard.com (syi-ogw1-1554.syi.inet.fi [194.89.38.18])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 1BD8A202FF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2017 09:04:00 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 6/7] arm64: dts: r8a7795: salvator-x: Add panel backlight support
Date: Wed, 10 May 2017 10:04:57 +0300
Message-Id: <20170510070458.21193-7-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The panel backlight is controlled through a GPIO and a PWM channel.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/salvator-x.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
index fd2f6fa523ae..2e199302f93c 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
@@ -58,6 +58,16 @@
 		clock-frequency = <11289600>;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm1 0 50000>;
+
+		brightness-levels = <256 128 64 16 8 4 0>;
+		default-brightness-level = <6>;
+
+		enable-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
+	};
+
 	reg_1p8v: regulator0 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
@@ -453,6 +463,11 @@
 		function = "i2c2";
 	};
 
+	pwm1_pins: pwm {
+		groups = "pwm1_a";
+		function = "pwm1";
+	};
+
 	scif1_pins: scif1 {
 		groups = "scif1_data_a", "scif1_ctrl";
 		function = "scif1";
@@ -538,6 +553,13 @@
 	};
 };
 
+&pwm1 {
+	pinctrl-0 = <&pwm1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &rcar_sound {
 	pinctrl-0 = <&sound_pins &sound_clk_pins>;
 	pinctrl-names = "default";
-- 
Regards,

Laurent Pinchart
