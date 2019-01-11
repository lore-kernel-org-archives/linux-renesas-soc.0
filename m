Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D79C43612
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 11:57:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B792A2177B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 11:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731067AbfAKL5u (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 06:57:50 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:59528 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731086AbfAKL5u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 06:57:50 -0500
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id Nzxo1z00P3XaVaC01zxoHx; Fri, 11 Jan 2019 12:57:49 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvRc-0005ll-CE; Fri, 11 Jan 2019 12:57:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvRc-0007jb-BD; Fri, 11 Jan 2019 12:57:48 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a77990: GP6_9 does not have pull-down capability
Date:   Fri, 11 Jan 2019 12:57:43 +0100
Message-Id: <20190111115744.29685-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190111115744.29685-1-geert+renesas@glider.be>
References: <20190111115744.29685-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hence remove the SH_PFC_PIN_CFG_PULL_DOWN flag from the GP6_9 GPIO
description.

Fixes: 83f6941a42a5e773 ("pinctrl: sh-pfc: r8a77990: Add bias pinconf support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 1ce286f7b286dde7..a1d99980788ac1cb 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -30,7 +30,16 @@
 	PORT_GP_CFG_1(3, 15, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_11(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
 	PORT_GP_CFG_20(5, fn, sfx, CFG_FLAGS), \
-	PORT_GP_CFG_18(6, fn, sfx, CFG_FLAGS)
+	PORT_GP_CFG_9(6, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_1(6, 9, fn, sfx, SH_PFC_PIN_CFG_PULL_UP), \
+	PORT_GP_CFG_1(6, 10, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_1(6, 11, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_1(6, 12, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_1(6, 13, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_1(6, 14, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_1(6, 15, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_1(6, 16, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_1(6, 17, fn, sfx, CFG_FLAGS)
 /*
  * F_() : just information
  * FM() : macro for FN_xxx / xxx_MARK
-- 
2.17.1

