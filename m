Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:40072 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750888AbeB0F7s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 00:59:48 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: vinod.koul@intel.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dmaengine: usb-dmac: add binding for r8a77965
Date: Tue, 27 Feb 2018 14:54:56 +0900
Message-Id: <1519710896-26527-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds binding for r8a77965 (R-Car M3-N).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
index f3d1f15..9dc935e 100644
--- a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
@@ -11,6 +11,7 @@ Required Properties:
 	  - "renesas,r8a7794-usb-dmac" (R-Car E2)
 	  - "renesas,r8a7795-usb-dmac" (R-Car H3)
 	  - "renesas,r8a7796-usb-dmac" (R-Car M3-W)
+	  - "renesas,r8a77965-usb-dmac" (R-Car M3-N)
 - reg: base address and length of the registers block for the DMAC
 - interrupts: interrupt specifiers for the DMAC, one for each entry in
   interrupt-names.
-- 
1.9.1
