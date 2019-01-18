Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1806C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 09:30:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CD8420823
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 09:30:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfARJaB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 04:30:01 -0500
Received: from www3345.sakura.ne.jp ([49.212.235.55]:58021 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfARJaB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 04:30:01 -0500
Received: from fsav405.sakura.ne.jp (fsav405.sakura.ne.jp [133.242.250.104])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x0I9TqVB005315;
        Fri, 18 Jan 2019 18:29:52 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav405.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp);
 Fri, 18 Jan 2019 18:29:52 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x0I9TjhQ005252
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 18 Jan 2019 18:29:52 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
From:   Nguyen An Hoan <na-hoan@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be
Cc:     linux-spi@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: [v2 PATCH 2/2] spi: sh-msiof: Use DMA if possible
Date:   Fri, 18 Jan 2019 18:29:31 +0900
Message-Id: <1547803771-9564-2-git-send-email-na-hoan@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547803771-9564-1-git-send-email-na-hoan@jinso.co.jp>
References: <1547803771-9564-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Currently, this driver only supports feature for DMA 32-bits.
In this case, only if the data length is divisible by 4 to use
DMA, otherwise PIO will be used. This patch will suggest use
the DMA 32-bits with 4bytes of words, then the remaining data
will be transmitted by PIO mode.

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/spi/spi-sh-msiof.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 351470b..617cdf3 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -937,17 +937,13 @@ static int sh_msiof_transfer_one(struct spi_master *master,
 		unsigned int l = 0;
 
 		if (tx_buf)
-			l = min(len, p->tx_fifo_size * 4);
+			l = min(round_down(len, 4), p->tx_fifo_size * 4);
 		if (rx_buf)
-			l = min(len, p->rx_fifo_size * 4);
+			l = min(round_down(len, 4), p->rx_fifo_size * 4);
 
 		if (bits <= 8) {
-			if (l & 3)
-				break;
 			copy32 = copy_bswap32;
 		} else if (bits <= 16) {
-			if (l & 3)
-				break;
 			copy32 = copy_wswap32;
 		} else {
 			copy32 = copy_plain32;
-- 
2.7.4

