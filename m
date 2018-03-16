Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753539AbeCPOxc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:53:32 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 6/8] dt-bindings: arm: Document Renesas V3MSK and Wheat board part numbers
Date: Fri, 16 Mar 2018 15:52:02 +0100
Message-Id: <04db44132bc544e12f8c7693db35a080edded6ee.1521206902.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521206902.git.horms+renesas@verge.net.au>
References: <cover.1521206902.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The DT binding documentation for the Renesas V3MSK and Wheat boards
lacked board part numbers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[simon: corrected Wheat part number]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index a99359e63b0a..66edc1406bb8 100644
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
+  - Wheat (RTP0RC7792ASKB0000JE)
     compatible = "renesas,wheat", "renesas,r8a7792"
 
 
-- 
2.11.0
