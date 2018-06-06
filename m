Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:5570 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932107AbeFFGnR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 02:43:17 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dt-bindings: rcar-gen3-phy-usb2: Add bindings for r8a77990
Date: Wed,  6 Jun 2018 15:42:28 +0900
Message-Id: <1528267348-18960-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds suuport for r8a77990 (R-Car E3).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index dbd137c..fb4a204 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -10,6 +10,8 @@ Required properties:
 	      SoC.
 	      "renesas,usb2-phy-r8a77965" if the device is a part of an
 	      R8A77965 SoC.
+	      "renesas,usb2-phy-r8a77990" if the device is a part of an
+	      R8A77990 SoC.
 	      "renesas,usb2-phy-r8a77995" if the device is a part of an
 	      R8A77995 SoC.
 	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3 compatible device.
-- 
1.9.1
