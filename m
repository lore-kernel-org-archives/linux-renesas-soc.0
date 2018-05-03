Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:54986 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750849AbeECNCs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 May 2018 09:02:48 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Chris Paterson <chris.paterson2@renesas.com>,
        linux-can@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: can: rcar_can: Fix R8A7796 SoC name
Date: Thu,  3 May 2018 15:02:33 +0200
Message-Id: <1525352553-17045-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R8A7796 is R-Car M3-W.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
index 93c3a6ae32f995e9..1a4ee1d2506de532 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
@@ -5,7 +5,7 @@ Required properties:
 - compatible: Must contain one or more of the following:
   - "renesas,rcar-gen3-canfd" for R-Car Gen3 compatible controller.
   - "renesas,r8a7795-canfd" for R8A7795 (R-Car H3) compatible controller.
-  - "renesas,r8a7796-canfd" for R8A7796 (R-Car M3) compatible controller.
+  - "renesas,r8a7796-canfd" for R8A7796 (R-Car M3-W) compatible controller.
 
   When compatible with the generic version, nodes must list the
   SoC-specific version corresponding to the platform first, followed by the
-- 
2.7.4
