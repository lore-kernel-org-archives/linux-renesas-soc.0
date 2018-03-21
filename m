Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:42946 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751480AbeCUIH1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Mar 2018 04:07:27 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] spi: sh-msiof: Use correct enum for DMA transfer direction
Date: Wed, 21 Mar 2018 09:07:23 +0100
Message-Id: <1521619643-4492-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use enum dma_transfer_direction as required by dmaengine_prep_slave_sg()
instead of enum dma_data_direction.  This won't change behavior in
practice as the enum values are equivalent.

This fixes two warnings when building with clang:
  drivers/spi/spi-sh-msiof.c:755:27: warning: implicit conversion from enumeration
      type 'enum dma_data_direction' to different enumeration type
      'enum dma_transfer_direction' [-Wenum-conversion]
					rx->sgl, rx->nents, DMA_FROM_DEVICE,
							    ^~~~~~~~~~~~~~~
  drivers/spi/spi-sh-msiof.c:772:27: warning: implicit conversion from enumeration
      type 'enum dma_data_direction' to different enumeration type
      'enum dma_transfer_direction' [-Wenum-conversion]
					tx->sgl, tx->nents, DMA_TO_DEVICE,
							    ^~~~~~~~~~~~~

Based on commit 768d59f5d0139a6f ("spi: rspi: use correct enum for DMA
transfer direction").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/spi-sh-msiof.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index c5dcfb434a498b27..ae086aab57d51edc 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -752,7 +752,7 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 	if (rx) {
 		ier_bits |= IER_RDREQE | IER_RDMAE;
 		desc_rx = dmaengine_prep_slave_single(p->master->dma_rx,
-					p->rx_dma_addr, len, DMA_FROM_DEVICE,
+					p->rx_dma_addr, len, DMA_DEV_TO_MEM,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 		if (!desc_rx)
 			return -EAGAIN;
@@ -769,7 +769,7 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 		dma_sync_single_for_device(p->master->dma_tx->device->dev,
 					   p->tx_dma_addr, len, DMA_TO_DEVICE);
 		desc_tx = dmaengine_prep_slave_single(p->master->dma_tx,
-					p->tx_dma_addr, len, DMA_TO_DEVICE,
+					p->tx_dma_addr, len, DMA_MEM_TO_DEV,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 		if (!desc_tx) {
 			ret = -EAGAIN;
-- 
2.7.4
