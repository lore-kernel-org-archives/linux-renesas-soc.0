Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:34316 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751328AbdILUCd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 16:02:33 -0400
Received: by mail-lf0-f44.google.com with SMTP id l196so29149343lfl.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Sep 2017 13:02:32 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170912200228.015376134@cogentembedded.com>
Date: Tue, 12 Sep 2017 23:02:08 +0300
To: Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] ravb: document R8A77970 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=ravb-document-R8A77970-bindings.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car V3M (R8A77970) SoC also has the R-Car gen3 compatible EtherAVB
device, so document  the SoC specific bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against DaveM's 'net-next.git' repo but I wouldn't mind if it's
applied to 'net.git' instead. :-)

 Documentation/devicetree/bindings/net/renesas,ravb.txt |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: net-next/Documentation/devicetree/bindings/net/renesas,ravb.txt
===================================================================
--- net-next.orig/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ net-next/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -17,6 +17,7 @@ Required properties:
 
       - "renesas,etheravb-r8a7795" for the R8A7795 SoC.
       - "renesas,etheravb-r8a7796" for the R8A7796 SoC.
+      - "renesas,etheravb-r8a77970" for the R8A77970 SoC.
       - "renesas,etheravb-rcar-gen3" as a fallback for the above
 		R-Car Gen3 devices.
 
@@ -40,7 +41,7 @@ Optional properties:
 - interrupt-parent: the phandle for the interrupt controller that services
 		    interrupts for this device.
 - interrupt-names: A list of interrupt names.
-		   For the R8A779[56] SoCs this property is mandatory;
+		   For the R-Car Gen 3 SoCs this property is mandatory;
 		   it should include one entry per channel, named "ch%u",
 		   where %u is the channel number ranging from 0 to 24.
 		   For other SoCs this property is optional; if present
