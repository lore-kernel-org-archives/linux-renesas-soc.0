Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47448 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933575AbeFRMBT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jun 2018 08:01:19 -0400
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        Ryo Kataoka <ryo.kataoka.wt@renesas.com>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: Make sure all DMA operations have completed" to the spi tree
In-Reply-To: <1528879276-5179-1-git-send-email-geert+renesas@glider.be>
Message-Id: <E1fUsqR-0000dD-TH@debutante>
Date: Mon, 18 Jun 2018 13:01:15 +0100
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   spi: sh-msiof: Make sure all DMA operations have completed

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 08ba7ae35b15cd13b965d5fd5a835e0a0cb803e6 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Wed, 13 Jun 2018 10:41:15 +0200
Subject: [PATCH] spi: sh-msiof: Make sure all DMA operations have completed

In case of a bi-directional transfer, receive DMA may complete in the
rcar-dmac driver before transmit DMA, due to scheduling latencies.
As the MSIOF driver waits for completion of the receive DMA only, it may
submit the next transmit DMA request before the previous one has
completed.

Make the driver more robust by waiting for the completion of both
receive and transmit DMA, when applicable.

Based on a patch in the BSP by Ryo Kataoka.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-msiof.c | 53 +++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 0e74cbf9929d..539d6d1a277a 100644
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
2.17.1
