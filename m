Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34495 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752258AbdI2LyC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:54:02 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 8/8] ARM: shmobile: remove inconsistent ; from documentation
Date: Fri, 29 Sep 2017 13:52:55 +0200
Message-Id: <2e931b06de97d762ef139bffbbe75e1483735734.1506676368.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506676368.git.horms+renesas@verge.net.au>
References: <cover.1506676368.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Consistently do not suffix compat string documentation with a ';'

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 4fa984ada912..020d758fc0c5 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -69,7 +69,7 @@ Boards:
     compatible = "renesas,gose", "renesas,r8a7793"
   - H3ULCB (R-Car Starter Kit Premier, RTP0RC7795SKBX0010SA00 (H3 ES1.1))
     H3ULCB (R-Car Starter Kit Premier, RTP0RC77951SKBX010SA00 (H3 ES2.0))
-    compatible = "renesas,h3ulcb", "renesas,r8a7795";
+    compatible = "renesas,h3ulcb", "renesas,r8a7795"
   - Henninger
     compatible = "renesas,henninger", "renesas,r8a7791"
   - iWave Systems RZ/G1E SODIMM SOM Development Platform (iW-RainboW-G22D)
@@ -91,7 +91,7 @@ Boards:
   - Lager (RTP0RC7790SEB00010S)
     compatible = "renesas,lager", "renesas,r8a7790"
   - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
-    compatible = "renesas,m3ulcb", "renesas,r8a7796";
+    compatible = "renesas,m3ulcb", "renesas,r8a7796"
   - Marzen (R0P7779A00010S)
     compatible = "renesas,marzen", "renesas,r8a7779"
   - Porter (M2-LCDP)
@@ -99,11 +99,11 @@ Boards:
   - RSKRZA1 (YR0K77210C000BE)
     compatible = "renesas,rskrza1", "renesas,r7s72100"
   - Salvator-X (RTP0RC7795SIPB0010S)
-    compatible = "renesas,salvator-x", "renesas,r8a7795";
+    compatible = "renesas,salvator-x", "renesas,r8a7795"
   - Salvator-X (RTP0RC7796SIPB0011S)
-    compatible = "renesas,salvator-x", "renesas,r8a7796";
+    compatible = "renesas,salvator-x", "renesas,r8a7796"
   - Salvator-XS (Salvator-X 2nd version, RTP0RC7795SIPB0012S)
-    compatible = "renesas,salvator-xs", "renesas,r8a7795";
+    compatible = "renesas,salvator-xs", "renesas,r8a7795"
   - SILK (RTP0RC7794LCB00011S)
     compatible = "renesas,silk", "renesas,r8a7794"
   - SK-RZG1E (YR8A77450S000BE)
-- 
2.1.4
