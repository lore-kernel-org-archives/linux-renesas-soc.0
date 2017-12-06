Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47357 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754713AbdLFKVv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 05:21:51 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] ARM: shmobile: Document Renesas M3-W-based Salvator-XS board DT bindings
Date: Wed,  6 Dec 2017 11:21:43 +0100
Message-Id: <0021ca8ef7cad34a8077073ec3aaf638117681f5.1512553735.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512553735.git.horms+renesas@verge.net.au>
References: <cover.1512553735.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The Renesas Salvator-XS (Salvator-X 2nd version) development board can
be equipped with either an R-Car H3 ES2.0 or M3-W ES1.x SiP, which are
pin-compatible.

Document board part number and compatible values for the version with
R-Car M3-W.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 020d758fc0c5..062520a0e74c 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -104,6 +104,8 @@ Boards:
     compatible = "renesas,salvator-x", "renesas,r8a7796"
   - Salvator-XS (Salvator-X 2nd version, RTP0RC7795SIPB0012S)
     compatible = "renesas,salvator-xs", "renesas,r8a7795"
+  - Salvator-XS (Salvator-X 2nd version, RTP0RC7796SIPB0012S)
+    compatible = "renesas,salvator-xs", "renesas,r8a7796"
   - SILK (RTP0RC7794LCB00011S)
     compatible = "renesas,silk", "renesas,r8a7794"
   - SK-RZG1E (YR8A77450S000BE)
-- 
2.11.0
