Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55766 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727243AbeGTKsG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 06:48:06 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: rcar: Add compatible support for r8a77990 (R-Car E3)
Date: Fri, 20 Jul 2018 12:00:24 +0200
Message-Id: <20180720100024.2314-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

This patch adds compatible string support for the Renesas R-Car E3
(r8a77990) SoC.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/i2c/i2c-rcar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
index 7ce8fae55537..7bb64846d6fd 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
@@ -16,6 +16,7 @@ Required properties:
 	"renesas,i2c-r8a77965" if the device is a part of a R8A77965 SoC.
 	"renesas,i2c-r8a77970" if the device is a part of a R8A77970 SoC.
 	"renesas,i2c-r8a77980" if the device is a part of a R8A77980 SoC.
+	"renesas,i2c-r8a77990" if the device is a part of a R8A77990 SoC.
 	"renesas,i2c-r8a77995" if the device is a part of a R8A77995 SoC.
 	"renesas,rcar-gen1-i2c" for a generic R-Car Gen1 compatible device.
 	"renesas,rcar-gen2-i2c" for a generic R-Car Gen2 or RZ/G1 compatible
-- 
2.11.0
