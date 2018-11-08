Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay10.mail.gandi.net ([217.70.178.230]:45849 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbeKIBny (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 20:43:54 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: geert+renesas@glider.be, horms@verge.net.au,
        laurent.pinchart@ideasonboard.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linus.walleij@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v5 4/6] pinctrl: sh-pfc: r8a7792: Fix VIN versioned groups
Date: Thu,  8 Nov 2018 17:07:25 +0100
Message-Id: <1541693247-15599-5-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541693247-15599-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1541693247-15599-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Versioned VIN groups can appear on different sets of pins. Use of the
VIN_DATA_PIN_GROUP macro fix naming of said groups through an optional
'version' argument.

Use the 'version' argument for said macro to fix naming of versioned
groups for R-Car V2H R8A7792 SoC.

Fixes: 7dd74bb1f058 ("pinctrl: sh-pfc: r8a7792: Add VIN pin groups")
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---
v4 -> v5:
- Broke out r8a7792 from single patch

---
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c b/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
index e977121b433b..a623459b234e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
@@ -1744,10 +1744,10 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	VIN_DATA_PIN_GROUP(vin1_data, 12),
 	VIN_DATA_PIN_GROUP(vin1_data, 10),
 	VIN_DATA_PIN_GROUP(vin1_data, 8),
-	VIN_DATA_PIN_GROUP(vin1_data_b, 24),
-	VIN_DATA_PIN_GROUP(vin1_data_b, 20),
+	VIN_DATA_PIN_GROUP(vin1_data, 24, _b),
+	VIN_DATA_PIN_GROUP(vin1_data, 20, _b),
 	SH_PFC_PIN_GROUP(vin1_data18_b),
-	VIN_DATA_PIN_GROUP(vin1_data_b, 16),
+	VIN_DATA_PIN_GROUP(vin1_data, 16, _b),
 	SH_PFC_PIN_GROUP(vin1_sync),
 	SH_PFC_PIN_GROUP(vin1_field),
 	SH_PFC_PIN_GROUP(vin1_clkenb),
--
2.7.4
