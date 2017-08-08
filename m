Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:56645 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751927AbdHHLfJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2017 07:35:09 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  1/2] dt-bindings: i2c: Document r8a7743/5 support
Date: Tue,  8 Aug 2017 12:20:31 +0100
Message-Id: <1502191231-8682-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document i2c Device Tree support for RZ/G1[ME]
(also known as r8aA774[35]) SoCs. They are compatible with
R-Car Gen2 SoC family.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/i2c/i2c-rcar.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
index 2b8bd33..cad39ae 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
@@ -2,6 +2,8 @@ I2C for R-Car platforms
 
 Required properties:
 - compatible:
+	"renesas,i2c-r8a7743" if the device is a part of a R8A7743 SoC.
+	"renesas,i2c-r8a7745" if the device is a part of a R8A7745 SoC.
 	"renesas,i2c-r8a7778" if the device is a part of a R8A7778 SoC.
 	"renesas,i2c-r8a7779" if the device is a part of a R8A7779 SoC.
 	"renesas,i2c-r8a7790" if the device is a part of a R8A7790 SoC.
@@ -12,7 +14,8 @@ Required properties:
 	"renesas,i2c-r8a7795" if the device is a part of a R8A7795 SoC.
 	"renesas,i2c-r8a7796" if the device is a part of a R8A7796 SoC.
 	"renesas,rcar-gen1-i2c" for a generic R-Car Gen1 compatible device.
-	"renesas,rcar-gen2-i2c" for a generic R-Car Gen2 compatible device.
+	"renesas,rcar-gen2-i2c" for a generic R-Car Gen2 or RZ/G1 compatible
+				device.
 	"renesas,rcar-gen3-i2c" for a generic R-Car Gen3 compatible device.
 	"renesas,i2c-rcar" (deprecated)
 
-- 
1.9.1
