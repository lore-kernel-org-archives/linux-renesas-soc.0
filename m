Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637B3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:29:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 329142081B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:29:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733098AbfBRO3c (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 09:29:32 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:41260 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388570AbfBRN7b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 08:59:31 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id eDzV1z0033XaVaC06DzVMx; Mon, 18 Feb 2019 14:59:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gvjSC-0003kK-U6; Mon, 18 Feb 2019 14:59:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gvjSC-0007pt-Tq; Mon, 18 Feb 2019 14:59:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] pinctrl: sh-pfc: r8a77990: Rename IOCTRLx registers
Date:   Mon, 18 Feb 2019 14:59:27 +0100
Message-Id: <20190218135927.30068-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190218135927.30068-1-geert+renesas@glider.be>
References: <20190218135927.30068-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car Gen3 HardWare Manual Errata for Rev. 1.00 (Jul 2, 2018)
renamed the various miscellaneous I/O control registers (IOCTRLx) on
R-Car E3, to reflect better their actual purposes, and matching other
SoCs.

Update to code to match this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 151640c30e9dc791..982b215fa0724549 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -4995,11 +4995,11 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 };
 
 enum ioctrl_regs {
-	IOCTRL30,
+	POCCTRL0,
 };
 
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
-	[IOCTRL30] = { 0xe6060380, },
+	[POCCTRL0] = { 0xe6060380, },
 	{ /* sentinel */ },
 };
 
@@ -5008,7 +5008,7 @@ static int r8a77990_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
 {
 	int bit = -EINVAL;
 
-	*pocctrl = pinmux_ioctrl_regs[IOCTRL30].reg;
+	*pocctrl = pinmux_ioctrl_regs[POCCTRL0].reg;
 
 	if (pin >= RCAR_GP_PIN(3, 0) && pin <= RCAR_GP_PIN(3, 11))
 		bit = pin & 0x1f;
-- 
2.17.1

