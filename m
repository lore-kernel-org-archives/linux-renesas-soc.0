Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41664 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbeJJC2n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Oct 2018 22:28:43 -0400
Received: by mail-lj1-f196.google.com with SMTP id u21-v6so2587192lja.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Oct 2018 12:10:16 -0700 (PDT)
Subject: [PATCH 1/2] dt-bindings: thermal: rcar-gen3-thermal: document
 R8A77980 bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
References: <3c96d51e-fc36-2ff9-03a8-176c4c0ed365@cogentembedded.com>
Message-ID: <e53d379f-bb72-51f7-9216-b3eb1bbe04b5@cogentembedded.com>
Date: Tue, 9 Oct 2018 22:10:14 +0300
MIME-Version: 1.0
In-Reply-To: <3c96d51e-fc36-2ff9-03a8-176c4c0ed365@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the R-Car V3H (R8A77980) SoC in the Renesas R-Car gen3 thermal
bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: linux-soc-thermal/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
===================================================================
--- linux-soc-thermal.orig/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
+++ linux-soc-thermal/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
@@ -10,6 +10,7 @@ Required properties:
 			    - "renesas,r8a7795-thermal" (R-Car H3)
 			    - "renesas,r8a7796-thermal" (R-Car M3-W)
 			    - "renesas,r8a77965-thermal" (R-Car M3-N)
+			    - "renesas,r8a77980-thermal" (R-Car V3H)
 - reg			: Address ranges of the thermal registers. Each sensor
 			  needs one address range. Sorting must be done in
 			  increasing order according to datasheet, i.e.
@@ -19,7 +20,8 @@ Required properties:
 
 Optional properties:
 
-- interrupts           : interrupts routed to the TSC (3 for H3, M3-W and M3-N)
+- interrupts		: interrupts routed to the TSC (3 for H3, M3-W, M3-N,
+			  and V3H)
 - power-domain		: Must contain a reference to the power domain. This
 			  property is mandatory if the thermal sensor instance
 			  is part of a controllable power domain.
