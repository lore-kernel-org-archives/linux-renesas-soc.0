Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49172 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933268AbcIFIZa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 04:25:30 -0400
Received: from avalon.bb.dnainternet.fi (85-23-193-79.bb.dnainternet.fi [85.23.193.79])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 89E50201F2
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Sep 2016 10:25:00 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: net: renesas-ravb: Add support for R8A7796 RAVB
Date: Tue,  6 Sep 2016 11:25:50 +0300
Message-Id: <1473150352-31081-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1473150352-31081-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1473150352-31081-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a new compatible string for the R8A7796 (M3-W) RAVB.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/net/renesas,ravb.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
index c8ac222eac67..b519503be51a 100644
--- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -10,6 +10,7 @@ Required properties:
 	      "renesas,etheravb-r8a7793" if the device is a part of R8A7793 SoC.
 	      "renesas,etheravb-r8a7794" if the device is a part of R8A7794 SoC.
 	      "renesas,etheravb-r8a7795" if the device is a part of R8A7795 SoC.
+	      "renesas,etheravb-r8a7796" if the device is a part of R8A7796 SoC.
 	      "renesas,etheravb-rcar-gen2" for generic R-Car Gen 2 compatible interface.
 	      "renesas,etheravb-rcar-gen3" for generic R-Car Gen 3 compatible interface.
 
@@ -33,7 +34,7 @@ Optional properties:
 - interrupt-parent: the phandle for the interrupt controller that services
 		    interrupts for this device.
 - interrupt-names: A list of interrupt names.
-		   For the R8A7795 SoC this property is mandatory;
+		   For the R8A779[56] SoCs this property is mandatory;
 		   it should include one entry per channel, named "ch%u",
 		   where %u is the channel number ranging from 0 to 24.
 		   For other SoCs this property is optional; if present
-- 
Regards,

Laurent Pinchart
