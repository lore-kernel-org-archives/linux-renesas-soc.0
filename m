Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89EAC282E3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:55:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B91E9218B0
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbfDYJzr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 05:55:47 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:57596 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbfDYJzq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 05:55:46 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id 4Zvk200053XaVaC06Zvkth; Thu, 25 Apr 2019 11:55:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJb6V-0003Wp-Tp; Thu, 25 Apr 2019 11:55:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJb6V-0000Ca-Sw; Thu, 25 Apr 2019 11:55:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] pinctrl: sh-pfc: Mark run-time debug code __init
Date:   Thu, 25 Apr 2019 11:55:40 +0200
Message-Id: <20190425095542.726-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190425095542.726-1-geert+renesas@glider.be>
References: <20190425095542.726-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

All run-time debug code is called from sh_pfc_init(), which is __init.

Fixes: 6161b39a14380815 ("pinctrl: sh-pfc: Validate pinmux tables at runtime when debugging")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 18d7f6d9402093d4..868b9551438efb0a 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -717,7 +717,7 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
 #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
 
 #ifdef DEBUG
-static bool is0s(const u16 *enum_ids, unsigned int n)
+static bool __init is0s(const u16 *enum_ids, unsigned int n)
 {
 	unsigned int i;
 
@@ -728,11 +728,11 @@ static bool is0s(const u16 *enum_ids, unsigned int n)
 	return true;
 }
 
-static unsigned int sh_pfc_errors;
-static unsigned int sh_pfc_warnings;
+static unsigned int sh_pfc_errors __initdata = 0;
+static unsigned int sh_pfc_warnings __initdata = 0;
 
-static void sh_pfc_check_cfg_reg(const char *drvname,
-				 const struct pinmux_cfg_reg *cfg_reg)
+static void __init sh_pfc_check_cfg_reg(const char *drvname,
+					const struct pinmux_cfg_reg *cfg_reg)
 {
 	unsigned int i, n, rw, fw;
 
@@ -764,7 +764,7 @@ static void sh_pfc_check_cfg_reg(const char *drvname,
 	}
 }
 
-static void sh_pfc_check_info(const struct sh_pfc_soc_info *info)
+static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 {
 	const struct sh_pfc_function *func;
 	const char *drvname = info->name;
@@ -816,7 +816,7 @@ static void sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 		sh_pfc_check_cfg_reg(drvname, &info->cfg_regs[i]);
 }
 
-static void sh_pfc_check_driver(const struct platform_driver *pdrv)
+static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
 {
 	unsigned int i;
 
-- 
2.17.1

