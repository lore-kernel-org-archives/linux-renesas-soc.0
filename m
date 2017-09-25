Return-Path: <devicetree-owner@vger.kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/2] dt-bindings: spi: sh-msiof: Add r8a774[35] to the compatible list
Date: Mon, 25 Sep 2017 09:54:20 +0100
Message-Id: <1506329660-4064-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1506329660-4064-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1506329660-4064-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/spi/sh-msiof.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index e865855..bdd8395 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -1,7 +1,9 @@
 Renesas MSIOF spi controller
 
 Required properties:
-- compatible           : "renesas,msiof-r8a7790" (R-Car H2)
+- compatible           : "renesas,msiof-r8a7743" (RZ/G1M)
+			 "renesas,msiof-r8a7745" (RZ/G1E)
+			 "renesas,msiof-r8a7790" (R-Car H2)
 			 "renesas,msiof-r8a7791" (R-Car M2-W)
 			 "renesas,msiof-r8a7792" (R-Car V2H)
 			 "renesas,msiof-r8a7793" (R-Car M2-N)
@@ -10,7 +12,7 @@ Required properties:
 			 "renesas,msiof-r8a7796" (R-Car M3-W)
 			 "renesas,msiof-sh73a0" (SH-Mobile AG5)
 			 "renesas,sh-mobile-msiof" (generic SH-Mobile compatibile device)
-			 "renesas,rcar-gen2-msiof" (generic R-Car Gen2 compatible device)
+			 "renesas,rcar-gen2-msiof" (generic R-Car Gen2 and RZ/G1 compatible device)
 			 "renesas,rcar-gen3-msiof" (generic R-Car Gen3 compatible device)
 			 "renesas,sh-msiof"      (deprecated)
 
-- 
2.7.4

