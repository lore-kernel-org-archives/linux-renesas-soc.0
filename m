Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:40325 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753286AbdBTROV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Feb 2017 12:14:21 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: geert+renesas@glider.be, laurent.pinchart@ideasonboard.com,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 6/7] arm: dts: genmai: Add RIIC2 pin group
Date: Mon, 20 Feb 2017 18:13:07 +0100
Message-Id: <1487610788-6939-7-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add pin configuration subnode for RIIC2 interface.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index f7be440..467a8a1 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -43,6 +43,12 @@
 		renesas,pins = <PIN(3, 0) 6>,
 			       <PIN(3, 2) (4 | INPUT_EN)>;
 	};
+
+	i2c2_pins: i2c2 {
+		/* RIIC2: P1_4 as SCL, P1_5 as SDA */
+		renesas,pins = <PIN(1, 4) (1 | INPUT_EN)>,
+			       <PIN(1, 5) (1 | INPUT_EN)>;
+	};
 };
 
 &extal_clk {
@@ -61,6 +67,9 @@
 	status = "okay";
 	clock-frequency = <400000>;
 
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+
 	eeprom@50 {
 		compatible = "renesas,24c128";
 		reg = <0x50>;
-- 
2.7.4
