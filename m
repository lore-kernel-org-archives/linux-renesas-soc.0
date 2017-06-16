Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54739 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753771AbdFPNbV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 09:31:21 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/5] ARM: shmobile: document iW-RainboW-G20D-Qseven-RZG1M board
Date: Fri, 16 Jun 2017 15:30:56 +0200
Message-Id: <9086120f8b883034940e5228c83824ed21999537.1497617896.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1497617896.git.horms+renesas@verge.net.au>
References: <cover.1497617896.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Document the iW-RainboW-G20D-Qseven-RZG1M device tree bindings,
listing it as a supported board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index fe850ef98dd8..c9c8e40c2ce5 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -61,6 +61,8 @@ Boards:
     compatible = "renesas,h3ulcb", "renesas,r8a7795";
   - Henninger
     compatible = "renesas,henninger", "renesas,r8a7791"
+  - iWave Systems RZ/G1M Qseven Development Platform (iW-RainboW-G20D-Qseven)
+    compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743"
   - iWave Systems RZ/G1M Qseven System On Module (iW-RainboW-G20M-Qseven)
     compatible = "iwave,g20m", "renesas,r8a7743"
   - Koelsch (RTP0RC7791SEB00010S)
-- 
2.1.4
