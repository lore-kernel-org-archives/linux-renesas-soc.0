Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:8410 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S934501AbdLRRjN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 12:39:13 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: timer: renesas, cmt: Document r8a774[35] CMT support
Date: Mon, 18 Dec 2017 17:39:01 +0000
Message-Id: <1513618743-4773-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1513618743-4773-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1513618743-4773-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document SoC specific compatible strings for r8a7743 and r8a7745.
No driver change is needed as the fallback strings will activate
the right code.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Simon Horman <horms@verge.net.au>
---
v1->v2:
* "R-Car Gen2 or RZ/G1." -> "R-Car Gen2 and RZ/G1."
* "all the R-Car" -> "R-Car"

 Documentation/devicetree/bindings/timer/renesas,cmt.txt | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index d740989..b40add2 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -22,6 +22,10 @@ Required Properties:
 
     - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a73a4.
     - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
+    - "renesas,r8a7743-cmt0" for the 32-bit CMT0 device included in r8a7743.
+    - "renesas,r8a7743-cmt1" for the 48-bit CMT1 device included in r8a7743.
+    - "renesas,r8a7745-cmt0" for the 32-bit CMT0 device included in r8a7745.
+    - "renesas,r8a7745-cmt1" for the 48-bit CMT1 device included in r8a7745.
     - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
     - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
     - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
@@ -31,10 +35,12 @@ Required Properties:
     - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
     - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
 
-    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2.
-    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2.
-		These are fallbacks for r8a73a4 and all the R-Car Gen2
-		entries	listed above.
+    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
+		and RZ/G1.
+    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2
+		and RZ/G1.
+		These are fallbacks for r8a73a4, R-Car Gen2 and RZ/G1 entries
+		listed above.
 
   - reg: base address and length of the registers block for the timer module.
   - interrupts: interrupt-specifier for the timer, one per channel.
-- 
2.7.4
