Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34495 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752454AbdI2Lx5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:53:57 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/8] ARM: shmobile: Document R-Car V3M SoC DT bindings
Date: Fri, 29 Sep 2017 13:52:50 +0200
Message-Id: <443c1631172a7a6dc19c1657425354327858a548.1506676368.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506676368.git.horms+renesas@verge.net.au>
References: <cover.1506676368.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index ae75cb3b1331..a1f06711a4dd 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -39,6 +39,8 @@ SoCs:
     compatible = "renesas,r8a7795"
   - R-Car M3-W (R8A77960)
     compatible = "renesas,r8a7796"
+  - R-Car V3M (R8A77970)
+    compatible = "renesas,r8a77970"
   - R-Car D3 (R8A77995)
     compatible = "renesas,r8a77995"
 
-- 
2.1.4
