Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:35299 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751301AbdKQKlw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2017 05:41:52 -0500
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        wsa@the-dreams.de, horms@verge.net.au, geert@linux-m68k.org,
        magnus.damm@gmail.com, chris.paterson2@renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 7/7] can: rcar_canfd: document r8a77995 (R-Car D3) compatibility strings
Date: Fri, 17 Nov 2017 11:41:29 +0100
Message-Id: <1510915289-15059-8-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1510915289-15059-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1510915289-15059-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
index 93c3a6a..5617892 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
@@ -6,6 +6,7 @@ Required properties:
   - "renesas,rcar-gen3-canfd" for R-Car Gen3 compatible controller.
   - "renesas,r8a7795-canfd" for R8A7795 (R-Car H3) compatible controller.
   - "renesas,r8a7796-canfd" for R8A7796 (R-Car M3) compatible controller.
+  - "renesas,r8a77995-canfd" for R8A77995 (R-Car D3) compatible controller.
 
   When compatible with the generic version, nodes must list the
   SoC-specific version corresponding to the platform first, followed by the
@@ -24,12 +25,12 @@ The name of the child nodes are "channel0" and "channel1" respectively. Each
 child node supports the "status" property only, which is used to
 enable/disable the respective channel.
 
-Required properties for "renesas,r8a7795-canfd" and "renesas,r8a7796-canfd"
-compatible:
-In R8A7795 and R8A7796 SoCs, canfd clock is a div6 clock and can be used by both
-CAN and CAN FD controller at the same time. It needs to be scaled to maximum
-frequency if any of these controllers use it. This is done using the below
-properties:
+Required properties for "renesas,r8a7795-canfd", "renesas,r8a7796-canfd" and
+"renesas,r8a77995" compatible:
+In R8A7795, R8A7796 and R8A77995 SoCs, canfd clock is a div6 clock and can
+be used by both CAN and CAN FD controller at the same time. It needs to be
+scaled to maximum frequency if any of these controllers use it. This is
+done using the below properties:
 
 - assigned-clocks: phandle of canfd clock.
 - assigned-clock-rates: maximum frequency of this clock.
-- 
2.7.4
