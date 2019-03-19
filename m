Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BFBC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 10:34:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C49A206BA
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 10:34:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727623AbfCSKeX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 06:34:23 -0400
Received: from sauhun.de ([88.99.104.3]:43686 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbfCSKeX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 06:34:23 -0400
Received: from localhost (p5486CE21.dip0.t-ipconnect.de [84.134.206.33])
        by pokefinder.org (Postfix) with ESMTPSA id 57C352C3F83;
        Tue, 19 Mar 2019 11:34:21 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: renesas_sdhi: set CBSY flag before probing TMIO host
Date:   Tue, 19 Mar 2019 11:34:17 +0100
Message-Id: <20190319103417.28407-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The CBSY flag should be proper before calling tmio_mmc_host_probe()
because this function will already use write16 which checks this bit.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This patch depends on "[RFT] mmc: renesas_sdhi: limit block count to 16 bit for
old revisions" [1]. This one, however, is not backed by a bug report but just
found by code review. I wouldn't suggest stable here because the non-working
case is probably more on the academic side (unless I overlooked something).
Yet, the code becomes easier to read because it is the flow one would expect.
So, I post this already for discussion. We need to wait for the dependency
first, of course.

Tested on the SDR50 only SDHI of a Renesas Lager board (R-Car H2). No
regressions encountered: still probes fine and works at the same speed.

[1] https://patchwork.kernel.org/patch/10859279/

 drivers/mmc/host/renesas_sdhi_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 8742e27e4e8b..5885f3fb0b2f 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -779,14 +779,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
 		mmc_data->max_blk_count = U16_MAX;
 
-	ret = tmio_mmc_host_probe(host);
-	if (ret < 0)
-		goto edisclk;
-
 	/* One Gen2 SDHI incarnation does NOT have a CBSY bit */
 	if (ver == SDHI_VER_GEN2_SDR50)
 		mmc_data->flags &= ~TMIO_MMC_HAVE_CBSY;
 
+	ret = tmio_mmc_host_probe(host);
+	if (ret < 0)
+		goto edisclk;
+
 	/* Enable tuning iff we have an SCC and a supported mode */
 	if (of_data && of_data->scc_offset &&
 	    (host->mmc->caps & MMC_CAP_UHS_SDR104 ||
-- 
2.11.0

