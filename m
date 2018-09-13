Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34550 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbeIMORX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 10:17:23 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 07/13] ARM: dts: silk: Add DA9063 PMIC node
Date: Thu, 13 Sep 2018 11:08:30 +0200
Message-Id: <bce6d67d035eeaea20dcee12b1362cebde6d9b35.1536824376.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1536824376.git.horms+renesas@verge.net.au>
References: <cover.1536824376.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Marek Vasut <marek.vasut@gmail.com>

Add DA9063 PMIC node to the I2C bus.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
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
2.11.0
