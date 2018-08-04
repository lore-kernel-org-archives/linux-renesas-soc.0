Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44899 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729669AbeHEBQe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Aug 2018 21:16:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id r16-v6so8775038wrt.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Aug 2018 16:14:15 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
To: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: [PATCH 11/14] dt-bindings: can: rcar_can: document r8a77965 can support
Date: Sun,  5 Aug 2018 01:11:11 +0200
Message-Id: <20180804231114.21420-12-erosca@de.adit-jv.com>
In-Reply-To: <20180804231114.21420-1-erosca@de.adit-jv.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

After adding CAN support to arch/arm64/boot/dts/renesas/r8a77965.dtsi,
checkpatch complained that the new compatible string
"renesas,can-r8a77965" is not documented. Fix the warning.

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 Documentation/devicetree/bindings/net/can/rcar_can.txt | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Documentation/devicetree/bindings/net/can/rcar_can.txt
index 94a7f33ac5e9..23264451a5a4 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
@@ -13,6 +13,7 @@ Required properties:
 	      "renesas,can-r8a7794" if CAN controller is a part of R8A7794 SoC.
 	      "renesas,can-r8a7795" if CAN controller is a part of R8A7795 SoC.
 	      "renesas,can-r8a7796" if CAN controller is a part of R8A7796 SoC.
+	      "renesas,can-r8a77965" if CAN controller is a part of R8A77965 SoC.
 	      "renesas,rcar-gen1-can" for a generic R-Car Gen1 compatible device.
 	      "renesas,rcar-gen2-can" for a generic R-Car Gen2 or RZ/G1
 	      compatible device.
@@ -28,9 +29,8 @@ Required properties:
 - pinctrl-0: pin control group to be used for this controller.
 - pinctrl-names: must be "default".
 
-Required properties for "renesas,can-r8a7795" and "renesas,can-r8a7796"
-compatible:
-In R8A7795 and R8A7796 SoCs, "clkp2" can be CANFD clock. This is a div6 clock
+Required properties for compatibles [A], [B] and [C]:
+For the denoted SoCs, "clkp2" can be CANFD clock. This is a div6 clock
 and can be used by both CAN and CAN FD controller at the same time. It needs to
 be scaled to maximum frequency if any of these controllers use it. This is done
 using the below properties:
@@ -38,6 +38,10 @@ using the below properties:
 - assigned-clocks: phandle of clkp2(CANFD) clock.
 - assigned-clock-rates: maximum frequency of this clock.
 
+[A] "renesas,can-r8a7795"
+[B] "renesas,can-r8a7796"
+[C] "renesas,can-r8a77965"
+
 Optional properties:
 - renesas,can-clock-select: R-Car CAN Clock Source Select. Valid values are:
 			    <0x0> (default) : Peripheral clock (clkp1)
-- 
2.18.0
