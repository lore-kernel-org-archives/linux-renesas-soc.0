Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751581AbeERLSS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:18:18 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 6/6] dt-bindings: arm: document Renesas V3HSK board bindings
Date: Fri, 18 May 2018 13:16:48 +0200
Message-Id: <c92db4a4a4c6c176c34604e456d6d355803d9ada.1526549153.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526549153.git.horms+renesas@verge.net.au>
References: <cover.1526549153.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Document the V3H Starter Kit device tree bindings, listing it as
a supported board.

This allows to use checkpatch.pl to validate .dts files referring to
the V3HSK board.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 0da876784dd5..593a7d82a1c8 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -130,6 +130,8 @@ Boards:
     compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
   - Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
     compatible = "renesas,stout", "renesas,r8a7790"
+  - V3HSK (Y-ASK-RCAR-V3H-WS10)
+    compatible = "renesas,v3hsk", "renesas,r8a77980"
   - V3MSK (Y-ASK-RCAR-V3M-WS10)
     compatible = "renesas,v3msk", "renesas,r8a77970"
   - Wheat (RTP0RC7792ASKB0000JE)
-- 
2.11.0
