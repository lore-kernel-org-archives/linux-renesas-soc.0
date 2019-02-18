Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE36C10F02
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:29:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DFDA21736
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:29:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733116AbfBRO3b (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 09:29:31 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:41254 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733128AbfBRN7b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 08:59:31 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id eDzV1z0023XaVaC06DzVMw; Mon, 18 Feb 2019 14:59:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gvjSC-0003kG-TP; Mon, 18 Feb 2019 14:59:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gvjSC-0007pp-T3; Mon, 18 Feb 2019 14:59:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] pinctrl: sh-pfc: r8a77980: Rename IOCTRLx registers
Date:   Mon, 18 Feb 2019 14:59:26 +0100
Message-Id: <20190218135927.30068-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190218135927.30068-1-geert+renesas@glider.be>
References: <20190218135927.30068-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car Gen3 HardWare Manual Errata for Rev. 1.00 (Jul 2, 2018)
renamed the various miscellaneous I/O control registers (IOCTRLx) on
R-Car V3H, to reflect better their actual purposes, and matching other
SoCs.

Update to code to match this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
index b807b67ae143e30b..1dcc508366b89b4f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -2828,17 +2828,17 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 };
 
 enum ioctrl_regs {
-	IOCTRL30,
-	IOCTRL31,
-	IOCTRL32,
-	IOCTRL33,
+	POCCTRL0,
+	POCCTRL1,
+	POCCTRL2,
+	POCCTRL3,
 };
 
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
-	[IOCTRL30] = { 0xe6060380, },
-	[IOCTRL31] = { 0xe6060384, },
-	[IOCTRL32] = { 0xe6060388, },
-	[IOCTRL33] = { 0xe606038c, },
+	[POCCTRL0] = { 0xe6060380, },
+	[POCCTRL1] = { 0xe6060384, },
+	[POCCTRL2] = { 0xe6060388, },
+	[POCCTRL3] = { 0xe606038c, },
 	{ /* sentinel */ },
 };
 
@@ -2847,20 +2847,20 @@ static int r8a77980_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
 {
 	int bit = pin & 0x1f;
 
-	*pocctrl = pinmux_ioctrl_regs[IOCTRL30].reg;
+	*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
 	if (pin >= RCAR_GP_PIN(0, 0) && pin <= RCAR_GP_PIN(0, 21))
 		return bit;
 	else if (pin >= RCAR_GP_PIN(2, 0) && pin <= RCAR_GP_PIN(2, 9))
 		return bit + 22;
 
-	*pocctrl = pinmux_ioctrl_regs[IOCTRL31].reg;
+	*pocctrl = pinmux_ioctrl_regs[POCCTRL1].reg;
 	if (pin >= RCAR_GP_PIN(2, 10) && pin <= RCAR_GP_PIN(2, 16))
 		return bit - 10;
 	if ((pin >= RCAR_GP_PIN(2, 17) && pin <= RCAR_GP_PIN(2, 24)) ||
 	    (pin >= RCAR_GP_PIN(3,  0) && pin <= RCAR_GP_PIN(3, 16)))
 		return bit + 7;
 
-	*pocctrl = pinmux_ioctrl_regs[IOCTRL32].reg;
+	*pocctrl = pinmux_ioctrl_regs[POCCTRL2].reg;
 	if (pin >= RCAR_GP_PIN(2, 25) && pin <= RCAR_GP_PIN(2, 29))
 		return pin - 25;
 
-- 
2.17.1

