Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33751 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761768AbcINQqF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 12:46:05 -0400
Received: by mail-wm0-f67.google.com with SMTP id b187so3351734wme.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 09:46:04 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: horms@verge.net.au, magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 3/3] dmaengine: rcar-dmac: Document R-Car M3-W bindings
Date: Wed, 14 Sep 2016 18:45:49 +0200
Message-Id: <20160914164549.31121-4-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <20160914164549.31121-1-ulrich.hecht+renesas@gmail.com>
References: <20160914164549.31121-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
index 5b902ac..5df8f4e 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
@@ -22,6 +22,7 @@ Required Properties:
 		- "renesas,dmac-r8a7793" (R-Car M2-N)
 		- "renesas,dmac-r8a7794" (R-Car E2)
 		- "renesas,dmac-r8a7795" (R-Car H3)
+		- "renesas,dmac-r8a7796" (R-Car M3-W)
 
 - reg: base address and length of the registers block for the DMAC
 
-- 
2.9.3
