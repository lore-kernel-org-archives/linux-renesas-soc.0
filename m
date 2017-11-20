Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:40211 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751301AbdKTPqq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2017 10:46:46 -0500
Received: by mail-wr0-f195.google.com with SMTP id s41so3032234wrc.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2017 07:46:45 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
Cc: wsa@the-dreams.de, Chris.Paterson2@renesas.com,
        magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 3/3] dmaengine: rcar-dmac: Document R-Car D3 bindings
Date: Mon, 20 Nov 2017 16:46:36 +0100
Message-Id: <1511192796-2268-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1511192796-2268-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1511192796-2268-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R8A77995's SYS-DMAC is R-Car Gen3-compatible.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
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
