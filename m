Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:8750 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728978AbeHNPTq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Aug 2018 11:19:46 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: rcar: Add r8a774a1 (RZ/G2M) support
Date: Tue, 14 Aug 2018 13:32:37 +0100
Message-Id: <1534249957-15543-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document Renesas' RZ/G2M (R8A774A1) GPIO blocks compatibility within the
relevant dt-bindings.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index 4018ee5..e82144a 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -6,6 +6,7 @@ Required Properties:
     - "renesas,gpio-r8a7743": for R8A7743 (RZ/G1M) compatible GPIO controller.
     - "renesas,gpio-r8a7745": for R8A7745 (RZ/G1E) compatible GPIO controller.
     - "renesas,gpio-r8a77470": for R8A77470 (RZ/G1C) compatible GPIO controller.
+    - "renesas,gpio-r8a774a1": for R8A774A1 (RZ/G2M) compatible GPIO controller.
     - "renesas,gpio-r8a7778": for R8A7778 (R-Car M1) compatible GPIO controller.
     - "renesas,gpio-r8a7779": for R8A7779 (R-Car H1) compatible GPIO controller.
     - "renesas,gpio-r8a7790": for R8A7790 (R-Car H2) compatible GPIO controller.
@@ -22,7 +23,7 @@ Required Properties:
     - "renesas,gpio-r8a77995": for R8A77995 (R-Car D3) compatible GPIO controller.
     - "renesas,rcar-gen1-gpio": for a generic R-Car Gen1 GPIO controller.
     - "renesas,rcar-gen2-gpio": for a generic R-Car Gen2 or RZ/G1 GPIO controller.
-    - "renesas,rcar-gen3-gpio": for a generic R-Car Gen3 GPIO controller.
+    - "renesas,rcar-gen3-gpio": for a generic R-Car Gen3 or RZ/G2 GPIO controller.
     - "renesas,gpio-rcar": deprecated.
 
     When compatible with the generic version nodes must list the
-- 
2.7.4
