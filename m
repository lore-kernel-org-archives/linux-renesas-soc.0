Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:35466 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729330AbeI1R4P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 13:56:15 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: irqchip: renesas-irqc: Document R-Car E3 support
Date: Fri, 28 Sep 2018 13:32:38 +0200
Message-Id: <20180928113238.17192-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document support for the Interrupt Controller for External Devices
(INTC-EX) in the Renesas E3 (r8a77990) SoC.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/interrupt-controller/renesas,irqc.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
index a046ed374d808d66..b8a86e30e8e67068 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
@@ -2,7 +2,8 @@ DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
 
 Required properties:
 
-- compatible: has to be "renesas,irqc-<soctype>", "renesas,irqc" as fallback.
+- compatible: must be "renesas,irqc-<soctype>" or "renesas,intc-ex-<soctype>",
+	      and "renesas,irqc" as fallback.
   Examples with soctypes are:
     - "renesas,irqc-r8a73a4" (R-Mobile APE6)
     - "renesas,irqc-r8a7743" (RZ/G1M)
@@ -19,6 +20,7 @@ Required properties:
     - "renesas,intc-ex-r8a77965" (R-Car M3-N)
     - "renesas,intc-ex-r8a77970" (R-Car V3M)
     - "renesas,intc-ex-r8a77980" (R-Car V3H)
+    - "renesas,intc-ex-r8a77990" (R-Car E3)
     - "renesas,intc-ex-r8a77995" (R-Car D3)
 - #interrupt-cells: has to be <2>: an interrupt index and flags, as defined in
   interrupts.txt in this directory
-- 
2.17.1
