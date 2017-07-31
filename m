Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42967 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752466AbdGaPEl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:04:41 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 4/5] ARM: shmobile: Document R-Car D3 SoC DT bindings
Date: Mon, 31 Jul 2017 17:04:30 +0200
Message-Id: <f03783efc4cb9e07262bd2a877fc96bfa1697a18.1501512759.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501512759.git.horms+renesas@verge.net.au>
References: <cover.1501512759.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Note that r8a77995 is the first Renesas "r8a<n>" SoC matching against a 5
digit number, as r8a77990 will be a different SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 1a671e329864..91f92d626502 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -39,6 +39,8 @@ SoCs:
     compatible = "renesas,r8a7795"
   - R-Car M3-W (R8A77960)
     compatible = "renesas,r8a7796"
+  - R-Car D3 (R8A77995)
+    compatible = "renesas,r8a77995"
 
 
 Boards:
-- 
2.1.4
