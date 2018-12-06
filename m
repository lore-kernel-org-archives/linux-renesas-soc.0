Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbeLFV7u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:50 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/3] dt-bindings: arm: renesas: Document iW-RainboW-G20D-Qseven-RZG1N board
Date: Thu,  6 Dec 2018 13:59:12 -0800
Message-Id: <ea456bf918e31a0f755c5c02963b4e10513fa82c.1544124873.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544124873.git.horms+renesas@verge.net.au>
References: <cover.1544124873.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Document the iW-RainboW-G20D-Qseven-RZG1N device tree bindings,
listing it as a supported board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 4cfb56787a90..144f045a9f4b 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -101,6 +101,8 @@ Boards:
     compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743"
   - iWave Systems RZ/G1M Qseven System On Module (iW-RainboW-G20M-Qseven)
     compatible = "iwave,g20m", "renesas,r8a7743"
+  - iWave Systems RZ/G1N Qseven Development Platform (iW-RainboW-G20D-Qseven)
+    compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7744"
   - iWave Systems RZ/G1N Qseven System On Module (iW-RainboW-G20M-Qseven)
     compatible = "iwave,g20m", "renesas,r8a7744"
   - Kingfisher (SBEV-RCAR-KF-M03)
-- 
2.11.0
