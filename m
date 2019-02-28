Return-Path: <SRS0=CNOd=RD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF67C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 11:00:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F0DB21850
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 11:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730823AbfB1LA6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Feb 2019 06:00:58 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:57362 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727086AbfB1LA6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Feb 2019 06:00:58 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id iB0w1z01T3XaVaC01B0wUQ; Thu, 28 Feb 2019 12:00:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gzJQu-0007SI-T3; Thu, 28 Feb 2019 12:00:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gzJQu-0000P9-RX; Thu, 28 Feb 2019 12:00:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: Identify R-Car M3-W ES1.3
Date:   Thu, 28 Feb 2019 12:00:48 +0100
Message-Id: <20190228110048.1491-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

The Product Register of R-Car M3-W ES1.3 incorrectly identifies the SoC
revision as ES2.1. Add a workaround to fix this.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/renesas-soc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 4af96e668a2f1d69..3299cf5365f3c7d5 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -335,6 +335,9 @@ static int __init renesas_soc_init(void)
 		/* R-Car M3-W ES1.1 incorrectly identifies as ES2.0 */
 		if ((product & 0x7fff) == 0x5210)
 			product ^= 0x11;
+		/* R-Car M3-W ES1.3 incorrectly identifies as ES2.1 */
+		if ((product & 0x7fff) == 0x5211)
+			product ^= 0x12;
 		if (soc->id && ((product >> 8) & 0xff) != soc->id) {
 			pr_warn("SoC mismatch (product = 0x%x)\n", product);
 			return -ENODEV;
-- 
2.17.1

