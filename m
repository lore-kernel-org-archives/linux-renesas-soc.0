Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34311 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754222AbdIRP4U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 11:56:20 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: linux-pwm@vger.kernel.org, magnus.damm@gmail.com,
        laurent.pinchart@ideasonboard.com, horms@verge.net.au,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH] arm64: dts: salvator-common: add 12V regulator to backlight
Date: Mon, 18 Sep 2017 17:56:14 +0200
Message-Id: <1505750174-29888-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This fixes the warning "pwm-backlight backlight: backlight supply power
not found, using dummy regulator".

Fixes: b33be33670217533 ("arm64: dts: salvator-x: Add panel backlight support")
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index e3d8310..fa2a1f7 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -63,6 +63,7 @@
 		brightness-levels = <256 128 64 16 8 4 0>;
 		default-brightness-level = <6>;
 
+		power-supply = <&reg_12v>;
 		enable-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
 	};
 
@@ -107,6 +108,15 @@
 		regulator-always-on;
 	};
 
+	reg_12v: regulator2 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	rsnd_ak4613: sound {
 		compatible = "simple-audio-card";
 
-- 
2.7.4
