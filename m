Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59C8C282DA
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 790F3222AF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfDSSWO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:22:14 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58838 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfDSSWN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:22:13 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2189F25BEF9;
        Sat, 20 Apr 2019 00:35:24 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 0CE8CE21AF8; Fri, 19 Apr 2019 16:35:22 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/1] soc: renesas: Identify R-Car M3-W ES1.3
Date:   Fri, 19 Apr 2019 16:35:21 +0200
Message-Id: <15160f6de0bba712fcea078c5ac7571fe33fcd5d.1555684066.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1555684066.git.horms+renesas@verge.net.au>
References: <cover.1555684066.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

The Product Register of R-Car M3-W ES1.3 incorrectly identifies the SoC
revision as ES2.1. Add a workaround to fix this.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/renesas-soc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 4af96e668a2f..3299cf5365f3 100644
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
2.11.0

