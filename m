Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58864 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755940AbdLVUIv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Dec 2017 15:08:51 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] gpio: of: make example syntactically correct
Date: Fri, 22 Dec 2017 21:08:40 +0100
Message-Id: <20171222200840.8317-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The ';' was missing.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 802402f6cc5d89..53e0a0e01a4ee0 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -33,11 +33,11 @@ The following example could be used to describe GPIO pins used as device enable
 and bit-banged data signals:
 
 	gpio1: gpio1 {
-		gpio-controller
+		gpio-controller;
 		 #gpio-cells = <2>;
 	};
 	gpio2: gpio2 {
-		gpio-controller
+		gpio-controller;
 		 #gpio-cells = <1>;
 	};
 	[...]
-- 
2.11.0
