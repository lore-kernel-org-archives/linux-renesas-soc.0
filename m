Return-Path: <devicetree-owner@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] DT: irqchip: renesas-irqc: document R8A7743/5 support
Date: Fri, 30 Sep 2016 00:25:29 +0300
Message-ID: <19681841.MzyqfDfWny@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas  RZ/G SoC have the R-Car gen2 compatible IRQC interrupt controllers.
Document RZ/G1[ME] (also known as R8A774[35]) SoC bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'tip.git' repo's 'irq/core' branch.

 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: tip/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
===================================================================
--- tip.orig/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
+++ tip/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
@@ -1,10 +1,12 @@
-DT bindings for the R-Mobile/R-Car interrupt controller
+DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
 
 Required properties:
 
 - compatible: has to be "renesas,irqc-<soctype>", "renesas,irqc" as fallback.
   Examples with soctypes are:
     - "renesas,irqc-r8a73a4" (R-Mobile APE6)
+    - "renesas,irqc-r8a7743" (RZ/G1M)
+    - "renesas,irqc-r8a7745" (RZ/G1E)
     - "renesas,irqc-r8a7790" (R-Car H2)
     - "renesas,irqc-r8a7791" (R-Car M2-W)
     - "renesas,irqc-r8a7792" (R-Car V2H)

