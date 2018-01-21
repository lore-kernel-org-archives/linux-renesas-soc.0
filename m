Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40776 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750822AbeAUMMx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Jan 2018 07:12:53 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH V2 RESEND] gpio: of: make example syntactically correct
Date: Sun, 21 Jan 2018 13:12:43 +0100
Message-Id: <20180121121243.2038-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The ';' was missing. And cosmetic: there was a space too much.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---

No changes since V2, only Niklas' tag added.

Changes since V1:
* removed extra spaces (Thanks Sergei!)

 Documentation/devicetree/bindings/gpio/gpio.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index b5de08e3b1a2f1..91d33f75dd0e4d 100644
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
