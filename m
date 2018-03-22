Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:49816 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbeCVCOS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Mar 2018 22:14:18 -0400
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        Stefan Agner <stefan@agner.ch>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: Use correct enum for DMA transfer direction" to the spi tree
In-Reply-To: <1521619643-4492-1-git-send-email-geert+renesas@glider.be>
Message-Id: <20180322021412.CCCE944007A@finisterre.ee.mobilebroadband>
Date: Thu, 22 Mar 2018 02:14:12 +0000 (GMT)
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   spi: sh-msiof: Use correct enum for DMA transfer direction

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

>From da779513d33575fc43a9ae87a95af6b4354cebaa Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Wed, 21 Mar 2018 09:07:23 +0100
Subject: [PATCH] spi: sh-msiof: Use correct enum for DMA transfer direction

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
Reviewed-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-msiof.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index c5dcfb434a49..ae086aab57d5 100644
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
2.16.2
