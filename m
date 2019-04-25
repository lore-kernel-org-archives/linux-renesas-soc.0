Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF556C10F03
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:55:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96626217D7
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbfDYJzr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 05:55:47 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:45884 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728775AbfDYJzq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 05:55:46 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id 4Zvk200023XaVaC01ZvkWR; Thu, 25 Apr 2019 11:55:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJb6V-0003Wv-VV; Thu, 25 Apr 2019 11:55:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJb6V-0000Ch-US; Thu, 25 Apr 2019 11:55:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] pinctrl: sh-pfc: Validate pin tables at runtime
Date:   Thu, 25 Apr 2019 11:55:42 +0200
Message-Id: <20190425095542.726-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190425095542.726-1-geert+renesas@glider.be>
References: <20190425095542.726-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Extend the run-time debug code with checks to ensure there are no
conflicting pin names, numbers, or enumeration values.

This helps catching bugs early.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 889e5af281022e1d..3009508f466cf766 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -773,6 +773,35 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 
 	pr_info("Checking %s\n", drvname);
 
+	/* Check pins */
+	for (i = 0; i < info->nr_pins; i++) {
+		for (j = 0; j < i; j++) {
+			if (!strcmp(info->pins[i].name, info->pins[j].name)) {
+				pr_err("%s: pin %s/%s: name conflict\n",
+				       drvname, info->pins[i].name,
+				       info->pins[j].name);
+				sh_pfc_errors++;
+			}
+
+			if (info->pins[i].pin != (u16)-1 &&
+			    info->pins[i].pin == info->pins[j].pin) {
+				pr_err("%s: pin %s/%s: pin %u conflict\n",
+				       drvname, info->pins[i].name,
+				       info->pins[j].name, info->pins[i].pin);
+				sh_pfc_errors++;
+			}
+
+			if (info->pins[i].enum_id &&
+			    info->pins[i].enum_id == info->pins[j].enum_id) {
+				pr_err("%s: pin %s/%s: enum_id %u conflict\n",
+				       drvname, info->pins[i].name,
+				       info->pins[j].name,
+				       info->pins[i].enum_id);
+				sh_pfc_errors++;
+			}
+		}
+	}
+
 	/* Check groups and functions */
 	refcnts = kcalloc(info->nr_groups, sizeof(*refcnts), GFP_KERNEL);
 	if (!refcnts)
-- 
2.17.1

