Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg1-f171.google.com ([209.85.215.171]:42488 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbeLBB4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Dec 2018 20:56:23 -0500
Received: by mail-pg1-f171.google.com with SMTP id d72so3768994pga.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Dec 2018 06:43:44 -0800 (PST)
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm64: dts: renesas: r8a77990-ebisu: Add BD9571 PMIC
Date: Sat,  1 Dec 2018 23:43:28 +0900
Message-Id: <1543675408-11382-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds the regulator definition required for operation of
S2RAM.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 62bdddc..3eee419 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -425,6 +425,26 @@
 	};
 };
 
+&i2c_dvfs {
+	status = "okay";
+
+	clock-frequency = <400000>;
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
+	};
+};
+
 &lvds0 {
 	status = "okay";
 
@@ -480,6 +500,11 @@
 		function = "du";
 	};
 
+	irq0_pins: irq0 {
+		groups = "intc_ex_irq0";
+		function = "intc_ex";
+	};
+
 	pwm3_pins: pwm3 {
 		groups = "pwm3_b";
 		function = "pwm3";
-- 
1.9.1
