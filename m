Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:49934 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756209AbdJJO6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 10:58:39 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] arm64: dts: renesas: salvator-common: Add BD9571 PMIC
Date: Tue, 10 Oct 2017 16:58:36 +0200
Message-Id: <1507647516-28993-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a device node for the ROHM BD9571MWV PMIC, based on the example in
the DT binding documentation, but using INTC-EX instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Do we need to describe more regulators?

This depends on:
  - [PATCH] pinctrl: sh-pfc: r8a7796: Add support for INTC-EX IRQ pins,
  - [PATCH] pinctrl: sh-pfc: r8a7795: Add INTC-EX pins, groups and
    function.
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 3dcb26b1cb6bdec0..c171718bac7f52a1 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -353,6 +353,30 @@
 
 &i2c_dvfs {
 	status = "okay";
+
+	pmic: pmic@30 {
+		pinctrl-0 = <&irq0_pins>;
+		pinctrl-names = "default";
+
+		compatible = "rohm,bd9571mwv";
+		reg = <0x30>;
+		interrupt-parent = <&intc_ex>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		regulators {
+			dvfs: dvfs {
+				regulator-name = "dvfs";
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <1030000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
 };
 
 &ohci0 {
@@ -407,6 +431,11 @@
 		function = "i2c2";
 	};
 
+	irq0_pins: irq0 {
+		groups = "intc_ex_irq0";
+		function = "intc_ex";
+	};
+
 	pwm1_pins: pwm1 {
 		groups = "pwm1_a";
 		function = "pwm1";
-- 
2.7.4
