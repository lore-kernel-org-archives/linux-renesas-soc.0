Return-Path: <devicetree-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 3/3] dt-bindings: rcar-gen3-phy-usb3: Add bindings for r8a77965
Date: Mon,  5 Mar 2018 14:32:45 +0900
Message-Id: <1520227965-4471-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1520227965-4471-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1520227965-4471-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds bindings for r8a77965 (R-Car M3-N).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
index f94cea4..47dd296 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
@@ -11,6 +11,8 @@ Required properties:
 	      SoC.
 	      "renesas,r8a7796-usb3-phy" if the device is a part of an R8A7796
 	      SoC.
+	      "renesas,r8a77965-usb3-phy" if the device is a part of an
+	      R8A77965 SoC.
 	      "renesas,rcar-gen3-usb3-phy" for a generic R-Car Gen3 compatible
 	      device.
 
-- 
1.9.1

