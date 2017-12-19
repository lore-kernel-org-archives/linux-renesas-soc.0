Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:43742 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933954AbdLSJNc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Dec 2017 04:13:32 -0500
Received: by mail-wm0-f66.google.com with SMTP id n138so2125455wmg.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Dec 2017 01:13:32 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
Cc: wsa@the-dreams.de, Chris.Paterson2@renesas.com,
        magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v3] dmaengine: rcar-dmac: Document R-Car D3 bindings
Date: Tue, 19 Dec 2017 10:13:26 +0100
Message-Id: <1513674806-4208-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R8A77995's SYS-DMAC is R-Car Gen3-compatible.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
This revision adds the missing Reviewed-Bys.

CU
Uli


 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
index 891db41..af071ed 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
@@ -26,6 +26,7 @@ Required Properties:
 		- "renesas,dmac-r8a7795" (R-Car H3)
 		- "renesas,dmac-r8a7796" (R-Car M3-W)
 		- "renesas,dmac-r8a77970" (R-Car V3M)
+		- "renesas,dmac-r8a77995" (R-Car D3)
 
 - reg: base address and length of the registers block for the DMAC
 
-- 
2.7.4
