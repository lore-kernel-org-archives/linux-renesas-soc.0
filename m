Return-Path: <devicetree-owner@vger.kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/3] dt-bindings: usb: renesas_usbhs: Add support for RZ/A1
Date: Thu,  4 Jan 2018 15:01:49 -0500
Message-Id: <20180104200150.11352-3-chris.brandt@renesas.com>
In-Reply-To: <20180104200150.11352-1-chris.brandt@renesas.com>
References: <20180104200150.11352-1-chris.brandt@renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document support for RZ/A1 SoCs

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index 47394ab788e3..d060172f1529 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -13,8 +13,10 @@ Required properties:
 	- "renesas,usbhs-r8a7795" for r8a7795 (R-Car H3) compatible device
 	- "renesas,usbhs-r8a7796" for r8a7796 (R-Car M3-W) compatible device
 	- "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
+	- "renesas,usbhs-r7s72100" for r7s72100 (RZ/A1) compatible device
 	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible devices
 	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 compatible device
+	- "renesas,rza1-usbhs" for RZ/A1 compatible device
 
 	When compatible with the generic version, nodes must list the
 	SoC-specific version corresponding to the platform first followed
-- 
2.15.1


