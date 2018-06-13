Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:56704 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934409AbeFMIlV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 04:41:21 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>
Cc: Ryo Kataoka <ryo.kataoka.wt@renesas.com>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] spi: sh-msiof: Make sure all DMA operations have completed
Date: Wed, 13 Jun 2018 10:41:15 +0200
Message-Id: <1528879276-5179-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In case of a bi-directional transfer, receive DMA may complete in the
rcar-dmac driver before transmit DMA, due to scheduling latencies.
As the MSIOF driver waits for completion of the receive DMA only, it may
submit the next transmit DMA request before the previous one has
completed.

Make the driver more robust by waiting for the completion of both
receive and transmit DMA, when applicable.

Based on a patch in the BSP by Ryo Kataoka.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Completion inversion can be forced by adding

    if (chan->mid_rid == 0x55 || chan->mid_rid == 0x45) msleep(500);

to the top of rcar_dmac_isr_channel_thread()
(0x55 for MSIOF1 on R-Car Gen2, 0x45 for MSIOF2 on R-Car Gen3).
---
 drivers/spi/spi-sh-msiof.c | 53 +++++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 09c04c1b7d0b5a15..17097366f8333173 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -49,6 +49,7 @@ struct sh_msiof_spi_priv {
 	struct platform_device *pdev;
 	struct sh_msiof_spi_info *info;
 	struct completion done;
+	struct completion done_txdma;
 	unsigned int tx_fifo_size;
 	unsigned int rx_fifo_size;
 	unsigned int min_div_pow;
@@ -649,19 +650,21 @@ static int sh_msiof_slave_abort(struct spi_master *master)
 
 	p->slave_aborted = true;
 	complete(&p->done);
+	complete(&p->done_txdma);
 	return 0;
 }
 
-static int sh_msiof_wait_for_completion(struct sh_msiof_spi_priv *p)
+static int sh_msiof_wait_for_completion(struct sh_msiof_spi_priv *p,
+					struct completion *x)
 {
 	if (spi_controller_is_slave(p->master)) {
-		if (wait_for_completion_interruptible(&p->done) ||
+		if (wait_for_completion_interruptible(x) ||
 		    p->slave_aborted) {
 			dev_dbg(&p->pdev->dev, "interrupted\n");
 			return -EINTR;
 		}
 	} else {
-		if (!wait_for_completion_timeout(&p->done, HZ)) {
+		if (!wait_for_completion_timeout(x, HZ)) {
 			dev_err(&p->pdev->dev, "timeout\n");
 			return -ETIMEDOUT;
 		}
@@ -711,7 +714,7 @@ static int sh_msiof_spi_txrx_once(struct sh_msiof_spi_priv *p,
 	}
 
 	/* wait for tx fifo to be emptied / rx fifo to be filled */
-	ret = sh_msiof_wait_for_completion(p);
+	ret = sh_msiof_wait_for_completion(p, &p->done);
 	if (ret)
 		goto stop_reset;
 
@@ -740,10 +743,7 @@ static int sh_msiof_spi_txrx_once(struct sh_msiof_spi_priv *p,
 
 static void sh_msiof_dma_complete(void *arg)
 {
-	struct sh_msiof_spi_priv *p = arg;
-
-	sh_msiof_write(p, IER, 0);
-	complete(&p->done);
+	complete(arg);
 }
 
 static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
@@ -764,7 +764,7 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 			return -EAGAIN;
 
 		desc_rx->callback = sh_msiof_dma_complete;
-		desc_rx->callback_param = p;
+		desc_rx->callback_param = &p->done;
 		cookie = dmaengine_submit(desc_rx);
 		if (dma_submit_error(cookie))
 			return cookie;
@@ -782,13 +782,8 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 			goto no_dma_tx;
 		}
 
-		if (rx) {
-			/* No callback */
-			desc_tx->callback = NULL;
-		} else {
-			desc_tx->callback = sh_msiof_dma_complete;
-			desc_tx->callback_param = p;
-		}
+		desc_tx->callback = sh_msiof_dma_complete;
+		desc_tx->callback_param = &p->done_txdma;
 		cookie = dmaengine_submit(desc_tx);
 		if (dma_submit_error(cookie)) {
 			ret = cookie;
@@ -805,6 +800,8 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 	sh_msiof_write(p, IER, ier_bits);
 
 	reinit_completion(&p->done);
+	if (tx)
+		reinit_completion(&p->done_txdma);
 	p->slave_aborted = false;
 
 	/* Now start DMA */
@@ -819,17 +816,24 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 		goto stop_dma;
 	}
 
-	/* wait for tx/rx DMA completion */
-	ret = sh_msiof_wait_for_completion(p);
-	if (ret)
-		goto stop_reset;
+	if (tx) {
+		/* wait for tx DMA completion */
+		ret = sh_msiof_wait_for_completion(p, &p->done_txdma);
+		if (ret)
+			goto stop_reset;
+	}
 
-	if (!rx) {
-		reinit_completion(&p->done);
-		sh_msiof_write(p, IER, IER_TEOFE);
+	if (rx) {
+		/* wait for rx DMA completion */
+		ret = sh_msiof_wait_for_completion(p, &p->done);
+		if (ret)
+			goto stop_reset;
 
+		sh_msiof_write(p, IER, 0);
+	} else {
 		/* wait for tx fifo to be emptied */
-		ret = sh_msiof_wait_for_completion(p);
+		sh_msiof_write(p, IER, IER_TEOFE);
+		ret = sh_msiof_wait_for_completion(p, &p->done);
 		if (ret)
 			goto stop_reset;
 	}
@@ -1327,6 +1331,7 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
 	p->min_div_pow = chipdata->min_div_pow;
 
 	init_completion(&p->done);
+	init_completion(&p->done_txdma);
 
 	p->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(p->clk)) {
-- 
2.7.4
