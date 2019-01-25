Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB8EC282C6
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD766218CD
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729108AbfAYQxJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 11:53:09 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:34788 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728623AbfAYQxI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 11:53:08 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id Ugt61z00S3XaVaC06gt6Mm; Fri, 25 Jan 2019 17:53:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0007Z7-CR; Fri, 25 Jan 2019 17:53:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0002FA-Bb; Fri, 25 Jan 2019 17:53:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 01/10] pinctrl: sh-pfc: Validate fixed-size field widths at build time
Date:   Fri, 25 Jan 2019 17:52:56 +0100
Message-Id: <20190125165305.8567-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190125165305.8567-1-geert+renesas@glider.be>
References: <20190125165305.8567-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a build-time check, to ensure the register and field widths in
descriptors for config registers with fixed-width fields are sane.
This helps catching bugs early.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Convert from run-time to build-time check.
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 46d477ff510921f3..56016cb76769c97b 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -126,7 +126,8 @@ struct pinmux_cfg_reg {
  * one for each possible combination of the register field bit values.
  */
 #define PINMUX_CFG_REG(name, r, r_width, f_width) \
-	.reg = r, .reg_width = r_width, .field_width = f_width,		\
+	.reg = r, .reg_width = r_width,					\
+	.field_width = f_width + BUILD_BUG_ON_ZERO(r_width % f_width),	\
 	.enum_ids = (const u16 [(r_width / f_width) * (1 << f_width)])
 
 /*
-- 
2.17.1

