Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33917 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750802AbdLWUGq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Dec 2017 15:06:46 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH V2] gpio: of: make example syntactically correct
Date: Sat, 23 Dec 2017 21:06:41 +0100
Message-Id: <20171223200641.3709-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The ';' was missing. And cosmetic: there was a space too much.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since V1:
* removed extra spaces (Thanks Sergei!)

 Documentation/devicetree/bindings/gpio/gpio.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 802402f6cc5d89..bc5fe95d33fff0 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -33,12 +33,12 @@ The following example could be used to describe GPIO pins used as device enable
 and bit-banged data signals:
 
 	gpio1: gpio1 {
-		gpio-controller
-		 #gpio-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
 	};
 	gpio2: gpio2 {
-		gpio-controller
-		 #gpio-cells = <1>;
+		gpio-controller;
+		#gpio-cells = <1>;
 	};
 	[...]
 
-- 
2.11.0
