Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21ED9C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 13:11:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D43D2218AC
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 13:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549631505;
	bh=Qez7Othiz7gS2/VkkwfVqwDqYX6pNWm+3w0k49BYS/0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=WOYagINfbAaDXCTD1PEHIDnwSKFQpghTsKEQcvvMgC9W3OnmPYJvz9QZ8g2kz7VUD
	 D3S67dhPQamurnl8RhYkr4YTFqVRFMOk8un7mCWpmpBf2nzn4D6LLjsTlg5fn1sWLZ
	 q83N4migfVOBMugkR0/g7DVVLp/Eci8Twnursn4Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbfBHNLo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 08:11:44 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38842 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727703AbfBHNLn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 08:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=c6Y7WkOroTFYr0AqJQxX0Pn7JTMWzr7sY14WUOOSgXU=; b=ePQgDWMNvOCF
        V7BdZ7180/1ghPKgMwutp3EN7pDv+3fGjcgQ/XoQ9WoPZzPHdSckxR1fQ9FTJd3GDdTPbVFWSchUp
        GRHwGk46dlX2ONEFG8QlDApMTKUymAcXndDyJ5RMC44LdYv0StJJauBkxgQlK52oxjdsl1lairc91
        O2Ecg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1gs5wR-0001Kn-VK; Fri, 08 Feb 2019 13:11:40 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 8BFB91127F30; Fri,  8 Feb 2019 13:11:39 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Applied "spi: rspi: Replace spi_master by spi_controller" to the spi tree
In-Reply-To:  <20190208090909.739-2-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Message-Id: <20190208131139.8BFB91127F30@debutante.sirena.org.uk>
Date:   Fri,  8 Feb 2019 13:11:39 +0000 (GMT)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   spi: rspi: Replace spi_master by spi_controller

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

From 9428a073eb703de47e569607867eb9f2c3367270 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Fri, 8 Feb 2019 10:09:07 +0100
Subject: [PATCH] spi: rspi: Replace spi_master by spi_controller

As of commit 8caab75fd2c2a926 ('spi: Generalize SPI "master" to
"controller"'), the old master-centric names are compatibility wrappers
for the new controller-centric names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-rspi.c | 170 ++++++++++++++++++++---------------------
 1 file changed, 85 insertions(+), 85 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index a4ef641b5227..556870dcdf79 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -180,7 +180,7 @@
 struct rspi_data {
 	void __iomem *addr;
 	u32 max_speed_hz;
-	struct spi_master *master;
+	struct spi_controller *ctlr;
 	wait_queue_head_t wait;
 	struct clk *clk;
 	u16 spcmd;
@@ -237,8 +237,8 @@ static u16 rspi_read_data(const struct rspi_data *rspi)
 /* optional functions */
 struct spi_ops {
 	int (*set_config_register)(struct rspi_data *rspi, int access_size);
-	int (*transfer_one)(struct spi_master *master, struct spi_device *spi,
-			    struct spi_transfer *xfer);
+	int (*transfer_one)(struct spi_controller *ctlr,
+			    struct spi_device *spi, struct spi_transfer *xfer);
 	u16 mode_bits;
 	u16 flags;
 	u16 fifo_size;
@@ -466,7 +466,7 @@ static int rspi_data_out(struct rspi_data *rspi, u8 data)
 {
 	int error = rspi_wait_for_tx_empty(rspi);
 	if (error < 0) {
-		dev_err(&rspi->master->dev, "transmit timeout\n");
+		dev_err(&rspi->ctlr->dev, "transmit timeout\n");
 		return error;
 	}
 	rspi_write_data(rspi, data);
@@ -480,7 +480,7 @@ static int rspi_data_in(struct rspi_data *rspi)
 
 	error = rspi_wait_for_rx_full(rspi);
 	if (error < 0) {
-		dev_err(&rspi->master->dev, "receive timeout\n");
+		dev_err(&rspi->ctlr->dev, "receive timeout\n");
 		return error;
 	}
 	data = rspi_read_data(rspi);
@@ -526,8 +526,8 @@ static int rspi_dma_transfer(struct rspi_data *rspi, struct sg_table *tx,
 
 	/* First prepare and submit the DMA request(s), as this may fail */
 	if (rx) {
-		desc_rx = dmaengine_prep_slave_sg(rspi->master->dma_rx,
-					rx->sgl, rx->nents, DMA_DEV_TO_MEM,
+		desc_rx = dmaengine_prep_slave_sg(rspi->ctlr->dma_rx, rx->sgl,
+					rx->nents, DMA_DEV_TO_MEM,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 		if (!desc_rx) {
 			ret = -EAGAIN;
@@ -546,8 +546,8 @@ static int rspi_dma_transfer(struct rspi_data *rspi, struct sg_table *tx,
 	}
 
 	if (tx) {
-		desc_tx = dmaengine_prep_slave_sg(rspi->master->dma_tx,
-					tx->sgl, tx->nents, DMA_MEM_TO_DEV,
+		desc_tx = dmaengine_prep_slave_sg(rspi->ctlr->dma_tx, tx->sgl,
+					tx->nents, DMA_MEM_TO_DEV,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 		if (!desc_tx) {
 			ret = -EAGAIN;
@@ -584,9 +584,9 @@ static int rspi_dma_transfer(struct rspi_data *rspi, struct sg_table *tx,
 
 	/* Now start DMA */
 	if (rx)
-		dma_async_issue_pending(rspi->master->dma_rx);
+		dma_async_issue_pending(rspi->ctlr->dma_rx);
 	if (tx)
-		dma_async_issue_pending(rspi->master->dma_tx);
+		dma_async_issue_pending(rspi->ctlr->dma_tx);
 
 	ret = wait_event_interruptible_timeout(rspi->wait,
 					       rspi->dma_callbacked, HZ);
@@ -594,13 +594,13 @@ static int rspi_dma_transfer(struct rspi_data *rspi, struct sg_table *tx,
 		ret = 0;
 	} else {
 		if (!ret) {
-			dev_err(&rspi->master->dev, "DMA timeout\n");
+			dev_err(&rspi->ctlr->dev, "DMA timeout\n");
 			ret = -ETIMEDOUT;
 		}
 		if (tx)
-			dmaengine_terminate_all(rspi->master->dma_tx);
+			dmaengine_terminate_all(rspi->ctlr->dma_tx);
 		if (rx)
-			dmaengine_terminate_all(rspi->master->dma_rx);
+			dmaengine_terminate_all(rspi->ctlr->dma_rx);
 	}
 
 	rspi_disable_irq(rspi, irq_mask);
@@ -614,12 +614,12 @@ static int rspi_dma_transfer(struct rspi_data *rspi, struct sg_table *tx,
 
 no_dma_tx:
 	if (rx)
-		dmaengine_terminate_all(rspi->master->dma_rx);
+		dmaengine_terminate_all(rspi->ctlr->dma_rx);
 no_dma_rx:
 	if (ret == -EAGAIN) {
 		pr_warn_once("%s %s: DMA not available, falling back to PIO\n",
-			     dev_driver_string(&rspi->master->dev),
-			     dev_name(&rspi->master->dev));
+			     dev_driver_string(&rspi->ctlr->dev),
+			     dev_name(&rspi->ctlr->dev));
 	}
 	return ret;
 }
@@ -660,10 +660,10 @@ static bool __rspi_can_dma(const struct rspi_data *rspi,
 	return xfer->len > rspi->ops->fifo_size;
 }
 
-static bool rspi_can_dma(struct spi_master *master, struct spi_device *spi,
+static bool rspi_can_dma(struct spi_controller *ctlr, struct spi_device *spi,
 			 struct spi_transfer *xfer)
 {
-	struct rspi_data *rspi = spi_master_get_devdata(master);
+	struct rspi_data *rspi = spi_controller_get_devdata(ctlr);
 
 	return __rspi_can_dma(rspi, xfer);
 }
@@ -671,7 +671,7 @@ static bool rspi_can_dma(struct spi_master *master, struct spi_device *spi,
 static int rspi_dma_check_then_transfer(struct rspi_data *rspi,
 					 struct spi_transfer *xfer)
 {
-	if (!rspi->master->can_dma || !__rspi_can_dma(rspi, xfer))
+	if (!rspi->ctlr->can_dma || !__rspi_can_dma(rspi, xfer))
 		return -EAGAIN;
 
 	/* rx_buf can be NULL on RSPI on SH in TX-only Mode */
@@ -698,10 +698,10 @@ static int rspi_common_transfer(struct rspi_data *rspi,
 	return 0;
 }
 
-static int rspi_transfer_one(struct spi_master *master, struct spi_device *spi,
-			     struct spi_transfer *xfer)
+static int rspi_transfer_one(struct spi_controller *ctlr,
+			     struct spi_device *spi, struct spi_transfer *xfer)
 {
-	struct rspi_data *rspi = spi_master_get_devdata(master);
+	struct rspi_data *rspi = spi_controller_get_devdata(ctlr);
 	u8 spcr;
 
 	spcr = rspi_read8(rspi, RSPI_SPCR);
@@ -716,11 +716,11 @@ static int rspi_transfer_one(struct spi_master *master, struct spi_device *spi,
 	return rspi_common_transfer(rspi, xfer);
 }
 
-static int rspi_rz_transfer_one(struct spi_master *master,
+static int rspi_rz_transfer_one(struct spi_controller *ctlr,
 				struct spi_device *spi,
 				struct spi_transfer *xfer)
 {
-	struct rspi_data *rspi = spi_master_get_devdata(master);
+	struct rspi_data *rspi = spi_controller_get_devdata(ctlr);
 
 	rspi_rz_receive_init(rspi);
 
@@ -739,7 +739,7 @@ static int qspi_trigger_transfer_out_in(struct rspi_data *rspi, const u8 *tx,
 		if (n == QSPI_BUFFER_SIZE) {
 			ret = rspi_wait_for_tx_empty(rspi);
 			if (ret < 0) {
-				dev_err(&rspi->master->dev, "transmit timeout\n");
+				dev_err(&rspi->ctlr->dev, "transmit timeout\n");
 				return ret;
 			}
 			for (i = 0; i < n; i++)
@@ -747,7 +747,7 @@ static int qspi_trigger_transfer_out_in(struct rspi_data *rspi, const u8 *tx,
 
 			ret = rspi_wait_for_rx_full(rspi);
 			if (ret < 0) {
-				dev_err(&rspi->master->dev, "receive timeout\n");
+				dev_err(&rspi->ctlr->dev, "receive timeout\n");
 				return ret;
 			}
 			for (i = 0; i < n; i++)
@@ -785,7 +785,7 @@ static int qspi_transfer_out(struct rspi_data *rspi, struct spi_transfer *xfer)
 	unsigned int i, len;
 	int ret;
 
-	if (rspi->master->can_dma && __rspi_can_dma(rspi, xfer)) {
+	if (rspi->ctlr->can_dma && __rspi_can_dma(rspi, xfer)) {
 		ret = rspi_dma_transfer(rspi, &xfer->tx_sg, NULL);
 		if (ret != -EAGAIN)
 			return ret;
@@ -796,7 +796,7 @@ static int qspi_transfer_out(struct rspi_data *rspi, struct spi_transfer *xfer)
 		if (len == QSPI_BUFFER_SIZE) {
 			ret = rspi_wait_for_tx_empty(rspi);
 			if (ret < 0) {
-				dev_err(&rspi->master->dev, "transmit timeout\n");
+				dev_err(&rspi->ctlr->dev, "transmit timeout\n");
 				return ret;
 			}
 			for (i = 0; i < len; i++)
@@ -822,7 +822,7 @@ static int qspi_transfer_in(struct rspi_data *rspi, struct spi_transfer *xfer)
 	unsigned int i, len;
 	int ret;
 
-	if (rspi->master->can_dma && __rspi_can_dma(rspi, xfer)) {
+	if (rspi->ctlr->can_dma && __rspi_can_dma(rspi, xfer)) {
 		int ret = rspi_dma_transfer(rspi, NULL, &xfer->rx_sg);
 		if (ret != -EAGAIN)
 			return ret;
@@ -833,7 +833,7 @@ static int qspi_transfer_in(struct rspi_data *rspi, struct spi_transfer *xfer)
 		if (len == QSPI_BUFFER_SIZE) {
 			ret = rspi_wait_for_rx_full(rspi);
 			if (ret < 0) {
-				dev_err(&rspi->master->dev, "receive timeout\n");
+				dev_err(&rspi->ctlr->dev, "receive timeout\n");
 				return ret;
 			}
 			for (i = 0; i < len; i++)
@@ -849,10 +849,10 @@ static int qspi_transfer_in(struct rspi_data *rspi, struct spi_transfer *xfer)
 	return 0;
 }
 
-static int qspi_transfer_one(struct spi_master *master, struct spi_device *spi,
-			     struct spi_transfer *xfer)
+static int qspi_transfer_one(struct spi_controller *ctlr,
+			     struct spi_device *spi, struct spi_transfer *xfer)
 {
-	struct rspi_data *rspi = spi_master_get_devdata(master);
+	struct rspi_data *rspi = spi_controller_get_devdata(ctlr);
 
 	if (spi->mode & SPI_LOOP) {
 		return qspi_transfer_out_in(rspi, xfer);
@@ -870,7 +870,7 @@ static int qspi_transfer_one(struct spi_master *master, struct spi_device *spi,
 
 static int rspi_setup(struct spi_device *spi)
 {
-	struct rspi_data *rspi = spi_master_get_devdata(spi->master);
+	struct rspi_data *rspi = spi_controller_get_devdata(spi->controller);
 
 	rspi->max_speed_hz = spi->max_speed_hz;
 
@@ -955,10 +955,10 @@ static int qspi_setup_sequencer(struct rspi_data *rspi,
 	return 0;
 }
 
-static int rspi_prepare_message(struct spi_master *master,
+static int rspi_prepare_message(struct spi_controller *ctlr,
 				struct spi_message *msg)
 {
-	struct rspi_data *rspi = spi_master_get_devdata(master);
+	struct rspi_data *rspi = spi_controller_get_devdata(ctlr);
 	int ret;
 
 	if (msg->spi->mode &
@@ -974,10 +974,10 @@ static int rspi_prepare_message(struct spi_master *master,
 	return 0;
 }
 
-static int rspi_unprepare_message(struct spi_master *master,
+static int rspi_unprepare_message(struct spi_controller *ctlr,
 				  struct spi_message *msg)
 {
-	struct rspi_data *rspi = spi_master_get_devdata(master);
+	struct rspi_data *rspi = spi_controller_get_devdata(ctlr);
 
 	/* Disable SPI function */
 	rspi_write8(rspi, rspi_read8(rspi, RSPI_SPCR) & ~SPCR_SPE, RSPI_SPCR);
@@ -1081,7 +1081,7 @@ static struct dma_chan *rspi_request_dma_chan(struct device *dev,
 	return chan;
 }
 
-static int rspi_request_dma(struct device *dev, struct spi_master *master,
+static int rspi_request_dma(struct device *dev, struct spi_controller *ctlr,
 			    const struct resource *res)
 {
 	const struct rspi_plat_data *rspi_pd = dev_get_platdata(dev);
@@ -1099,37 +1099,37 @@ static int rspi_request_dma(struct device *dev, struct spi_master *master,
 		return 0;
 	}
 
-	master->dma_tx = rspi_request_dma_chan(dev, DMA_MEM_TO_DEV, dma_tx_id,
-					       res->start + RSPI_SPDR);
-	if (!master->dma_tx)
+	ctlr->dma_tx = rspi_request_dma_chan(dev, DMA_MEM_TO_DEV, dma_tx_id,
+					     res->start + RSPI_SPDR);
+	if (!ctlr->dma_tx)
 		return -ENODEV;
 
-	master->dma_rx = rspi_request_dma_chan(dev, DMA_DEV_TO_MEM, dma_rx_id,
-					       res->start + RSPI_SPDR);
-	if (!master->dma_rx) {
-		dma_release_channel(master->dma_tx);
-		master->dma_tx = NULL;
+	ctlr->dma_rx = rspi_request_dma_chan(dev, DMA_DEV_TO_MEM, dma_rx_id,
+					     res->start + RSPI_SPDR);
+	if (!ctlr->dma_rx) {
+		dma_release_channel(ctlr->dma_tx);
+		ctlr->dma_tx = NULL;
 		return -ENODEV;
 	}
 
-	master->can_dma = rspi_can_dma;
+	ctlr->can_dma = rspi_can_dma;
 	dev_info(dev, "DMA available");
 	return 0;
 }
 
-static void rspi_release_dma(struct spi_master *master)
+static void rspi_release_dma(struct spi_controller *ctlr)
 {
-	if (master->dma_tx)
-		dma_release_channel(master->dma_tx);
-	if (master->dma_rx)
-		dma_release_channel(master->dma_rx);
+	if (ctlr->dma_tx)
+		dma_release_channel(ctlr->dma_tx);
+	if (ctlr->dma_rx)
+		dma_release_channel(ctlr->dma_rx);
 }
 
 static int rspi_remove(struct platform_device *pdev)
 {
 	struct rspi_data *rspi = platform_get_drvdata(pdev);
 
-	rspi_release_dma(rspi->master);
+	rspi_release_dma(rspi->ctlr);
 	pm_runtime_disable(&pdev->dev);
 
 	return 0;
@@ -1139,7 +1139,7 @@ static const struct spi_ops rspi_ops = {
 	.set_config_register =	rspi_set_config_register,
 	.transfer_one =		rspi_transfer_one,
 	.mode_bits =		SPI_CPHA | SPI_CPOL | SPI_LOOP,
-	.flags =		SPI_MASTER_MUST_TX,
+	.flags =		SPI_CONTROLLER_MUST_TX,
 	.fifo_size =		8,
 };
 
@@ -1147,7 +1147,7 @@ static const struct spi_ops rspi_rz_ops = {
 	.set_config_register =	rspi_rz_set_config_register,
 	.transfer_one =		rspi_rz_transfer_one,
 	.mode_bits =		SPI_CPHA | SPI_CPOL | SPI_LOOP,
-	.flags =		SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX,
+	.flags =		SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX,
 	.fifo_size =		8,	/* 8 for TX, 32 for RX */
 };
 
@@ -1157,7 +1157,7 @@ static const struct spi_ops qspi_ops = {
 	.mode_bits =		SPI_CPHA | SPI_CPOL | SPI_LOOP |
 				SPI_TX_DUAL | SPI_TX_QUAD |
 				SPI_RX_DUAL | SPI_RX_QUAD,
-	.flags =		SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX,
+	.flags =		SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX,
 	.fifo_size =		32,
 };
 
@@ -1174,7 +1174,7 @@ static const struct of_device_id rspi_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, rspi_of_match);
 
-static int rspi_parse_dt(struct device *dev, struct spi_master *master)
+static int rspi_parse_dt(struct device *dev, struct spi_controller *ctlr)
 {
 	u32 num_cs;
 	int error;
@@ -1186,12 +1186,12 @@ static int rspi_parse_dt(struct device *dev, struct spi_master *master)
 		return error;
 	}
 
-	master->num_chipselect = num_cs;
+	ctlr->num_chipselect = num_cs;
 	return 0;
 }
 #else
 #define rspi_of_match	NULL
-static inline int rspi_parse_dt(struct device *dev, struct spi_master *master)
+static inline int rspi_parse_dt(struct device *dev, struct spi_controller *ctlr)
 {
 	return -EINVAL;
 }
@@ -1212,28 +1212,28 @@ static int rspi_request_irq(struct device *dev, unsigned int irq,
 static int rspi_probe(struct platform_device *pdev)
 {
 	struct resource *res;
-	struct spi_master *master;
+	struct spi_controller *ctlr;
 	struct rspi_data *rspi;
 	int ret;
 	const struct rspi_plat_data *rspi_pd;
 	const struct spi_ops *ops;
 
-	master = spi_alloc_master(&pdev->dev, sizeof(struct rspi_data));
-	if (master == NULL)
+	ctlr = spi_alloc_master(&pdev->dev, sizeof(struct rspi_data));
+	if (ctlr == NULL)
 		return -ENOMEM;
 
 	ops = of_device_get_match_data(&pdev->dev);
 	if (ops) {
-		ret = rspi_parse_dt(&pdev->dev, master);
+		ret = rspi_parse_dt(&pdev->dev, ctlr);
 		if (ret)
 			goto error1;
 	} else {
 		ops = (struct spi_ops *)pdev->id_entry->driver_data;
 		rspi_pd = dev_get_platdata(&pdev->dev);
 		if (rspi_pd && rspi_pd->num_chipselect)
-			master->num_chipselect = rspi_pd->num_chipselect;
+			ctlr->num_chipselect = rspi_pd->num_chipselect;
 		else
-			master->num_chipselect = 2; /* default */
+			ctlr->num_chipselect = 2; /* default */
 	}
 
 	/* ops parameter check */
@@ -1243,10 +1243,10 @@ static int rspi_probe(struct platform_device *pdev)
 		goto error1;
 	}
 
-	rspi = spi_master_get_devdata(master);
+	rspi = spi_controller_get_devdata(ctlr);
 	platform_set_drvdata(pdev, rspi);
 	rspi->ops = ops;
-	rspi->master = master;
+	rspi->ctlr = ctlr;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	rspi->addr = devm_ioremap_resource(&pdev->dev, res);
@@ -1266,15 +1266,15 @@ static int rspi_probe(struct platform_device *pdev)
 
 	init_waitqueue_head(&rspi->wait);
 
-	master->bus_num = pdev->id;
-	master->setup = rspi_setup;
-	master->auto_runtime_pm = true;
-	master->transfer_one = ops->transfer_one;
-	master->prepare_message = rspi_prepare_message;
-	master->unprepare_message = rspi_unprepare_message;
-	master->mode_bits = ops->mode_bits;
-	master->flags = ops->flags;
-	master->dev.of_node = pdev->dev.of_node;
+	ctlr->bus_num = pdev->id;
+	ctlr->setup = rspi_setup;
+	ctlr->auto_runtime_pm = true;
+	ctlr->transfer_one = ops->transfer_one;
+	ctlr->prepare_message = rspi_prepare_message;
+	ctlr->unprepare_message = rspi_unprepare_message;
+	ctlr->mode_bits = ops->mode_bits;
+	ctlr->flags = ops->flags;
+	ctlr->dev.of_node = pdev->dev.of_node;
 
 	ret = platform_get_irq_byname(pdev, "rx");
 	if (ret < 0) {
@@ -1311,13 +1311,13 @@ static int rspi_probe(struct platform_device *pdev)
 		goto error2;
 	}
 
-	ret = rspi_request_dma(&pdev->dev, master, res);
+	ret = rspi_request_dma(&pdev->dev, ctlr, res);
 	if (ret < 0)
 		dev_warn(&pdev->dev, "DMA not available, using PIO\n");
 
-	ret = devm_spi_register_master(&pdev->dev, master);
+	ret = devm_spi_register_controller(&pdev->dev, ctlr);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "spi_register_master error.\n");
+		dev_err(&pdev->dev, "devm_spi_register_controller error.\n");
 		goto error3;
 	}
 
@@ -1326,11 +1326,11 @@ static int rspi_probe(struct platform_device *pdev)
 	return 0;
 
 error3:
-	rspi_release_dma(master);
+	rspi_release_dma(ctlr);
 error2:
 	pm_runtime_disable(&pdev->dev);
 error1:
-	spi_master_put(master);
+	spi_controller_put(ctlr);
 
 	return ret;
 }
@@ -1349,14 +1349,14 @@ static int rspi_suspend(struct device *dev)
 {
 	struct rspi_data *rspi = dev_get_drvdata(dev);
 
-	return spi_master_suspend(rspi->master);
+	return spi_controller_suspend(rspi->ctlr);
 }
 
 static int rspi_resume(struct device *dev)
 {
 	struct rspi_data *rspi = dev_get_drvdata(dev);
 
-	return spi_master_resume(rspi->master);
+	return spi_controller_resume(rspi->ctlr);
 }
 
 static SIMPLE_DEV_PM_OPS(rspi_pm_ops, rspi_suspend, rspi_resume);
-- 
2.20.1

