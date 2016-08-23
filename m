Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33480 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756561AbcHWHuG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2016 03:50:06 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH/RFT v2 4/8] gpio: rcar: Add r8a7796 (R-Car M3-W) support
Date: Tue, 23 Aug 2016 09:49:46 +0200
Message-Id: <1471938590-10650-5-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1471938590-10650-1-git-send-email-horms+renesas@verge.net.au>
References: <1471938590-10650-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car Gen3's GPIO blocks are identical to Gen2's in every respect.

Based on work for the r8a7795 (R-Car H3) by Ulrich Hecht.

Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v2
* New patch
---
 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 1 +
 drivers/gpio/gpio-rcar.c                                     | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index 8da26b35b5c3..7c1ab3b3254f 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -11,6 +11,7 @@ Required Properties:
     - "renesas,gpio-r8a7793": for R8A7793 (R-Car M2-N) compatible GPIO controller.
     - "renesas,gpio-r8a7794": for R8A7794 (R-Car E2) compatible GPIO controller.
     - "renesas,gpio-r8a7795": for R8A7795 (R-Car H3) compatible GPIO controller.
+    - "renesas,gpio-r8a7796": for R8A7796 (R-Car M3-W) compatible GPIO controller.
     - "renesas,gpio-rcar": for generic R-Car GPIO controller.
 
   - reg: Base address and length of each memory resource used by the GPIO
diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index b96e0b466f74..2be48f5eba36 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -348,6 +348,10 @@ static const struct of_device_id gpio_rcar_of_table[] = {
 		/* Gen3 GPIO is identical to Gen2. */
 		.data = &gpio_rcar_info_gen2,
 	}, {
+		.compatible = "renesas,gpio-r8a7796",
+		/* Gen3 GPIO is identical to Gen2. */
+		.data = &gpio_rcar_info_gen2,
+	}, {
 		.compatible = "renesas,gpio-rcar",
 		.data = &gpio_rcar_info_gen1,
 	}, {
-- 
2.7.0.rc3.207.g0ac5344
