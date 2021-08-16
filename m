Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C96C4338F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Aug 2021 18:23:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A38C60F11
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Aug 2021 18:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhHPSYT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 16 Aug 2021 14:24:19 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:34143 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230122AbhHPSYS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Aug 2021 14:24:18 -0400
X-IronPort-AV: E=Sophos;i="5.84,326,1620658800"; 
   d="scan'208";a="90815948"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Aug 2021 03:23:42 +0900
Received: from localhost.localdomain (unknown [10.226.93.25])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0650440D2C9C;
        Tue, 17 Aug 2021 03:23:39 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: sh: rz-ssi: Fix wrong operator used issue
Date:   Mon, 16 Aug 2021 19:23:36 +0100
Message-Id: <20210816182336.29959-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix wrong operator used issue reported by Coverity by replacing |
operator with & operator.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reported-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/sh/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 69b45ee2d445..f097c773d413 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -368,7 +368,7 @@ static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	/* Wait for idle */
 	timeout = 100;
 	while (--timeout) {
-		if (rz_ssi_reg_readl(ssi, SSISR) | SSISR_IIRQ)
+		if (rz_ssi_reg_readl(ssi, SSISR) & SSISR_IIRQ)
 			break;
 		udelay(1);
 	}
-- 
2.17.1

