Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:41802 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751019AbeECNCp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 May 2018 09:02:45 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 1/3] arm64: dts: renesas: ulcb: Add BD9571 PMIC
Date: Thu,  3 May 2018 14:30:49 +0200
Message-Id: <1525350651-12471-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1525350651-12471-1-git-send-email-geert+renesas@glider.be>
References: <1525350651-12471-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a device node for the ROHM BD9571MWV PMIC.

This was based on the example in the DT binding documentation, but using
IRQ0 instead of a GPIO interrupt, as that matches the schematics, and
because INTC-EX is a simpler block.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - No changes,

v2:
  - New.
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 6f814845f8b665f3..bb21ae335e8b8489 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -243,6 +243,30 @@
 
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
 
 &ohci1 {
@@ -276,6 +300,11 @@
 		function = "i2c2";
 	};
 
+	irq0_pins: irq0 {
+		groups = "intc_ex_irq0";
+		function = "intc_ex";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data_a";
 		function = "scif2";
-- 
2.7.4
