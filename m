Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:36459 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753548AbcI1WZw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2016 18:25:52 -0400
Received: by mail-lf0-f43.google.com with SMTP id g62so65419998lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Sep 2016 15:25:51 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: vinod.koul@intel.com, robh+dt@kernel.org, mark.rutland@arm.com,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] DT: dma: rcar-dmac: document R8A7743/5 support
Date: Thu, 29 Sep 2016 01:25:48 +0300
Message-ID: <1702913.ppLd1lBExD@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas  RZ/G SoC also have the R-Car gen2/3 compatible DMA controllers.
Document RZ/G1[ME] (also known as R8A774[35]) SoC bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'next' branch of Vinod Koul's 'slave-dma.git' repo.
 
 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: slave-dma/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
===================================================================
--- slave-dma.orig/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
+++ slave-dma/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
@@ -1,4 +1,4 @@
-* Renesas R-Car DMA Controller Device Tree bindings
+* Renesas R-Car (RZ/G) DMA Controller Device Tree bindings
 
 Renesas R-Car Generation 2 SoCs have multiple multi-channel DMA
 controller instances named DMAC capable of serving multiple clients. Channels
@@ -16,6 +16,8 @@ Required Properties:
 
 - compatible: "renesas,dmac-<soctype>", "renesas,rcar-dmac" as fallback.
 	      Examples with soctypes are:
+		- "renesas,dmac-r8a7743" (RZ/G1M)
+		- "renesas,dmac-r8a7745" (RZ/G1E)
 		- "renesas,dmac-r8a7790" (R-Car H2)
 		- "renesas,dmac-r8a7791" (R-Car M2-W)
 		- "renesas,dmac-r8a7792" (R-Car V2H)
