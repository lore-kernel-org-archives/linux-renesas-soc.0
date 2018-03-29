Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:17257 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750795AbeC2KOr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Mar 2018 06:14:47 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Vinod Koul <vinod.koul@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dt-bindings: rcar-dmac: Document r8a77470 support
Date: Thu, 29 Mar 2018 11:11:06 +0100
Message-Id: <1522318266-45281-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas  RZ/G SoC also have the R-Car gen2/3 compatible DMA controllers.
Document RZ/G1C (also known as R8A77470) SoC bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
index 891db41..b5e603c 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
@@ -18,6 +18,7 @@ Required Properties:
 	      Examples with soctypes are:
 		- "renesas,dmac-r8a7743" (RZ/G1M)
 		- "renesas,dmac-r8a7745" (RZ/G1E)
+		- "renesas,dmac-r8a77470" (RZ/G1C)
 		- "renesas,dmac-r8a7790" (R-Car H2)
 		- "renesas,dmac-r8a7791" (R-Car M2-W)
 		- "renesas,dmac-r8a7792" (R-Car V2H)
-- 
2.7.4
