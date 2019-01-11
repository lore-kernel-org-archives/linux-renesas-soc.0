Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D631C43444
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 11:57:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17F1B2146F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 11:57:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730904AbfAKL5u (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 06:57:50 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:34022 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730940AbfAKL5u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 06:57:50 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id Nzxo1z00G3XaVaC06zxogh; Fri, 11 Jan 2019 12:57:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvRc-0005ln-Cm; Fri, 11 Jan 2019 12:57:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvRc-0007jd-Bs; Fri, 11 Jan 2019 12:57:48 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] Revert "pinctrl: sh-pfc: r8a77990: Add support for pull-up only pins"
Date:   Fri, 11 Jan 2019 12:57:44 +0100
Message-Id: <20190111115744.29685-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190111115744.29685-1-geert+renesas@glider.be>
References: <20190111115744.29685-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This reverts commit f4caa6ee736fa8a46c806ba4382c16f7e5a20248.

The same can be expressed better by dropping the
SH_PFC_PIN_CFG_PULL_DOWN flag from the GPIO description, as it includes
returning an error to the caller when trying to configure the pin for
pull-down, causing:

    sh-pfc e6060000.pin-controller: pin_config_set op failed for pin 201
    sh-pfc e6060000.pin-controller: Error applying setting, reverse things back
    sh-pfc e6060000.pin-controller: failed to select default state

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index a1d99980788ac1cb..967b3fec45f516d1 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -4927,17 +4927,6 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static bool pin_has_pud(unsigned int pin)
-{
-	/* Some pins are pull-up only */
-	switch (pin) {
-	case RCAR_GP_PIN(6, 9):	/* USB30_OVC  */
-		return false;
-	}
-
-	return true;
-}
-
 static unsigned int r8a77990_pinmux_get_bias(struct sh_pfc *pfc,
 					     unsigned int pin)
 {
@@ -4950,7 +4939,7 @@ static unsigned int r8a77990_pinmux_get_bias(struct sh_pfc *pfc,
 
 	if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
 		return PIN_CONFIG_BIAS_DISABLE;
-	else if (!pin_has_pud(pin) || (sh_pfc_read(pfc, reg->pud) & BIT(bit)))
+	else if (sh_pfc_read(pfc, reg->pud) & BIT(bit))
 		return PIN_CONFIG_BIAS_PULL_UP;
 	else
 		return PIN_CONFIG_BIAS_PULL_DOWN;
@@ -4971,13 +4960,11 @@ static void r8a77990_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 	if (bias != PIN_CONFIG_BIAS_DISABLE)
 		enable |= BIT(bit);
 
-	if (pin_has_pud(pin)) {
-		updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
-		if (bias == PIN_CONFIG_BIAS_PULL_UP)
-			updown |= BIT(bit);
+	updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
+	if (bias == PIN_CONFIG_BIAS_PULL_UP)
+		updown |= BIT(bit);
 
-		sh_pfc_write(pfc, reg->pud, updown);
-	}
+	sh_pfc_write(pfc, reg->pud, updown);
 	sh_pfc_write(pfc, reg->puen, enable);
 }
 
-- 
2.17.1

