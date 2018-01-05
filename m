Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:60131 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752850AbeAEWsM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jan 2018 17:48:12 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 2/3] dt-bindings: usb: renesas_usbhs: Add support for RZ/A1
Date: Fri,  5 Jan 2018 17:46:46 -0500
Message-Id: <20180105224647.42262-3-chris.brandt@renesas.com>
In-Reply-To: <20180105224647.42262-1-chris.brandt@renesas.com>
References: <20180105224647.42262-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document support for RZ/A1 SoCs

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
 * Removed "renesas,usbhs-r7s72100"
v2:
 * Added Reviewed-by
---
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index 47394ab788e3..fa16d8d33815 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -15,6 +15,7 @@ Required properties:
 	- "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
 	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible devices
 	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 compatible device
+	- "renesas,rza1-usbhs" for RZ/A1 compatible device
 
 	When compatible with the generic version, nodes must list the
 	SoC-specific version corresponding to the platform first followed
-- 
2.15.1
