Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:37068 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S934111AbcKXQMJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2016 11:12:09 -0500
From: Chris Paterson <chris.paterson2@renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Wolfgang Grandegger <wg@grandegger.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        linux-can@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH v2 1/2] can: rcar_can: Add r8a7796 support
Date: Thu, 24 Nov 2016 16:11:56 +0000
Message-Id: <1480003917-3953-2-git-send-email-chris.paterson2@renesas.com>
In-Reply-To: <1480003917-3953-1-git-send-email-chris.paterson2@renesas.com>
References: <1479903243-1860-1-git-send-email-chris.paterson2@renesas.com>
 <1480003917-3953-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 Documentation/devicetree/bindings/net/can/rcar_can.txt | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Documentation/devicetree/bindings/net/can/rcar_can.txt
index 8d40ab2..06bb7cc 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
@@ -10,6 +10,7 @@ Required properties:
 	      "renesas,can-r8a7793" if CAN controller is a part of R8A7793 SoC.
 	      "renesas,can-r8a7794" if CAN controller is a part of R8A7794 SoC.
 	      "renesas,can-r8a7795" if CAN controller is a part of R8A7795 SoC.
+	      "renesas,can-r8a7796" if CAN controller is a part of R8A7796 SoC.
 	      "renesas,rcar-gen1-can" for a generic R-Car Gen1 compatible device.
 	      "renesas,rcar-gen2-can" for a generic R-Car Gen2 compatible device.
 	      "renesas,rcar-gen3-can" for a generic R-Car Gen3 compatible device.
@@ -24,11 +25,12 @@ Required properties:
 - pinctrl-0: pin control group to be used for this controller.
 - pinctrl-names: must be "default".
 
-Required properties for "renesas,can-r8a7795" compatible:
-In R8A7795 SoC, "clkp2" can be CANFD clock. This is a div6 clock and can be
-used by both CAN and CAN FD controller at the same time. It needs to be scaled
-to maximum frequency if any of these controllers use it. This is done using
-the below properties.
+Required properties for "renesas,can-r8a7795" and "renesas,can-r8a7796"
+compatible:
+In R8A7795 and R8A7796 SoCs, "clkp2" can be CANFD clock. This is a div6 clock
+and can be used by both CAN and CAN FD controller at the same time. It needs to
+be scaled to maximum frequency if any of these controllers use it. This is done
+using the below properties:
 
 - assigned-clocks: phandle of clkp2(CANFD) clock.
 - assigned-clock-rates: maximum frequency of this clock.
-- 
1.9.1
