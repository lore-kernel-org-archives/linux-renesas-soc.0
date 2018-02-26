Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] dt-bindings: arm: Document Renesas V3MSK and Wheat board part numbers
Date: Mon, 26 Feb 2018 19:03:43 +0100
Message-Id: <1519668225-12548-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
References: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The DT binding documentation for the Renesas V3MSK and Wheat boards
lacked board part numbers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index ded2cd3b5f4df0c8..82908a9447e4b051 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -120,9 +120,9 @@ Boards:
     compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
   - Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
     compatible = "renesas,stout", "renesas,r8a7790"
-  - V3MSK
+  - V3MSK (Y-ASK-RCAR-V3M-WS10)
     compatible = "renesas,v3msk", "renesas,r8a77970"
-  - Wheat
+  - Wheat (RTP0RC7792ASKB0010JE)
     compatible = "renesas,wheat", "renesas,r8a7792"
 
 
-- 
2.7.4

