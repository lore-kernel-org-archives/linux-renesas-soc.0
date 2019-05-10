Return-Path: <SRS0=0F6b=TK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4694EC04AB2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 10 May 2019 12:10:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17C4120850
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 10 May 2019 12:10:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbfEJMK1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 10 May 2019 08:10:27 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:58044 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbfEJMK1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 08:10:27 -0400
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id AcAQ2000F3XaVaC06cAQSW; Fri, 10 May 2019 14:10:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hP4M4-0003Qp-4G; Fri, 10 May 2019 14:10:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hP4M4-0001g2-3E; Fri, 10 May 2019 14:10:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a7778: Use common PORT_GP_CFG_27() macro
Date:   Fri, 10 May 2019 14:10:23 +0200
Message-Id: <20190510121023.6397-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510121023.6397-1-geert+renesas@glider.be>
References: <20190510121023.6397-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Get rid of the custom PORT_GP_PUP_27() macro by using the common
PORT_GP_CFG_27() macro instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No change in generated code.
---
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7778.c b/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
index 985e8c215c6dee48..564b219942aac34c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
@@ -22,28 +22,12 @@
 #define PORT_GP_PUP_1(bank, pin, fn, sfx)	\
 	PORT_GP_CFG_1(bank, pin, fn, sfx, SH_PFC_PIN_CFG_PULL_UP)
 
-#define PORT_GP_PUP_27(bank, fn, sfx)					\
-	PORT_GP_PUP_1(bank, 0,  fn, sfx), PORT_GP_PUP_1(bank, 1,  fn, sfx),	\
-	PORT_GP_PUP_1(bank, 2,  fn, sfx), PORT_GP_PUP_1(bank, 3,  fn, sfx),	\
-	PORT_GP_PUP_1(bank, 4,  fn, sfx), PORT_GP_PUP_1(bank, 5,  fn, sfx),	\
-	PORT_GP_PUP_1(bank, 6,  fn, sfx), PORT_GP_PUP_1(bank, 7,  fn, sfx),	\
-	PORT_GP_PUP_1(bank, 8,  fn, sfx), PORT_GP_PUP_1(bank, 9,  fn, sfx),	\
-	PORT_GP_PUP_1(bank, 10, fn, sfx), PORT_GP_PUP_1(bank, 11, fn, sfx),	\
-	PORT_GP_PUP_1(bank, 12, fn, sfx), PORT_GP_PUP_1(bank, 13, fn, sfx),	\
-	PORT_GP_PUP_1(bank, 14, fn, sfx), PORT_GP_PUP_1(bank, 15, fn, sfx),	\
-	PORT_GP_PUP_1(bank, 16, fn, sfx), PORT_GP_PUP_1(bank, 17, fn, sfx),	\
-	PORT_GP_PUP_1(bank, 18, fn, sfx), PORT_GP_PUP_1(bank, 19, fn, sfx),	\
-	PORT_GP_PUP_1(bank, 20, fn, sfx), PORT_GP_PUP_1(bank, 21, fn, sfx),	\
-	PORT_GP_PUP_1(bank, 22, fn, sfx), PORT_GP_PUP_1(bank, 23, fn, sfx),	\
-	PORT_GP_PUP_1(bank, 24, fn, sfx), PORT_GP_PUP_1(bank, 25, fn, sfx),	\
-	PORT_GP_PUP_1(bank, 26, fn, sfx)
-
 #define CPU_ALL_GP(fn, sfx)		\
 	PORT_GP_CFG_32(0, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_32(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_32(2, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_32(3, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
-	PORT_GP_PUP_27(4, fn, sfx)
+	PORT_GP_CFG_27(4, fn, sfx, SH_PFC_PIN_CFG_PULL_UP)
 
 enum {
 	PINMUX_RESERVED = 0,
-- 
2.17.1

