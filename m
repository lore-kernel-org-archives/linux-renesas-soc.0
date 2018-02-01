Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:37271 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752597AbeBATJ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Feb 2018 14:09:29 -0500
Received: by mail-lf0-f68.google.com with SMTP id 63so27841776lfv.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Feb 2018 11:09:28 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] DT: dma: renesas,rcar-dmac: document R8A77980 support
To: vinod.koul@intel.com, robh+dt@kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org
Message-ID: <8302f1c8-3deb-584b-d6c8-b46240275e9e@cogentembedded.com>
Date: Thu, 1 Feb 2018 22:09:25 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas  R-Car V3H SoC has the R-Car gen3 compatible DMA controllers.
Document R-Car V3H (also known as R8A77980) SoC bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt |    1 +
 1 file changed, 1 insertion(+)

Index: slave-dma/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
===================================================================
--- slave-dma.orig/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
+++ slave-dma/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
@@ -26,6 +26,7 @@ Required Properties:
 		- "renesas,dmac-r8a7795" (R-Car H3)
 		- "renesas,dmac-r8a7796" (R-Car M3-W)
 		- "renesas,dmac-r8a77970" (R-Car V3M)
+		- "renesas,dmac-r8a77980" (R-Car V3H)
 
 - reg: base address and length of the registers block for the DMAC
 
