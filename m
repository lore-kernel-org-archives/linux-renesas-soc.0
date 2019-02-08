Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1158C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 09:09:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 677612147C
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 09:09:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbfBHJJT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 04:09:19 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:33162 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbfBHJJR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 04:09:17 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id a99A1z0173XaVaC0699AXQ; Fri, 08 Feb 2019 10:09:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gs29m-0004Iz-Sn; Fri, 08 Feb 2019 10:09:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gs29m-0000D1-Pp; Fri, 08 Feb 2019 10:09:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] spi: sh-msiof: Replace spi_master by spi_controller
Date:   Fri,  8 Feb 2019 10:09:09 +0100
Message-Id: <20190208090909.739-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190208090909.739-1-geert+renesas@glider.be>
References: <20190208090909.739-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As of commit 8caab75fd2c2a926 ('spi: Generalize SPI "master" to
"controller"'), the old master-centric names are compatibility wrappers
for the new controller-centric names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/spi-sh-msiof.c | 168 ++++++++++++++++++-------------------
 1 file changed, 83 insertions(+), 85 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 617cdf3be0509938..b20e70a2bdd115d7 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * SuperH MSIOF SPI Master Interface
+ * SuperH MSIOF SPI Controller Interface
  *
  * Copyright (c) 2009 Magnus Damm
  * Copyright (C) 2014 Renesas Electronics Corporation
@@ -34,12 +34,12 @@
 struct sh_msiof_chipdata {
 	u16 tx_fifo_size;
 	u16 rx_fifo_size;
-	u16 master_flags;
+	u16 ctlr_flags;
 	u16 min_div_pow;
 };
 
 struct sh_msiof_spi_priv {
-	struct spi_master *master;
+	struct spi_controller *ctlr;
 	void __iomem *mapbase;
 	struct clk *clk;
 	struct platform_device *pdev;
@@ -287,7 +287,7 @@ static void sh_msiof_spi_set_clk_regs(struct sh_msiof_spi_priv *p,
 
 	scr = sh_msiof_spi_div_array[div_pow] | SCR_BRPS(brps);
 	sh_msiof_write(p, TSCR, scr);
-	if (!(p->master->flags & SPI_MASTER_MUST_TX))
+	if (!(p->ctlr->flags & SPI_CONTROLLER_MUST_TX))
 		sh_msiof_write(p, RSCR, scr);
 }
 
@@ -351,14 +351,14 @@ static void sh_msiof_spi_set_pin_regs(struct sh_msiof_spi_priv *p, u32 ss,
 	tmp |= !cs_high << MDR1_SYNCAC_SHIFT;
 	tmp |= lsb_first << MDR1_BITLSB_SHIFT;
 	tmp |= sh_msiof_spi_get_dtdl_and_syncdl(p);
-	if (spi_controller_is_slave(p->master)) {
+	if (spi_controller_is_slave(p->ctlr)) {
 		sh_msiof_write(p, TMDR1, tmp | TMDR1_PCON);
 	} else {
 		sh_msiof_write(p, TMDR1,
 			       tmp | MDR1_TRMD | TMDR1_PCON |
 			       (ss < MAX_SS ? ss : 0) << TMDR1_SYNCCH_SHIFT);
 	}
-	if (p->master->flags & SPI_MASTER_MUST_TX) {
+	if (p->ctlr->flags & SPI_CONTROLLER_MUST_TX) {
 		/* These bits are reserved if RX needs TX */
 		tmp &= ~0x0000ffff;
 	}
@@ -382,7 +382,7 @@ static void sh_msiof_spi_set_mode_regs(struct sh_msiof_spi_priv *p,
 {
 	u32 dr2 = MDR2_BITLEN1(bits) | MDR2_WDLEN1(words);
 
-	if (tx_buf || (p->master->flags & SPI_MASTER_MUST_TX))
+	if (tx_buf || (p->ctlr->flags & SPI_CONTROLLER_MUST_TX))
 		sh_msiof_write(p, TMDR2, dr2);
 	else
 		sh_msiof_write(p, TMDR2, dr2 | MDR2_GRPMASK1);
@@ -539,8 +539,9 @@ static void sh_msiof_spi_read_fifo_s32u(struct sh_msiof_spi_priv *p,
 
 static int sh_msiof_spi_setup(struct spi_device *spi)
 {
-	struct device_node	*np = spi->master->dev.of_node;
-	struct sh_msiof_spi_priv *p = spi_master_get_devdata(spi->master);
+	struct device_node *np = spi->controller->dev.of_node;
+	struct sh_msiof_spi_priv *p =
+		spi_controller_get_devdata(spi->controller);
 	u32 clr, set, tmp;
 
 	if (!np) {
@@ -556,7 +557,7 @@ static int sh_msiof_spi_setup(struct spi_device *spi)
 		return 0;
 	}
 
-	if (spi_controller_is_slave(p->master))
+	if (spi_controller_is_slave(p->ctlr))
 		return 0;
 
 	if (p->native_cs_inited &&
@@ -581,10 +582,10 @@ static int sh_msiof_spi_setup(struct spi_device *spi)
 	return 0;
 }
 
-static int sh_msiof_prepare_message(struct spi_master *master,
+static int sh_msiof_prepare_message(struct spi_controller *ctlr,
 				    struct spi_message *msg)
 {
-	struct sh_msiof_spi_priv *p = spi_master_get_devdata(master);
+	struct sh_msiof_spi_priv *p = spi_controller_get_devdata(ctlr);
 	const struct spi_device *spi = msg->spi;
 	u32 ss, cs_high;
 
@@ -605,7 +606,7 @@ static int sh_msiof_prepare_message(struct spi_master *master,
 
 static int sh_msiof_spi_start(struct sh_msiof_spi_priv *p, void *rx_buf)
 {
-	bool slave = spi_controller_is_slave(p->master);
+	bool slave = spi_controller_is_slave(p->ctlr);
 	int ret = 0;
 
 	/* setup clock and rx/tx signals */
@@ -625,7 +626,7 @@ static int sh_msiof_spi_start(struct sh_msiof_spi_priv *p, void *rx_buf)
 
 static int sh_msiof_spi_stop(struct sh_msiof_spi_priv *p, void *rx_buf)
 {
-	bool slave = spi_controller_is_slave(p->master);
+	bool slave = spi_controller_is_slave(p->ctlr);
 	int ret = 0;
 
 	/* shut down frame, rx/tx and clock signals */
@@ -641,9 +642,9 @@ static int sh_msiof_spi_stop(struct sh_msiof_spi_priv *p, void *rx_buf)
 	return ret;
 }
 
-static int sh_msiof_slave_abort(struct spi_master *master)
+static int sh_msiof_slave_abort(struct spi_controller *ctlr)
 {
-	struct sh_msiof_spi_priv *p = spi_master_get_devdata(master);
+	struct sh_msiof_spi_priv *p = spi_controller_get_devdata(ctlr);
 
 	p->slave_aborted = true;
 	complete(&p->done);
@@ -654,7 +655,7 @@ static int sh_msiof_slave_abort(struct spi_master *master)
 static int sh_msiof_wait_for_completion(struct sh_msiof_spi_priv *p,
 					struct completion *x)
 {
-	if (spi_controller_is_slave(p->master)) {
+	if (spi_controller_is_slave(p->ctlr)) {
 		if (wait_for_completion_interruptible(x) ||
 		    p->slave_aborted) {
 			dev_dbg(&p->pdev->dev, "interrupted\n");
@@ -754,7 +755,7 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 	/* First prepare and submit the DMA request(s), as this may fail */
 	if (rx) {
 		ier_bits |= IER_RDREQE | IER_RDMAE;
-		desc_rx = dmaengine_prep_slave_single(p->master->dma_rx,
+		desc_rx = dmaengine_prep_slave_single(p->ctlr->dma_rx,
 					p->rx_dma_addr, len, DMA_DEV_TO_MEM,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 		if (!desc_rx)
@@ -769,9 +770,9 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 
 	if (tx) {
 		ier_bits |= IER_TDREQE | IER_TDMAE;
-		dma_sync_single_for_device(p->master->dma_tx->device->dev,
+		dma_sync_single_for_device(p->ctlr->dma_tx->device->dev,
 					   p->tx_dma_addr, len, DMA_TO_DEVICE);
-		desc_tx = dmaengine_prep_slave_single(p->master->dma_tx,
+		desc_tx = dmaengine_prep_slave_single(p->ctlr->dma_tx,
 					p->tx_dma_addr, len, DMA_MEM_TO_DEV,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 		if (!desc_tx) {
@@ -803,9 +804,9 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 
 	/* Now start DMA */
 	if (rx)
-		dma_async_issue_pending(p->master->dma_rx);
+		dma_async_issue_pending(p->ctlr->dma_rx);
 	if (tx)
-		dma_async_issue_pending(p->master->dma_tx);
+		dma_async_issue_pending(p->ctlr->dma_tx);
 
 	ret = sh_msiof_spi_start(p, rx);
 	if (ret) {
@@ -845,9 +846,8 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 	}
 
 	if (rx)
-		dma_sync_single_for_cpu(p->master->dma_rx->device->dev,
-					p->rx_dma_addr, len,
-					DMA_FROM_DEVICE);
+		dma_sync_single_for_cpu(p->ctlr->dma_rx->device->dev,
+					p->rx_dma_addr, len, DMA_FROM_DEVICE);
 
 	return 0;
 
@@ -856,10 +856,10 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 	sh_msiof_spi_stop(p, rx);
 stop_dma:
 	if (tx)
-		dmaengine_terminate_all(p->master->dma_tx);
+		dmaengine_terminate_all(p->ctlr->dma_tx);
 no_dma_tx:
 	if (rx)
-		dmaengine_terminate_all(p->master->dma_rx);
+		dmaengine_terminate_all(p->ctlr->dma_rx);
 	sh_msiof_write(p, IER, 0);
 	return ret;
 }
@@ -907,11 +907,11 @@ static void copy_plain32(u32 *dst, const u32 *src, unsigned int words)
 	memcpy(dst, src, words * 4);
 }
 
-static int sh_msiof_transfer_one(struct spi_master *master,
+static int sh_msiof_transfer_one(struct spi_controller *ctlr,
 				 struct spi_device *spi,
 				 struct spi_transfer *t)
 {
-	struct sh_msiof_spi_priv *p = spi_master_get_devdata(master);
+	struct sh_msiof_spi_priv *p = spi_controller_get_devdata(ctlr);
 	void (*copy32)(u32 *, const u32 *, unsigned int);
 	void (*tx_fifo)(struct sh_msiof_spi_priv *, const void *, int, int);
 	void (*rx_fifo)(struct sh_msiof_spi_priv *, void *, int, int);
@@ -926,10 +926,10 @@ static int sh_msiof_transfer_one(struct spi_master *master,
 	int ret;
 
 	/* setup clocks (clock already enabled in chipselect()) */
-	if (!spi_controller_is_slave(p->master))
+	if (!spi_controller_is_slave(p->ctlr))
 		sh_msiof_spi_set_clk_regs(p, clk_get_rate(p->clk), t->speed_hz);
 
-	while (master->dma_tx && len > 15) {
+	while (ctlr->dma_tx && len > 15) {
 		/*
 		 *  DMA supports 32-bit words only, hence pack 8-bit and 16-bit
 		 *  words, with byte resp. word swapping.
@@ -1050,21 +1050,21 @@ static int sh_msiof_transfer_one(struct spi_master *master,
 static const struct sh_msiof_chipdata sh_data = {
 	.tx_fifo_size = 64,
 	.rx_fifo_size = 64,
-	.master_flags = 0,
+	.ctlr_flags = 0,
 	.min_div_pow = 0,
 };
 
 static const struct sh_msiof_chipdata rcar_gen2_data = {
 	.tx_fifo_size = 64,
 	.rx_fifo_size = 64,
-	.master_flags = SPI_MASTER_MUST_TX,
+	.ctlr_flags = SPI_CONTROLLER_MUST_TX,
 	.min_div_pow = 0,
 };
 
 static const struct sh_msiof_chipdata rcar_gen3_data = {
 	.tx_fifo_size = 64,
 	.rx_fifo_size = 64,
-	.master_flags = SPI_MASTER_MUST_TX,
+	.ctlr_flags = SPI_CONTROLLER_MUST_TX,
 	.min_div_pow = 1,
 };
 
@@ -1132,7 +1132,7 @@ static int sh_msiof_get_cs_gpios(struct sh_msiof_spi_priv *p)
 	if (ret <= 0)
 		return 0;
 
-	num_cs = max_t(unsigned int, ret, p->master->num_chipselect);
+	num_cs = max_t(unsigned int, ret, p->ctlr->num_chipselect);
 	for (i = 0; i < num_cs; i++) {
 		struct gpio_desc *gpiod;
 
@@ -1205,7 +1205,7 @@ static int sh_msiof_request_dma(struct sh_msiof_spi_priv *p)
 	const struct sh_msiof_spi_info *info = p->info;
 	unsigned int dma_tx_id, dma_rx_id;
 	const struct resource *res;
-	struct spi_master *master;
+	struct spi_controller *ctlr;
 	struct device *tx_dev, *rx_dev;
 
 	if (dev->of_node) {
@@ -1225,17 +1225,15 @@ static int sh_msiof_request_dma(struct sh_msiof_spi_priv *p)
 	if (!res)
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	master = p->master;
-	master->dma_tx = sh_msiof_request_dma_chan(dev, DMA_MEM_TO_DEV,
-						   dma_tx_id,
-						   res->start + TFDR);
-	if (!master->dma_tx)
+	ctlr = p->ctlr;
+	ctlr->dma_tx = sh_msiof_request_dma_chan(dev, DMA_MEM_TO_DEV,
+						 dma_tx_id, res->start + TFDR);
+	if (!ctlr->dma_tx)
 		return -ENODEV;
 
-	master->dma_rx = sh_msiof_request_dma_chan(dev, DMA_DEV_TO_MEM,
-						   dma_rx_id,
-						   res->start + RFDR);
-	if (!master->dma_rx)
+	ctlr->dma_rx = sh_msiof_request_dma_chan(dev, DMA_DEV_TO_MEM,
+						 dma_rx_id, res->start + RFDR);
+	if (!ctlr->dma_rx)
 		goto free_tx_chan;
 
 	p->tx_dma_page = (void *)__get_free_page(GFP_KERNEL | GFP_DMA);
@@ -1246,13 +1244,13 @@ static int sh_msiof_request_dma(struct sh_msiof_spi_priv *p)
 	if (!p->rx_dma_page)
 		goto free_tx_page;
 
-	tx_dev = master->dma_tx->device->dev;
+	tx_dev = ctlr->dma_tx->device->dev;
 	p->tx_dma_addr = dma_map_single(tx_dev, p->tx_dma_page, PAGE_SIZE,
 					DMA_TO_DEVICE);
 	if (dma_mapping_error(tx_dev, p->tx_dma_addr))
 		goto free_rx_page;
 
-	rx_dev = master->dma_rx->device->dev;
+	rx_dev = ctlr->dma_rx->device->dev;
 	p->rx_dma_addr = dma_map_single(rx_dev, p->rx_dma_page, PAGE_SIZE,
 					DMA_FROM_DEVICE);
 	if (dma_mapping_error(rx_dev, p->rx_dma_addr))
@@ -1268,34 +1266,34 @@ static int sh_msiof_request_dma(struct sh_msiof_spi_priv *p)
 free_tx_page:
 	free_page((unsigned long)p->tx_dma_page);
 free_rx_chan:
-	dma_release_channel(master->dma_rx);
+	dma_release_channel(ctlr->dma_rx);
 free_tx_chan:
-	dma_release_channel(master->dma_tx);
-	master->dma_tx = NULL;
+	dma_release_channel(ctlr->dma_tx);
+	ctlr->dma_tx = NULL;
 	return -ENODEV;
 }
 
 static void sh_msiof_release_dma(struct sh_msiof_spi_priv *p)
 {
-	struct spi_master *master = p->master;
+	struct spi_controller *ctlr = p->ctlr;
 
-	if (!master->dma_tx)
+	if (!ctlr->dma_tx)
 		return;
 
-	dma_unmap_single(master->dma_rx->device->dev, p->rx_dma_addr,
-			 PAGE_SIZE, DMA_FROM_DEVICE);
-	dma_unmap_single(master->dma_tx->device->dev, p->tx_dma_addr,
-			 PAGE_SIZE, DMA_TO_DEVICE);
+	dma_unmap_single(ctlr->dma_rx->device->dev, p->rx_dma_addr, PAGE_SIZE,
+			 DMA_FROM_DEVICE);
+	dma_unmap_single(ctlr->dma_tx->device->dev, p->tx_dma_addr, PAGE_SIZE,
+			 DMA_TO_DEVICE);
 	free_page((unsigned long)p->rx_dma_page);
 	free_page((unsigned long)p->tx_dma_page);
-	dma_release_channel(master->dma_rx);
-	dma_release_channel(master->dma_tx);
+	dma_release_channel(ctlr->dma_rx);
+	dma_release_channel(ctlr->dma_tx);
 }
 
 static int sh_msiof_spi_probe(struct platform_device *pdev)
 {
 	struct resource	*r;
-	struct spi_master *master;
+	struct spi_controller *ctlr;
 	const struct sh_msiof_chipdata *chipdata;
 	struct sh_msiof_spi_info *info;
 	struct sh_msiof_spi_priv *p;
@@ -1316,18 +1314,18 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
 	}
 
 	if (info->mode == MSIOF_SPI_SLAVE)
-		master = spi_alloc_slave(&pdev->dev,
-					 sizeof(struct sh_msiof_spi_priv));
+		ctlr = spi_alloc_slave(&pdev->dev,
+				       sizeof(struct sh_msiof_spi_priv));
 	else
-		master = spi_alloc_master(&pdev->dev,
-					  sizeof(struct sh_msiof_spi_priv));
-	if (master == NULL)
+		ctlr = spi_alloc_master(&pdev->dev,
+					sizeof(struct sh_msiof_spi_priv));
+	if (ctlr == NULL)
 		return -ENOMEM;
 
-	p = spi_master_get_devdata(master);
+	p = spi_controller_get_devdata(ctlr);
 
 	platform_set_drvdata(pdev, p);
-	p->master = master;
+	p->ctlr = ctlr;
 	p->info = info;
 	p->min_div_pow = chipdata->min_div_pow;
 
@@ -1374,31 +1372,31 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
 		p->rx_fifo_size = p->info->rx_fifo_override;
 
 	/* Setup GPIO chip selects */
-	master->num_chipselect = p->info->num_chipselect;
+	ctlr->num_chipselect = p->info->num_chipselect;
 	ret = sh_msiof_get_cs_gpios(p);
 	if (ret)
 		goto err1;
 
-	/* init master code */
-	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
-	master->mode_bits |= SPI_LSB_FIRST | SPI_3WIRE;
-	master->flags = chipdata->master_flags;
-	master->bus_num = pdev->id;
-	master->dev.of_node = pdev->dev.of_node;
-	master->setup = sh_msiof_spi_setup;
-	master->prepare_message = sh_msiof_prepare_message;
-	master->slave_abort = sh_msiof_slave_abort;
-	master->bits_per_word_mask = SPI_BPW_RANGE_MASK(8, 32);
-	master->auto_runtime_pm = true;
-	master->transfer_one = sh_msiof_transfer_one;
+	/* init controller code */
+	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
+	ctlr->mode_bits |= SPI_LSB_FIRST | SPI_3WIRE;
+	ctlr->flags = chipdata->ctlr_flags;
+	ctlr->bus_num = pdev->id;
+	ctlr->dev.of_node = pdev->dev.of_node;
+	ctlr->setup = sh_msiof_spi_setup;
+	ctlr->prepare_message = sh_msiof_prepare_message;
+	ctlr->slave_abort = sh_msiof_slave_abort;
+	ctlr->bits_per_word_mask = SPI_BPW_RANGE_MASK(8, 32);
+	ctlr->auto_runtime_pm = true;
+	ctlr->transfer_one = sh_msiof_transfer_one;
 
 	ret = sh_msiof_request_dma(p);
 	if (ret < 0)
 		dev_warn(&pdev->dev, "DMA not available, using PIO\n");
 
-	ret = devm_spi_register_master(&pdev->dev, master);
+	ret = devm_spi_register_controller(&pdev->dev, ctlr);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "spi_register_master error.\n");
+		dev_err(&pdev->dev, "devm_spi_register_controller error.\n");
 		goto err2;
 	}
 
@@ -1408,7 +1406,7 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
 	sh_msiof_release_dma(p);
 	pm_runtime_disable(&pdev->dev);
  err1:
-	spi_master_put(master);
+	spi_controller_put(ctlr);
 	return ret;
 }
 
@@ -1432,14 +1430,14 @@ static int sh_msiof_spi_suspend(struct device *dev)
 {
 	struct sh_msiof_spi_priv *p = dev_get_drvdata(dev);
 
-	return spi_master_suspend(p->master);
+	return spi_controller_suspend(p->ctlr);
 }
 
 static int sh_msiof_spi_resume(struct device *dev)
 {
 	struct sh_msiof_spi_priv *p = dev_get_drvdata(dev);
 
-	return spi_master_resume(p->master);
+	return spi_controller_resume(p->ctlr);
 }
 
 static SIMPLE_DEV_PM_OPS(sh_msiof_spi_pm_ops, sh_msiof_spi_suspend,
@@ -1461,7 +1459,7 @@ static struct platform_driver sh_msiof_spi_drv = {
 };
 module_platform_driver(sh_msiof_spi_drv);
 
-MODULE_DESCRIPTION("SuperH MSIOF SPI Master Interface Driver");
+MODULE_DESCRIPTION("SuperH MSIOF SPI Controller Interface Driver");
 MODULE_AUTHOR("Magnus Damm");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:spi_sh_msiof");
-- 
2.17.1

