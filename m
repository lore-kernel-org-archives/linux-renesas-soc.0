Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:59168 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751175AbeBZPZP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Feb 2018 10:25:15 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: irqchip: renesas-irqc: Document R-Car M3-N support
Date: Mon, 26 Feb 2018 16:25:12 +0100
Message-Id: <1519658712-22910-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document support for the Interrupt Controller for Externel Devices
(INTC-EX) in the Renesas M3-N (r8a77965) SoC.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
index 33c9a10fdc91a1dc..20f121daa9106f17 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
@@ -14,6 +14,7 @@ Required properties:
     - "renesas,irqc-r8a7794" (R-Car E2)
     - "renesas,intc-ex-r8a7795" (R-Car H3)
     - "renesas,intc-ex-r8a7796" (R-Car M3-W)
+    - "renesas,intc-ex-r8a77965" (R-Car M3-N)
     - "renesas,intc-ex-r8a77970" (R-Car V3M)
     - "renesas,intc-ex-r8a77995" (R-Car D3)
 - #interrupt-cells: has to be <2>: an interrupt index and flags, as defined in
-- 
2.7.4
