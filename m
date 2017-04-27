Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: linus.walleij@linaro.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com,
        robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/10] arm: dts: genmai: Add RIIC2 pin group
Date: Thu, 27 Apr 2017 10:19:52 +0200
Message-Id: <1493281194-5200-9-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add pin configuration subnode for RIIC2 interface.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index c28d74b..9add1b6 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -43,6 +43,12 @@
 		/* P3_0 as TxD2; P3_2 as RxD2 */
 		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
 	};
+
+	i2c2_pins: i2c2 {
+		/* RIIC2: P1_4 as SCL, P1_5 as SDA */
+		pinmux = <RZA1_PINMUX(1, 4, 1)>, <RZA1_PINMUX(1, 5, 1)>;
+		bi-directional;
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
