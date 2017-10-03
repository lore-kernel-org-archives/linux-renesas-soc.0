Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:13935 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751075AbdJCHe5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 03:34:57 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/2] dt-bindings: pinctrl: add support for RZ/A1L
Date: Tue,  3 Oct 2017 02:33:34 -0500
Message-Id: <20171003073334.18917-3-chris.brandt@renesas.com>
In-Reply-To: <20171003073334.18917-1-chris.brandt@renesas.com>
References: <20171003073334.18917-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Compatible "r7s72102-ports" was added for RZ/A1L devices

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
index 43e21474528a..2a3366cee848 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
@@ -13,7 +13,8 @@ Pin controller node
 
 Required properties:
   - compatible
-    this shall be "renesas,r7s72100-ports".
+    this shall be "renesas,r7s72100-ports" for RZ/A1H and RZ/A1M or
+    "renesas,r7s72102-ports" for RZ/A1L
 
   - reg
     address base and length of the memory area where the pin controller
-- 
2.14.1
