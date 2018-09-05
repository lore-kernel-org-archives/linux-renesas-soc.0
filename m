Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:55395 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbeIEUAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 16:00:41 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/8] media: dt-bindings: rcar-vin: Add R8A77990 support
Date: Wed,  5 Sep 2018 17:29:38 +0200
Message-Id: <1536161385-25562-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add compatible string for R-Car E3 R8A77990 to the list of SoCs supported by
rcar-vin driver.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/rcar_vin.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
index 2f42005..dfd6058 100644
--- a/Documentation/devicetree/bindings/media/rcar_vin.txt
+++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
@@ -23,6 +23,7 @@ on Gen3 platforms to a CSI-2 receiver.
    - "renesas,vin-r8a7796" for the R8A7796 device
    - "renesas,vin-r8a77965" for the R8A77965 device
    - "renesas,vin-r8a77970" for the R8A77970 device
+   - "renesas,vin-r8a77990" for the R8A77990 device
    - "renesas,vin-r8a77995" for the R8A77995 device
    - "renesas,rcar-gen2-vin" for a generic R-Car Gen2 or RZ/G1 compatible
      device.
-- 
2.7.4
