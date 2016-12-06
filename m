Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 7.mo178.mail-out.ovh.net ([46.105.58.91]:60816 "EHLO
        7.mo178.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751762AbcLFQfR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Dec 2016 11:35:17 -0500
Received: from player793.ha.ovh.net (b9.ovh.net [213.186.33.59])
        by mo178.mail-out.ovh.net (Postfix) with ESMTP id 0748AAF8B
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Dec 2016 17:34:38 +0100 (CET)
From: Jacopo Mondi <jacopo@jmondi.org>
To: wsa+renesas@sang-engineering.com, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFC] dts: arm: renesas: koelsh: Add MAX11100 device
Date: Tue,  6 Dec 2016 17:34:31 +0100
Message-Id: <1481042071-18659-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add node to test MAX11100 ADC with LED28 connected to the chip input
line.
The ADC sits on a gpio-spi master.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---

Sending as RFC only, not for inclusion.
Used to test MAX11100 ADC driver currently connected to Koelsch GPIO
expander.
Adding LED28 as ADC input line.

---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 5405d33..ac8f10d 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -170,6 +170,27 @@
 			gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
 			label = "LED8";
 		};
+		led28 {
+			gpios = <&gpio5 28 GPIO_ACTIVE_HIGH>;
+			label = "LED28";
+		};
+	};
+
+	spi_gpio: spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-sck = <&gpio5 27 GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio5 25 GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio5 26 GPIO_ACTIVE_LOW>;
+		status = "okay";
+
+		spi@0 {
+			compatible = "maxim,max11100";
+			reg = <0>;
+			spi-max-frequency = <2500000>;
+		};
 	};
 
 	vcc_sdhi0: regulator-vcc-sdhi0 {
-- 
2.7.4
