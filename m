Return-Path: <SRS0=nqfF=PP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C50C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 22:13:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FDDD2087F
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 22:13:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbfAGWNl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Jan 2019 17:13:41 -0500
Received: from sauhun.de ([88.99.104.3]:34982 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726674AbfAGWNl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jan 2019 17:13:41 -0500
Received: from localhost (p54B338A8.dip0.t-ipconnect.de [84.179.56.168])
        by pokefinder.org (Postfix) with ESMTPSA id CDDE93E48B1;
        Mon,  7 Jan 2019 23:13:39 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/2] pinctrl: sh-pfc: r8a7790: initialize TDSEL register for ES1.0
Date:   Mon,  7 Jan 2019 23:13:19 +0100
Message-Id: <20190107221320.14930-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190107221320.14930-1-wsa+renesas@sang-engineering.com>
References: <20190107221320.14930-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Documentation for ES1.0 says that some bits in TDSEL must be set (ch
5.3.39 in R-Car H2 v0.91). However, the reset value of the register is
0, so software has to do it. Add this to the kernel driver to ensure
this is really done independent of firmware versions and use
whitelisting for ES versions known to need this.

This is needed for some SD cards supporting SDR104 transfer mode. For
me, TDSEL was not initialized by the firmware and I had problems with
the card when re-inserting it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
index ab7a35392cd8..a84229cb8cd4 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
@@ -10,7 +10,9 @@
 
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/sys_soc.h>
 
+#include "core.h"
 #include "sh_pfc.h"
 
 /*
@@ -5691,7 +5693,22 @@ static int r8a7790_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
 	return 31 - (pin & 0x1f);
 }
 
+static const struct soc_device_attribute r8a7790_tdsel[] = {
+	{ .soc_id = "r8a7790", .revision = "ES1.0" },
+	{ /* sentinel */ }
+};
+
+static int r8a7790_pinmux_soc_init(struct sh_pfc *pfc)
+{
+	/* Initialize TDSEL on old revisions */
+	if (soc_device_match(r8a7790_tdsel))
+		sh_pfc_write(pfc, 0xe6060088, 0x00155554);
+
+	return 0;
+}
+
 static const struct sh_pfc_soc_operations r8a7790_pinmux_ops = {
+	.init = r8a7790_pinmux_soc_init,
 	.pin_to_pocctrl = r8a7790_pin_to_pocctrl,
 };
 
-- 
2.11.0

