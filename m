Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:52735 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751480AbeCTVx3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 17:53:29 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] dt-bindings: i2c: document R8A77965 bindings
Date: Tue, 20 Mar 2018 22:53:20 +0100
Message-Id: <20180320215320.21628-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car M3-N (R8A77965) SoC has a R-Car Gen3-compatible I2C controller.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/i2c/i2c-rcar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
index e91dbafe71e5d9..4a7811ecd95447 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
@@ -13,6 +13,7 @@ Required properties:
 	"renesas,i2c-r8a7794" if the device is a part of a R8A7794 SoC.
 	"renesas,i2c-r8a7795" if the device is a part of a R8A7795 SoC.
 	"renesas,i2c-r8a7796" if the device is a part of a R8A7796 SoC.
+	"renesas,i2c-r8a77965" if the device is a part of a R8A77965 SoC.
 	"renesas,i2c-r8a77970" if the device is a part of a R8A77970 SoC.
 	"renesas,i2c-r8a77995" if the device is a part of a R8A77995 SoC.
 	"renesas,rcar-gen1-i2c" for a generic R-Car Gen1 compatible device.
-- 
2.11.0
