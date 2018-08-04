Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37270 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727877AbeHDSjf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Aug 2018 14:39:35 -0400
Received: by mail-wr1-f65.google.com with SMTP id u12-v6so8273180wrr.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Aug 2018 09:38:21 -0700 (PDT)
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2] ARM: dts: silk: Add DA9063 PMIC node
Date: Sat,  4 Aug 2018 18:38:18 +0200
Message-Id: <20180804163818.23360-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add DA9063 PMIC node to the I2C bus.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Replace shmobile with dts since it's a DT patch in subject
    - Connect the 9063_IRQ# line to GP3_31
    - Since the DA9063 is connected to both i2c1 and i2c7, connect
      it to i2c7, which is the dedicated dvfs i2c.
---
 arch/arm/boot/dts/r8a7794-silk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index daec965889d3..6ea60e1faf75 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -405,6 +405,23 @@
 	clock-frequency = <400000>;
 };
 
+&i2c7 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	pmic@58 {
+		compatible = "dlg,da9063";
+		reg = <0x58>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+
+		wdt {
+			compatible = "dlg,da9063-watchdog";
+		};
+	};
+};
+
 &mmcif0 {
 	pinctrl-0 = <&mmcif0_pins>;
 	pinctrl-names = "default";
-- 
2.16.2
