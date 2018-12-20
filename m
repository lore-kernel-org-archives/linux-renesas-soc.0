Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E484C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 08:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 34D5B21741
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 08:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbeLTIsu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 03:48:50 -0500
Received: from www3345.sakura.ne.jp ([49.212.235.55]:11551 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbeLTIsu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 03:48:50 -0500
Received: from fsav108.sakura.ne.jp (fsav108.sakura.ne.jp [27.133.134.235])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id wBK8mmFp003878;
        Thu, 20 Dec 2018 17:48:48 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav108.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav108.sakura.ne.jp);
 Thu, 20 Dec 2018 17:48:48 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav108.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id wBK8mgno003851
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 20 Dec 2018 17:48:47 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
From:   Nguyen An Hoan <na-hoan@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: [v1 PATCH] spi: sh-msiof: Reduce the number of times write to and perform the transmission from FIFO
Date:   Thu, 20 Dec 2018 17:48:42 +0900
Message-Id: <1545295722-9554-1-git-send-email-na-hoan@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

The current state of the spi-sh-msiof, in master transfer mode: if t-> bits_per_word <= 8,
if the data length is divisible by 4 ((len & 3) = 0), the length of each word will be 32 bits
In case of data length can not be divisible by 4 ((len & 3) != 0), always set each word to be
8 bits, this will increase the number of times that write to FIFO, increasing the number of
times it should be transmitted. Assume that the number of bytes of data length more than 64 bytes,
each transmission will write 64 times into the TFDR then transmit, a maximum one-time
transmission will transmit 64 bytes if each word is 8 bits long.

Switch to setting if t->bits_per_word <= 8, the word length will be 32 bits although the data
length is not divisible by 4, then if leftover, will transmit the balance and the length of each
words is 1 byte. The maximum each can transmit up to 64 x 4 (Data Size = 32 bits (4 bytes)) = 256 bytes.
TMDR2 : Bits 28 to 24  BITLEN1[4:0] Data Size (8 to 32 bits)
        Bits 23 to 16  WDLEN1[7:0]  Word Count (1 to 64 words)

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/spi/spi-sh-msiof.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index d495d86..d14b407 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -977,7 +977,7 @@ static int sh_msiof_transfer_one(struct spi_master *master,
 			return 0;
 	}
 
-	if (bits <= 8 && len > 15 && !(len & 3)) {
+	if (bits <= 8 && len > 15) {
 		bits = 32;
 		swab = true;
 	} else {
@@ -1038,6 +1038,14 @@ static int sh_msiof_transfer_one(struct spi_master *master,
 		if (rx_buf)
 			rx_buf += n * bytes_per_word;
 		words -= n;
+
+		if (words == 0 && (len % bytes_per_word)) {
+			words = len % bytes_per_word;
+			bits = t->bits_per_word;
+			bytes_per_word = 1;
+			tx_fifo = sh_msiof_spi_write_fifo_8;
+			rx_fifo = sh_msiof_spi_read_fifo_8;
+		}
 	}
 
 	return 0;
-- 
2.7.4

