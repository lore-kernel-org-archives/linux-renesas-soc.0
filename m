Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99789C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 08:59:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A97920657
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 08:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728848AbfAKI7K (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 03:59:10 -0500
Received: from www3345.sakura.ne.jp ([49.212.235.55]:64376 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbfAKI7K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 03:59:10 -0500
Received: from fsav103.sakura.ne.jp (fsav103.sakura.ne.jp [27.133.134.230])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x0B8x0C6080111;
        Fri, 11 Jan 2019 17:59:00 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav103.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav103.sakura.ne.jp);
 Fri, 11 Jan 2019 17:59:00 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav103.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x0B8ws1m080067
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 11 Jan 2019 17:59:00 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
From:   Nguyen An Hoan <na-hoan@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be
Cc:     magnus.damm@gmail.com, linux-spi@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: [PATCH 2/2] spi: sh-msiof: Use DMA if possible
Date:   Fri, 11 Jan 2019 17:58:29 +0900
Message-Id: <1547197109-637-2-git-send-email-na-hoan@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547197109-637-1-git-send-email-na-hoan@jinso.co.jp>
References: <1547197109-637-1-git-send-email-na-hoan@jinso.co.jp>
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
index 64adf34..241cc6e 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -937,17 +937,13 @@ static int sh_msiof_transfer_one(struct spi_master *master,
 		unsigned int l = 0;
 
 		if (tx_buf)
-			l = min(len, p->tx_fifo_size * 4);
+			l = min(len - len % 4, p->tx_fifo_size * 4);
 		if (rx_buf)
-			l = min(len, p->rx_fifo_size * 4);
+			l = min(len - len % 4, p->rx_fifo_size * 4);
 
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

