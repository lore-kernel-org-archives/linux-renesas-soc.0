Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:58220 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761012AbdDSIf4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 04:35:56 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: r8a7795: salvator-x: Add current sense amplifiers
Date: Wed, 19 Apr 2017 10:35:50 +0200
Message-Id: <1492590950-10534-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add device nodes for two Maxim max961x current sense amplifiers
sensing the VDD_0.8V and DVFS_0.8V lines.

Based on a patch for r8a7796-salvator-x.dts by Jacopo Mondi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Bindings and driver are now in staging-next.

v2:
  - Use shunt-resistor-micro-ohms to match updated bindings.
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index ff68bac4cd7ed2f5..bd6cccb0d4a75561 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -415,6 +415,24 @@
 	};
 };
 
+&i2c4 {
+	status = "okay";
+
+	csa_vdd: adc@7c {
+		compatible = "maxim,max9611";
+		reg = <0x7c>;
+
+		shunt-resistor-micro-ohms = <5000>;
+	};
+
+	csa_dvfs: adc@7f {
+		compatible = "maxim,max9611";
+		reg = <0x7f>;
+
+		shunt-resistor-micro-ohms = <5000>;
+	};
+};
+
 &rcar_sound {
 	pinctrl-0 = <&sound_pins &sound_clk_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
