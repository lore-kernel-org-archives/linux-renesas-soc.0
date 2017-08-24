Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33829 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753142AbdHXT4V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 15:56:21 -0400
Received: by mail-lf0-f47.google.com with SMTP id d17so2086585lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2017 12:56:20 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170824195616.327888699@cogentembedded.com>
Date: Thu, 24 Aug 2017 22:56:07 +0300
To: Vinod Koul <vinod.koul@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] dmaengine: rcar-dmac: document R8A7797 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=dmaengine-rcar-dmac-document-R8A7797-bindings.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas  R-Car V3M (R8A7797) SoC also has the R-Car gen2/3 compatible DMA
controllers, so document the SoC specific binding.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'next' branch of Vinod Koul's 'slave-dma.git' repo.
 
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
+		- "renesas,dmac-r8a7797" (R-Car V3M)
 
 - reg: base address and length of the registers block for the DMAC
 
