Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:34250 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752968AbdC1JpD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 05:45:03 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: r8a7795: salvator-x: Add current sense amplifiers
Date: Tue, 28 Mar 2017 11:44:42 +0200
Message-Id: <1490694282-9439-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add device nodes for two Maxim max961x current sense amplifiers
sensing the VDD_0.8V and DVFS_0.8V lines.

Based on a patch for r8a7796-salvator-x.dts by Jacopo Mondi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Pending acceptance of the maxim,max9611 DT bindings.

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index f25241921067dcef..dca1c180757a2b68 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -400,6 +400,24 @@
 	};
 };
 
+&i2c4 {
+	status = "okay";
+
+	csa_vdd: adc@7c {
+		compatible = "maxim,max9611";
+		reg = <0x7c>;
+
+		shunt-resistor-uohm = <5000>;
+	};
+
+	csa_dvfs: adc@7f {
+		compatible = "maxim,max9611";
+		reg = <0x7f>;
+
+		shunt-resistor-uohm = <5000>;
+	};
+};
+
 &rcar_sound {
 	pinctrl-0 = <&sound_pins &sound_clk_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
