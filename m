Return-Path: <SRS0=0F6b=TK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A102C04AB3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 10 May 2019 12:10:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E04062175B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 10 May 2019 12:10:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbfEJMK1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 10 May 2019 08:10:27 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:58048 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbfEJMK1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 08:10:27 -0400
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id AcAQ2000G3XaVaC06cAQSX; Fri, 10 May 2019 14:10:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hP4M4-0003Qo-3e; Fri, 10 May 2019 14:10:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hP4M4-0001g0-2Z; Fri, 10 May 2019 14:10:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] pinctrl: sh-pfc: Add PORT_GP_27 helper macro
Date:   Fri, 10 May 2019 14:10:22 +0200
Message-Id: <20190510121023.6397-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510121023.6397-1-geert+renesas@glider.be>
References: <20190510121023.6397-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This follows the style of the existing PORT_GP_X macros, and will be
used by a follow-up patch for the r8a7778 SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index d1b61066ee88c6fd..305a8db70ca86334 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -546,9 +546,13 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	PORT_GP_CFG_1(bank, 25, fn, sfx, cfg)
 #define PORT_GP_26(bank, fn, sfx)	PORT_GP_CFG_26(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_28(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_27(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_26(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 26, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 26, fn, sfx, cfg)
+#define PORT_GP_27(bank, fn, sfx)	PORT_GP_CFG_27(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_28(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_27(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 27, fn, sfx, cfg)
 #define PORT_GP_28(bank, fn, sfx)	PORT_GP_CFG_28(bank, fn, sfx, 0)
 
-- 
2.17.1

