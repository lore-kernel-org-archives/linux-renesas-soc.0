Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B812C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:21:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10FF42146E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbfCTKVq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 06:21:46 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:46484 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727616AbfCTKVq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 06:21:46 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id qAMk1z0013XaVaC06AMkmq; Wed, 20 Mar 2019 11:21:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YLv-0005Ft-V1; Wed, 20 Mar 2019 11:21:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YLv-00052z-Ty; Wed, 20 Mar 2019 11:21:43 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 10/10] pinctrl: sh-pfc: Validate enum IDs for regs with variable-width fields
Date:   Wed, 20 Mar 2019 11:21:41 +0100
Message-Id: <20190320102141.19316-11-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190320102141.19316-1-geert+renesas@glider.be>
References: <20190320102141.19316-1-geert+renesas@glider.be>
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
v3:
  - Reduce nr_enum_ids to u16, and move it into the existing padding
    hole,
  - Introduce SET_NR_ENUM_IDS() macro to reduce duplication and ifdef
    clutter,

v2:
  - Extract into its own patch.
---
 drivers/pinctrl/sh-pfc/core.c   | 6 ++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 2ceed2f5ac08235b..3f989f5cb021ecbc 100644
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
index 31acde5032a0691a..2a6abeb62bab659b 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -111,6 +111,12 @@ struct pinmux_func {
 struct pinmux_cfg_reg {
 	u32 reg;
 	u8 reg_width, field_width;
+#ifdef DEBUG
+	u16 nr_enum_ids;	/* for variable width regs only */
+#define SET_NR_ENUM_IDS(n)	.nr_enum_ids = n,
+#else
+#define SET_NR_ENUM_IDS(n)
+#endif
 	const u16 *enum_ids;
 	const u8 *var_field_width;
 };
@@ -151,6 +157,7 @@ struct pinmux_cfg_reg {
 #define PINMUX_CFG_REG_VAR(name, r, r_width, f_widths, ids)		\
 	.reg = r, .reg_width = r_width,					\
 	.var_field_width = (const u8 []) { f_widths, 0 },		\
+	SET_NR_ENUM_IDS(sizeof((const u16 []) { ids }) / sizeof(u16))	\
 	.enum_ids = (const u16 []) { ids }
 
 struct pinmux_drive_reg_field {
-- 
2.17.1

