Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E795C282E6
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1363A218D3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbfDYJzr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 05:55:47 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:45878 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728781AbfDYJzr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 05:55:47 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id 4Zvk200013XaVaC01ZvkWQ; Thu, 25 Apr 2019 11:55:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJb6V-0003Wt-Uh; Thu, 25 Apr 2019 11:55:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJb6V-0000Ce-TZ; Thu, 25 Apr 2019 11:55:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] pinctrl: sh-pfc: Add check for empty pinmux groups/functions
Date:   Thu, 25 Apr 2019 11:55:41 +0200
Message-Id: <20190425095542.726-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190425095542.726-1-geert+renesas@glider.be>
References: <20190425095542.726-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The pinmux groups and functions arrays may contain two parts, to ease
supporting SoCs that expose pin subsets of other related SoCs.  Both
parts need to be declared with explicit sizes, which thus need to be
updated when adding support for more groups and functions.

If a size is too small, the compiler will detect this at build time
("excess elements in array initializer").
If a size is too large, this may go undetected (for pin groups), lead to
pin controller registration failures (for pin functions: "pinmux ops has
no name for functionN"), or crash the optional run-time debug code (for
pin groups).

Extend the run-time debug code with checks to detect this, to help
catching bugs early.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 868b9551438efb0a..889e5af281022e1d 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -780,9 +780,15 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 
 	for (i = 0; i < info->nr_functions; i++) {
 		func = &info->functions[i];
+		if (!func->name) {
+			pr_err("%s: empty function %u\n", drvname, i);
+			sh_pfc_errors++;
+			continue;
+		}
 		for (j = 0; j < func->nr_groups; j++) {
 			for (k = 0; k < info->nr_groups; k++) {
-				if (!strcmp(func->groups[j],
+				if (info->groups[k].name &&
+				    !strcmp(func->groups[j],
 					    info->groups[k].name)) {
 					refcnts[k]++;
 					break;
@@ -798,6 +804,11 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	}
 
 	for (i = 0; i < info->nr_groups; i++) {
+		if (!info->groups[i].name) {
+			pr_err("%s: empty group %u\n", drvname, i);
+			sh_pfc_errors++;
+			continue;
+		}
 		if (!refcnts[i]) {
 			pr_err("%s: orphan group %s\n", drvname,
 			       info->groups[i].name);
-- 
2.17.1

