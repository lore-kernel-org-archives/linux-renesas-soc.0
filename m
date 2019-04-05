Return-Path: <SRS0=/r1Q=SH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F2DC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 05:59:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 009E6206DD
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 05:59:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbfDEF70 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 5 Apr 2019 01:59:26 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:11208 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbfDEF70 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Apr 2019 01:59:26 -0400
Received: from fsav103.sakura.ne.jp (fsav103.sakura.ne.jp [27.133.134.230])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x355xIZ8082856;
        Fri, 5 Apr 2019 14:59:18 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav103.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav103.sakura.ne.jp);
 Fri, 05 Apr 2019 14:59:18 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav103.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x355xDdM082790
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Apr 2019 14:59:18 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
From:   Nguyen An Hoan <na-hoan@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be
Cc:     linux-spi@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
Subject: [PATCH] spi: rspi: Fix handling of QSPI code when transmit and receive
Date:   Fri,  5 Apr 2019 14:59:13 +0900
Message-Id: <1554443953-30588-1-git-send-email-na-hoan@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Process handling QSPI when transmit/receive at qspi_trigger_transfer_out_in() as follows:
Setting the trigger, is the number of bytes in the FIFO buffer to determine
when there is an interrupt. Then check if the value of triggering number is
32bits (4 bytes) or 1bytes, there will be corresponding processing
(if (n == QSPI_BUFFER_SIZE statement))
Handling (if (n == QSPI_BUFFER_SIZE) esle) this is unnecessary, we only need to
calculate triggering number to reduce the number of interrupts that occur
if the data is larger than 32 bits (4bytes), while the transfer to handle
that call to rspi_pio_transfer() is not necessary. The code will become
confusing and difficult to read.
The same with handling in qspi_transfer_out()/qspi_transfer_in().

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/spi/spi-rspi.c | 71 ++++++++++++++++++++------------------------------
 1 file changed, 28 insertions(+), 43 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index 3be8fbe..15f5723 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -739,27 +739,22 @@ static int qspi_trigger_transfer_out_in(struct rspi_data *rspi, const u8 *tx,
 	while (len > 0) {
 		n = qspi_set_send_trigger(rspi, len);
 		qspi_set_receive_trigger(rspi, len);
-		if (n == QSPI_BUFFER_SIZE) {
-			ret = rspi_wait_for_tx_empty(rspi);
-			if (ret < 0) {
-				dev_err(&rspi->ctlr->dev, "transmit timeout\n");
-				return ret;
-			}
-			for (i = 0; i < n; i++)
-				rspi_write_data(rspi, *tx++);
+		ret = rspi_wait_for_tx_empty(rspi);
+		if (ret < 0) {
+			dev_err(&rspi->ctlr->dev, "transmit timeout\n");
+			return ret;
+		}
+		for (i = 0; i < n; i++)
+			rspi_write_data(rspi, *tx++);
 
-			ret = rspi_wait_for_rx_full(rspi);
-			if (ret < 0) {
-				dev_err(&rspi->ctlr->dev, "receive timeout\n");
-				return ret;
-			}
-			for (i = 0; i < n; i++)
-				*rx++ = rspi_read_data(rspi);
-		} else {
-			ret = rspi_pio_transfer(rspi, tx, rx, n);
-			if (ret < 0)
-				return ret;
+		ret = rspi_wait_for_rx_full(rspi);
+		if (ret < 0) {
+			dev_err(&rspi->ctlr->dev, "receive timeout\n");
+			return ret;
 		}
+		for (i = 0; i < n; i++)
+			*rx++ = rspi_read_data(rspi);
+
 		len -= n;
 	}
 
@@ -796,19 +791,14 @@ static int qspi_transfer_out(struct rspi_data *rspi, struct spi_transfer *xfer)
 
 	while (n > 0) {
 		len = qspi_set_send_trigger(rspi, n);
-		if (len == QSPI_BUFFER_SIZE) {
-			ret = rspi_wait_for_tx_empty(rspi);
-			if (ret < 0) {
-				dev_err(&rspi->ctlr->dev, "transmit timeout\n");
-				return ret;
-			}
-			for (i = 0; i < len; i++)
-				rspi_write_data(rspi, *tx++);
-		} else {
-			ret = rspi_pio_transfer(rspi, tx, NULL, len);
-			if (ret < 0)
-				return ret;
+		ret = rspi_wait_for_tx_empty(rspi);
+		if (ret < 0) {
+			dev_err(&rspi->ctlr->dev, "transmit timeout\n");
+			return ret;
 		}
+		for (i = 0; i < len; i++)
+			rspi_write_data(rspi, *tx++);
+
 		n -= len;
 	}
 
@@ -833,19 +823,14 @@ static int qspi_transfer_in(struct rspi_data *rspi, struct spi_transfer *xfer)
 
 	while (n > 0) {
 		len = qspi_set_receive_trigger(rspi, n);
-		if (len == QSPI_BUFFER_SIZE) {
-			ret = rspi_wait_for_rx_full(rspi);
-			if (ret < 0) {
-				dev_err(&rspi->ctlr->dev, "receive timeout\n");
-				return ret;
-			}
-			for (i = 0; i < len; i++)
-				*rx++ = rspi_read_data(rspi);
-		} else {
-			ret = rspi_pio_transfer(rspi, NULL, rx, len);
-			if (ret < 0)
-				return ret;
+		ret = rspi_wait_for_rx_full(rspi);
+		if (ret < 0) {
+			dev_err(&rspi->ctlr->dev, "receive timeout\n");
+			return ret;
 		}
+		for (i = 0; i < len; i++)
+			*rx++ = rspi_read_data(rspi);
+
 		n -= len;
 	}
 
-- 
2.7.4

