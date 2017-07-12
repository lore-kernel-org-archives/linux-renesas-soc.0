Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:50316 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751347AbdGLKYM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jul 2017 06:24:12 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] spi: sh-msiof: Add support for R-Car H3
Date: Wed, 12 Jul 2017 12:24:07 +0200
Message-Id: <1499855047-20177-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for MSIOF in r8a7795 (R-Car H3).
Due to a hardware erratum on R-Car H3 ES1.x, this is only supported on
ES2.0 and later.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop RFC status,
  - Rebased,
  - Drop matching on "renesas,msiof-r8a7795", as the driver started
    matching against "renesas,rcar-gen3-msiof" in the mean time.
---
 Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index 64ee489571c42f88..39e5ef7c5e71694e 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -6,6 +6,7 @@ Required properties:
 			 "renesas,msiof-r8a7792" (R-Car V2H)
 			 "renesas,msiof-r8a7793" (R-Car M2-N)
 			 "renesas,msiof-r8a7794" (R-Car E2)
+			 "renesas,msiof-r8a7795" (R-Car H3)
 			 "renesas,msiof-r8a7796" (R-Car M3-W)
 			 "renesas,msiof-sh73a0" (SH-Mobile AG5)
 			 "renesas,sh-mobile-msiof" (generic SH-Mobile compatibile device)
-- 
2.7.4
