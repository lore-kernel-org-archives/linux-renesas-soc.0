Return-Path: <SRS0=nqfF=PP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4399C43612
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 22:13:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 820FA2147C
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 22:13:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfAGWNm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Jan 2019 17:13:42 -0500
Received: from sauhun.de ([88.99.104.3]:34988 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726918AbfAGWNm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jan 2019 17:13:42 -0500
Received: from localhost (p54B338A8.dip0.t-ipconnect.de [84.179.56.168])
        by pokefinder.org (Postfix) with ESMTPSA id 6C41A3E48B2;
        Mon,  7 Jan 2019 23:13:40 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/2] pinctrl: sh-pfc: r8a7794: initialize TDSEL register for ES1.0
Date:   Mon,  7 Jan 2019 23:13:20 +0100
Message-Id: <20190107221320.14930-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190107221320.14930-1-wsa+renesas@sang-engineering.com>
References: <20190107221320.14930-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Documentation for ES1.0 says that some bits in TDSEL must be set (ch
5.3.35 in R-Car E2 v0.5). However, the reset value of the register is 0,
so software has to do it. Add this to the kernel driver to ensure this
is really done independent of firmware versions and use whitelisting for
ES versions known to need this.

This is needed for some SD cards supporting SDR104 transfer mode.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
index fcf1339c4058..958a5f714c93 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/sys_soc.h>
 
 #include "core.h"
 #include "sh_pfc.h"
@@ -5560,7 +5561,22 @@ static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
 	return -EINVAL;
 }
 
+static const struct soc_device_attribute r8a7794_tdsel[] = {
+	{ .soc_id = "r8a7794", .revision = "ES1.0" },
+	{ /* sentinel */ }
+};
+
+static int r8a7794_pinmux_soc_init(struct sh_pfc *pfc)
+{
+	/* Initialize TDSEL on old revisions */
+	if (soc_device_match(r8a7794_tdsel))
+		sh_pfc_write(pfc, 0xe6060068, 0x55555500);
+
+	return 0;
+}
+
 static const struct sh_pfc_soc_operations r8a7794_pinmux_ops = {
+	.init = r8a7794_pinmux_soc_init,
 	.pin_to_pocctrl = r8a7794_pin_to_pocctrl,
 };
 
-- 
2.11.0

