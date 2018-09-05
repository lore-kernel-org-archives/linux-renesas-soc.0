Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:52071 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbeIEUAo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 16:00:44 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/8] media: dt-bindings: rcar-csi2: Add R8A77990
Date: Wed,  5 Sep 2018 17:29:40 +0200
Message-Id: <1536161385-25562-4-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add compatible string for R-Car E3 R8A77990 to the list of supported SoCs.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
index 2d385b6..2824489 100644
--- a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
+++ b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
@@ -12,6 +12,7 @@ Mandatory properties
    - "renesas,r8a7796-csi2" for the R8A7796 device.
    - "renesas,r8a77965-csi2" for the R8A77965 device.
    - "renesas,r8a77970-csi2" for the R8A77970 device.
+   - "renesas,r8a77990-csi2" for the R8A77990 device.
 
  - reg: the register base and size for the device registers
  - interrupts: the interrupt for the device
-- 
2.7.4
