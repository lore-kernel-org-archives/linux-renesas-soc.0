Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B4AC282C6
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68E2B218DE
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbfAYQxJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 11:53:09 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:51374 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729161AbfAYQxJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 11:53:09 -0500
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id Ugt61z00M3XaVaC01gt64w; Fri, 25 Jan 2019 17:53:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0007ZR-JW; Fri, 25 Jan 2019 17:53:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0002FS-Ht; Fri, 25 Jan 2019 17:53:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 07/10] pinctrl: sh-pfc: Validate enum IDs for regs with variable-width fields
Date:   Fri, 25 Jan 2019 17:53:02 +0100
Message-Id: <20190125165305.8567-8-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190125165305.8567-1-geert+renesas@glider.be>
References: <20190125165305.8567-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a run-time check to the PINMUX_CFG_REG_VAR() macro, to ensure the
number of provided enum IDs is correct.  This cannot be done at build
time, as the number of values depends on the variable-width fields in
the config register.

This helps catching bugs early.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Extract into its own patch.
---
 drivers/pinctrl/sh-pfc/core.c   |  6 ++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index f9371e160872f2b4..271f190d08a509f8 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -756,6 +756,12 @@ static void sh_pfc_check_cfg_reg(const char *drvname,
 		       drvname, cfg_reg->reg, rw, cfg_reg->reg_width);
 		sh_pfc_errors++;
 	}
+
+	if (n != cfg_reg->nr_enum_ids) {
+		pr_err("%s: reg 0x%x: enum_ids[] has %u instead of %u values\n",
+		       drvname, cfg_reg->reg, cfg_reg->nr_enum_ids, n);
+		sh_pfc_errors++;
+	}
 }
 
 static void sh_pfc_check_info(const struct sh_pfc_soc_info *info)
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index dd483dbb71f06be3..9f5d54b851b14ac9 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -113,6 +113,9 @@ struct pinmux_cfg_reg {
 	u8 reg_width, field_width;
 	const u16 *enum_ids;
 	const u8 *var_field_width;
+#ifdef DEBUG
+	unsigned int nr_enum_ids;	/* for variable width regs only */
+#endif
 };
 
 #define GROUP(...)	__VA_ARGS__
@@ -148,11 +151,23 @@ struct pinmux_cfg_reg {
  *          combination of the register field bit values, all wrapped using
  *          the GROUP() macro.
  */
+#ifdef DEBUG
+
+#define PINMUX_CFG_REG_VAR(name, r, r_width, f_widths, ids)		\
+	.reg = r, .reg_width = r_width,					\
+	.var_field_width = (const u8 []) { f_widths, 0 },		\
+	.enum_ids = (const u16 []) { ids },				\
+	.nr_enum_ids = sizeof((const u16 []) { ids }) / sizeof(u16)
+
+#else
+
 #define PINMUX_CFG_REG_VAR(name, r, r_width, f_widths, ids)		\
 	.reg = r, .reg_width = r_width,					\
 	.var_field_width = (const u8 []) { f_widths, 0 },		\
 	.enum_ids = (const u16 []) { ids }
 
+#endif
+
 struct pinmux_drive_reg_field {
 	u16 pin;
 	u8 offset;
-- 
2.17.1

