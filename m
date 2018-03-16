Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753585AbeCPOx1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:53:27 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/8] dt-bindings: arm: document R8A77980 SoC bindings
Date: Fri, 16 Mar 2018 15:51:57 +0100
Message-Id: <f15092f8482b63b91d7ca7f4bd7090da7f9f2f24.1521206902.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521206902.git.horms+renesas@verge.net.au>
References: <cover.1521206902.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Document the R-Car V3H (R8A77980) SoC device tree bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 5c3af7ef0761..3ccad353acfa 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -41,6 +41,8 @@ SoCs:
     compatible = "renesas,r8a7796"
   - R-Car V3M (R8A77970)
     compatible = "renesas,r8a77970"
+  - R-Car V3H (R8A77980)
+    compatible = "renesas,r8a77980"
   - R-Car D3 (R8A77995)
     compatible = "renesas,r8a77995"
 
-- 
2.11.0
