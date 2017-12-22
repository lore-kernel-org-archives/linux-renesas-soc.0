Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58871 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755940AbdLVUJW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Dec 2017 15:09:22 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] gpio: pca953x: add required properties to example in bindings
Date: Fri, 22 Dec 2017 21:09:00 +0100
Message-Id: <20171222200900.8367-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The binding documentation was missing two required properties in the
example. Fix it and add them also to the list of required properties.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index 0d0158728f897b..a3d51e1cafe972 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -30,6 +30,11 @@ Required properties:
 	onnn,pca9654
 	exar,xra1202
 
+- gpio-controller: Marks the device node as a GPIO controller
+- #gpio-cells: Must be '2':
+	- First cell is the GPIO line number
+	- Second cell is for optional parameters (currently unused)
+
 Optional properties:
  - reset-gpios: GPIO specification for the RESET input. This is an
 		active low signal to the PCA953x.
@@ -44,4 +49,6 @@ Example:
 		pinctrl-0 = <&pinctrl_pca9505>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
+		#gpio-cells = <2>;
 	};
-- 
2.11.0
