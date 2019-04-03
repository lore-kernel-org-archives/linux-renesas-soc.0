Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E63C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EC4A20830
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:17:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbfDCJRe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 05:17:34 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:13203 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfDCJRe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 05:17:34 -0400
Received: from fsav101.sakura.ne.jp (fsav101.sakura.ne.jp [27.133.134.228])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x339HScY007891;
        Wed, 3 Apr 2019 18:17:28 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav101.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav101.sakura.ne.jp);
 Wed, 03 Apr 2019 18:17:28 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav101.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x339HO1v007862
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 3 Apr 2019 18:17:28 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
From:   Nguyen An Hoan <na-hoan@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be
Cc:     linux-spi@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
Subject: [PATCH] spi: sh-msiof: Fix the limit of data length when calculating the length of words
Date:   Wed,  3 Apr 2019 18:17:23 +0900
Message-Id: <1554283043-9206-1-git-send-email-na-hoan@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

We can use each word (data length) of 32bits (4 bytes),
so that if the length is greater than 3bytes, we can
align it with 4bytes of words.

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/spi/spi-sh-msiof.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index e2eb466..1552c14 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -930,7 +930,7 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
 	if (!spi_controller_is_slave(p->ctlr))
 		sh_msiof_spi_set_clk_regs(p, clk_get_rate(p->clk), t->speed_hz);
 
-	while (ctlr->dma_tx && len > 15) {
+	while (ctlr->dma_tx && len > 3) {
 		/*
 		 *  DMA supports 32-bit words only, hence pack 8-bit and 16-bit
 		 *  words, with byte resp. word swapping.
@@ -974,7 +974,7 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
 			return 0;
 	}
 
-	if (bits <= 8 && len > 15) {
+	if (bits <= 8 && len > 3) {
 		bits = 32;
 		swab = true;
 	} else {
-- 
2.7.4

