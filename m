Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:19671 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751376AbdJPKNi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2017 06:13:38 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH  1/2] dt-bindings: usb-xhci: Document r8a7743 support
Date: Mon, 16 Oct 2017 11:12:48 +0100
Message-Id: <1508148769-47488-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1508148769-47488-1-git-send-email-biju.das@bp.renesas.com>
References: <1508148769-47488-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Document r8a7743 xhci support. The driver will use the fallback
compatible string "renesas,rcar-gen2-xhci", therefore no driver
change is needed.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 2d80b60..4125d02 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -7,12 +7,14 @@ Required properties:
     - "marvell,armada3700-xhci" for Armada 37xx SoCs
     - "marvell,armada-375-xhci" for Armada 375 SoCs
     - "marvell,armada-380-xhci" for Armada 38x SoCs
+    - "renesas,xhci-r8a7743" for r8a7743 SoC
     - "renesas,xhci-r8a7790" for r8a7790 SoC
     - "renesas,xhci-r8a7791" for r8a7791 SoC
     - "renesas,xhci-r8a7793" for r8a7793 SoC
     - "renesas,xhci-r8a7795" for r8a7795 SoC
     - "renesas,xhci-r8a7796" for r8a7796 SoC
-    - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 compatible device
+    - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 or RZ/G1 compatible
+      device
     - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 compatible device
     - "xhci-platform" (deprecated)
 
-- 
1.9.1
