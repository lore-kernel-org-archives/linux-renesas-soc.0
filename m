Return-Path: <SRS0=94f6=TP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D544C04E53
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 15 May 2019 18:24:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 413C62084F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 15 May 2019 18:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbfEOSYA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 15 May 2019 14:24:00 -0400
Received: from sauhun.de ([88.99.104.3]:57916 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726084AbfEOSYA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 14:24:00 -0400
Received: from localhost (p54B332CD.dip0.t-ipconnect.de [84.179.50.205])
        by pokefinder.org (Postfix) with ESMTPSA id E7D862C009E;
        Wed, 15 May 2019 20:23:57 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: tmio: fix SCC error handling to avoid false positive CRC error
Date:   Wed, 15 May 2019 20:23:46 +0200
Message-Id: <20190515182346.5292-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

If an SCC error occurs during a read/write command execution, a false
positive CRC error message is output.

mmcblk0: response CRC error sending r/w cmd command, card status 0x900

check_scc_error() checks SCC_RVSREQ.RVSERR bit. RVSERR detects a
correction error in the next (up or down) delay tap position. However,
since the command is successful, only retuning needs to be executed.
This has been confirmed by HW engineers.

Thus, on SCC error, set retuning flag instead of setting an error code.

Fixes: b85fb0a1c8ae ("mmc: tmio: Fix SCC error detection")
Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
[wsa: updated comment and commit message, removed some braces]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This patch was suggested by the BSP team because they were seeing CRC errors
with a hardware I don't have access to. I tested this with my R-Car H3-ES2.0
and M3-N (both Salvator-XS), and things were still running fine. But I suggest
to wait for a final ack from Shimoda-san or someone from the BSP team.


 drivers/mmc/host/tmio_mmc_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 595949f1f001..78cc2a928efe 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -842,8 +842,9 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
 	if (mrq->cmd->error || (mrq->data && mrq->data->error))
 		tmio_mmc_abort_dma(host);
 
+	/* SCC error means retune, but executed command was still successful */
 	if (host->check_scc_error && host->check_scc_error(host))
-		mrq->cmd->error = -EILSEQ;
+		mmc_retune_needed(host->mmc);
 
 	/* If SET_BLOCK_COUNT, continue with main command */
 	if (host->mrq && !mrq->cmd->error) {
-- 
2.11.0

