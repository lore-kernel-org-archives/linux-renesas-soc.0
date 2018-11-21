Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43355 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729743AbeKUWnw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 17:43:52 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] i2c: sh_mobile: document support for r8a77990 (R-Car E3)
Date: Wed, 21 Nov 2018 13:09:27 +0100
Message-Id: <20181121120928.25179-2-horms+renesas@verge.net.au>
In-Reply-To: <20181121120928.25179-1-horms+renesas@verge.net.au>
References: <20181121120928.25179-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document support for the IIC code for the r8a77990 (R-Car E3).

It is not considered compatible with existing fallback bindings
due to the documented absence of automatic transmission registers.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt b/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
index d81b62643655..bc876b71d1e4 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
@@ -16,6 +16,7 @@ Required properties:
 			- "renesas,iic-r8a7795" (R-Car H3)
 			- "renesas,iic-r8a7796" (R-Car M3-W)
 			- "renesas,iic-r8a77965" (R-Car M3-N)
+			- "renesas,iic-r8a77990" (R-Car E3)
 			- "renesas,iic-sh73a0" (SH-Mobile AG5)
 			- "renesas,rcar-gen2-iic" (generic R-Car Gen2 or RZ/G1
 							compatible device)
@@ -28,7 +29,13 @@ Required properties:
 			the platform first followed by the generic R-Car
 			version.
 
-			renesas,rmobile-iic must always follow.
+			When compatible with "renesas,rmobile-iic" it should
+			be the last compatibility string listed.
+
+			The r8a77990 (R-Car E3) controller is not
+			considered compatible with "renesas,rcar-gen3-iic"
+			or "renesas,rmobile-iic" due to the absence of
+			automatic transmission registers.
 
 - reg             : address start and address range size of device
 - interrupts      : interrupt of device
-- 
2.11.0
