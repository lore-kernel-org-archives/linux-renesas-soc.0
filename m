Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:43630 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbeLGODq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 09:03:46 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77990: Add support for pull-up only pins
Date: Fri,  7 Dec 2018 15:03:43 +0100
Message-Id: <20181207140343.5197-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R-Car Gen3 HardWare Manual Errata for Rev. 1.00 (Jul 2, 2018) states
that the USB30_OVC pin supports pull-up only.  It has a bit assigned in
the pull-enable register (PUEN5), but not in the pull-up/down control
register (PUD5).

Add a check for this, to prevent configuring a prohibited setting.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Fixes: 83f6941a42a5e773 ("pinctrl: sh-pfc: r8a77990: Add bias pinconf support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v4.22.

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 8c06d72753890e32..784d4400c3e0e7ea 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -4914,6 +4914,17 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
+static bool pin_has_pud(unsigned int pin)
+{
+	/* Some pins are pull-up only */
+	switch (pin) {
+	case RCAR_GP_PIN(6, 9):	/* USB30_OVC  */
+		return false;
+	}
+
+	return true;
+}
+
 static unsigned int r8a77990_pinmux_get_bias(struct sh_pfc *pfc,
 					     unsigned int pin)
 {
@@ -4926,7 +4937,7 @@ static unsigned int r8a77990_pinmux_get_bias(struct sh_pfc *pfc,
 
 	if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
 		return PIN_CONFIG_BIAS_DISABLE;
-	else if (sh_pfc_read(pfc, reg->pud) & BIT(bit))
+	else if (!pin_has_pud(pin) || (sh_pfc_read(pfc, reg->pud) & BIT(bit)))
 		return PIN_CONFIG_BIAS_PULL_UP;
 	else
 		return PIN_CONFIG_BIAS_PULL_DOWN;
@@ -4947,11 +4958,13 @@ static void r8a77990_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 	if (bias != PIN_CONFIG_BIAS_DISABLE)
 		enable |= BIT(bit);
 
-	updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
-	if (bias == PIN_CONFIG_BIAS_PULL_UP)
-		updown |= BIT(bit);
+	if (pin_has_pud(pin)) {
+		updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
+		if (bias == PIN_CONFIG_BIAS_PULL_UP)
+			updown |= BIT(bit);
 
-	sh_pfc_write(pfc, reg->pud, updown);
+		sh_pfc_write(pfc, reg->pud, updown);
+	}
 	sh_pfc_write(pfc, reg->puen, enable);
 }
 
-- 
2.17.1
