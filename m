Return-Path: <devicetree-owner@vger.kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] dt-bindings: mmc: sh_mmcif: Document r8a7745 DT bindings
Date: Tue, 15 Aug 2017 17:53:27 +0100
Message-Id: <1502816007-30186-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
---
 Documentation/devicetree/bindings/mmc/renesas,mmcif.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
index 703e18c..5ff1e12 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
+++ b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
@@ -12,6 +12,7 @@ Required properties:
 	- "renesas,mmcif-r8a73a4" for the MMCIF found in r8a73a4 SoCs
 	- "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
 	- "renesas,mmcif-r8a7743" for the MMCIF found in r8a7743 SoCs
+	- "renesas,mmcif-r8a7745" for the MMCIF found in r8a7745 SoCs
 	- "renesas,mmcif-r8a7778" for the MMCIF found in r8a7778 SoCs
 	- "renesas,mmcif-r8a7790" for the MMCIF found in r8a7790 SoCs
 	- "renesas,mmcif-r8a7791" for the MMCIF found in r8a7791 SoCs
@@ -22,7 +23,7 @@ Required properties:
 - interrupts: Some SoCs have only 1 shared interrupt, while others have either
   2 or 3 individual interrupts (error, int, card detect). Below is the number
   of interrupts for each SoC:
-    1: r8a73a4, r8a7743, r8a7778, r8a7790, r8a7791, r8a7793, r8a7794
+    1: r8a73a4, r8a7743, r8a7745, r8a7778, r8a7790, r8a7791, r8a7793, r8a7794
     2: r8a7740, sh73a0
     3: r7s72100
 
-- 
2.7.4

