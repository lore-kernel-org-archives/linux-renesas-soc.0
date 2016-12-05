Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 7.mo68.mail-out.ovh.net ([46.105.63.230]:42927 "EHLO
        7.mo68.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751496AbcLEJjZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 04:39:25 -0500
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
        by mo68.mail-out.ovh.net (Postfix) with ESMTP id 7A4FE166E6
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2016 10:20:20 +0100 (CET)
From: Jacopo Mondi <jacopo@jmondi.org>
To: magnus.damm@gmail.com, geert+renesas@glider.be
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFCv2 2/2] dts: arm: genmai: Add MAXDESREF4x spidev
Date: Mon,  5 Dec 2016 10:20:05 +0100
Message-Id: <1480929605-28564-3-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1480929605-28564-1-git-send-email-jacopo@jmondi.org>
References: <1480693434-9415-1-git-send-email-jacopo@jmondi.org>
 <1480929605-28564-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add device node for the MAX11100 evaluation board connected to Genmai's
CN2.
The evaluation kit is connected to 3 GPIO lines configured as bitbanged
SPI master interface.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 233908b..659efbf 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -46,6 +46,23 @@
 		};
 	};
 
+	spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-miso = <&port11 10 GPIO_ACTIVE_HIGH>;
+		gpio-sck = <&port11  9 GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&port11 11 GPIO_ACTIVE_HIGH>;
+		status = "ok";
+
+		maxrefdes4x@0 {
+			compatible = "spidev";
+			reg = <0>;
+			spi-max-frequency = <240000>;
+		};
+	};
 };
 
 &extal_clk {
@@ -123,3 +140,7 @@
 		spi-max-frequency = <5000000>;
 	};
 };
+
+&port11 {
+	status = "okay";
+};
-- 
2.7.4
