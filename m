Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41481 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760456AbcKDJpR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 05:45:17 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 4/9] ARM: shmobile: document SK-RZG1M board
Date: Fri,  4 Nov 2016 10:44:38 +0100
Message-Id: <7c1959d6879f29c2b789c572e8f358d77b49d39b.1478251657.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1478251657.git.horms+renesas@verge.net.au>
References: <cover.1478251657.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Document the SK-RZG1M device tree bindings, listing it as a supported board.

This allows to use checkpatch.pl to validate .dts files referring to the
SK-RZG1M board.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 058be8180bc4..785d1f847acb 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -75,5 +75,7 @@ Boards:
     compatible = "renesas,salvator-x", "renesas,r8a7796";
   - SILK (RTP0RC7794LCB00011S)
     compatible = "renesas,silk", "renesas,r8a7794"
+  - SK-RZG1M (YR8A77430S000BE)
+    compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
   - Wheat
     compatible = "renesas,wheat", "renesas,r8a7792"
-- 
2.7.0.rc3.207.g0ac5344
