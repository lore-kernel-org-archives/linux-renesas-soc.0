Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 10.mo1.mail-out.ovh.net ([178.32.96.102]:54276 "EHLO
        10.mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751882AbcLBQDq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2016 11:03:46 -0500
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
        by mo1.mail-out.ovh.net (Postfix) with ESMTP id AB7F02158A
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2016 16:44:34 +0100 (CET)
From: Jacopo Mondi <jacopo@jmondi.org>
To: magnus.damm@gmail.com, geert+renesas@glider.be
Cc: linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: [RFC 2/3] dts: arm: genmai: Add MAXDESREF4x spidev
Date: Fri,  2 Dec 2016 16:43:53 +0100
Message-Id: <1480693434-9415-3-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1480693434-9415-1-git-send-email-jacopo@jmondi.org>
References: <1480693434-9415-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add device node for the MAX11100 evaluation board connected to Genmai's
CN2.
The evaluation kit is connected to 4 GPIO lines configured ad bitbanged
SPI master interface

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 233908b..89a1977 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -46,6 +46,24 @@
 		};
 	};
 
+	spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+
+		gpio-miso = <&port11 10 GPIO_ACTIVE_HIGH>;
+		gpio-sck = <&port11  9 GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&port11 11 GPIO_ACTIVE_HIGH>;
+		status = "ok";
+
+		maxrefdes4x {
+			compatible = "linux,spidev";
+			reg = <0>;
+			spi-max-frequency = <240000>;
+		};
+	};
 };
 
 &extal_clk {
@@ -123,3 +141,7 @@
 		spi-max-frequency = <5000000>;
 	};
 };
+
+&port11 {
+	status = "okay";
+};
-- 
2.7.4
