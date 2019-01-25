Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04121C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CDD52218CD
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbfAYQxI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 11:53:08 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:49580 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729129AbfAYQxI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 11:53:08 -0500
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id Ugt61z00U3XaVaC01gt6QU; Fri, 25 Jan 2019 17:53:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0007ZN-I1; Fri, 25 Jan 2019 17:53:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0002FP-Gu; Fri, 25 Jan 2019 17:53:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 06/10] pinctrl: sh-pfc: Validate enum IDs for regs with fixed-width fields
Date:   Fri, 25 Jan 2019 17:53:01 +0100
Message-Id: <20190125165305.8567-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190125165305.8567-1-geert+renesas@glider.be>
References: <20190125165305.8567-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add build-time checks to the PINMUX_CFG_REG() and PINMUX_DATA_REG()
macros, to ensure the number of provided enum IDs is correct.

This helps catching bugs early.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Convert from run-time to build-time check.
  - Add check for PINMUX_DATA_REG().
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 77a47d01f82844c7..dd483dbb71f06be3 100644
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

