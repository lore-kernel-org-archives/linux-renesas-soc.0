Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DFDC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:21:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B74542146E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:21:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfCTKVr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 06:21:47 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:55376 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbfCTKVq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 06:21:46 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id qAMk1z0023XaVaC01AMk7L; Wed, 20 Mar 2019 11:21:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YLv-0005Fq-U4; Wed, 20 Mar 2019 11:21:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YLv-00052w-T0; Wed, 20 Mar 2019 11:21:43 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 09/10] pinctrl: sh-pfc: Validate enum IDs for regs with fixed-width fields
Date:   Wed, 20 Mar 2019 11:21:40 +0100
Message-Id: <20190320102141.19316-10-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190320102141.19316-1-geert+renesas@glider.be>
References: <20190320102141.19316-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add build-time checks to the PINMUX_CFG_REG() and PINMUX_DATA_REG()
macros, to ensure the number of provided enum IDs is correct.

This helps catching bugs early.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - No changes,

v2:
  - Convert from run-time to build-time check.
  - Add check for PINMUX_DATA_REG().
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 57e13b623b2e87ec..31acde5032a0691a 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -130,7 +130,9 @@ struct pinmux_cfg_reg {
  */
 #define PINMUX_CFG_REG(name, r, r_width, f_width, ids)			\
 	.reg = r, .reg_width = r_width,					\
-	.field_width = f_width + BUILD_BUG_ON_ZERO(r_width % f_width),	\
+	.field_width = f_width + BUILD_BUG_ON_ZERO(r_width % f_width) +	\
+	BUILD_BUG_ON_ZERO(sizeof((const u16 []) { ids }) / sizeof(u16) != \
+			  (r_width / f_width) * (1 << f_width)),	\
 	.enum_ids = (const u16 [(r_width / f_width) * (1 << f_width)])	\
 		{ ids }
 
@@ -196,7 +198,9 @@ struct pinmux_data_reg {
  *          enum ID must be specified, all wrapped using the GROUP() macro.
  */
 #define PINMUX_DATA_REG(name, r, r_width, ids)				\
-	.reg = r, .reg_width = r_width,					\
+	.reg = r, .reg_width = r_width +				\
+	BUILD_BUG_ON_ZERO(sizeof((const u16 []) { ids }) / sizeof(u16) != \
+			  r_width),					\
 	.enum_ids = (const u16 [r_width]) { ids }
 
 struct pinmux_irq {
-- 
2.17.1

