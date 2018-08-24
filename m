Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:22842 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbeHXMqf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 08:46:35 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de,
        geert@linux-m68k.org, linux-spi@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [RESEND PATCH] spi: sh-msiof: Document R-Car D3 support
Date: Fri, 24 Aug 2018 11:12:31 +0200
Message-Id: <1535101951-11221-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document support for the MSIOF module in the Renesas D3 (r8a77995) SoC.

No driver update is needed.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This patch fell by the wayside, probably because I forgot to cc devicetree.

CU
Uli


 Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index bfbc203..fd15715 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -11,6 +11,7 @@ Required properties:
 			 "renesas,msiof-r8a7795" (R-Car H3)
 			 "renesas,msiof-r8a7796" (R-Car M3-W)
 			 "renesas,msiof-r8a77965" (R-Car M3-N)
+			 "renesas,msiof-r8a77995" (R-Car D3)
 			 "renesas,msiof-sh73a0" (SH-Mobile AG5)
 			 "renesas,sh-mobile-msiof" (generic SH-Mobile compatibile device)
 			 "renesas,rcar-gen2-msiof" (generic R-Car Gen2 and RZ/G1 compatible device)
-- 
2.7.4
