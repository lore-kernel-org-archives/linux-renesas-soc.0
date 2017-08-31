Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:36569 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750908AbdHaU7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 16:59:42 -0400
Received: by mail-lf0-f53.google.com with SMTP id z12so2981987lfd.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2017 13:59:41 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170831205936.865765713@cogentembedded.com>
Date: Thu, 31 Aug 2017 23:59:24 +0300
To: Vinod Koul <vinod.koul@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] dmaengine: rcar-dmac: document R8A77970 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=dmaengine-rcar-dmac-document-R8A77970-bindings-v2.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas R-Car V3M (R8A77970) SoC also has the R-Car gen2/3 compatible DMA
controllers, so document the SoC specific binding.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'next' branch of Vinod Koul's 'slave-dma.git' repo.
 
Changes in version 2:
- changed R8A7797 to R8A77970 everywhere.

 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt |    1 +
 1 file changed, 1 insertion(+)

Index: slave-dma/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
===================================================================
--- slave-dma.orig/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
+++ slave-dma/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
@@ -25,6 +25,7 @@ Required Properties:
 		- "renesas,dmac-r8a7794" (R-Car E2)
 		- "renesas,dmac-r8a7795" (R-Car H3)
 		- "renesas,dmac-r8a7796" (R-Car M3-W)
+		- "renesas,dmac-r8a77970" (R-Car V3M)
 
 - reg: base address and length of the registers block for the DMAC
 
