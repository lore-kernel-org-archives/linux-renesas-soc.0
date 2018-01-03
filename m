Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:38346 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750970AbeACRLW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jan 2018 12:11:22 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] spi: sh-msiof: Fix timeout failures for TX-only DMA transfers
Date: Wed,  3 Jan 2018 18:11:14 +0100
Message-Id: <1514999474-22288-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When using RX (with or without TX), the DMA interrupt triggers
completion when the RX FIFO has been emptied, i.e. after the full
transfer has finished.

However, when using TX without RX, the DMA interrupt triggers completion
as soon as the DMA engine has filled the TX FIFO, i.e. before the full
transfer has finished.  Then sh_msiof_modify_ctr_wait() will spin until
the transfer has really finished and the TFSE bit is cleared, for at
most 1 ms.  For slow speeds and/or large transfers, this may cause
timeouts and transfer failures:

    spi_sh_msiof e6e10000.spi: failed to shut down hardware
    74x164 spi2.0: SPI transfer failed: -110
    spi_master spi2: failed to transfer one message from queue
    74x164 spi2.0: Failed writing: -110

Fix this by waiting explicitly until the TX FIFO has been emptied.

Based on a patch in the BSP by Hiromitsu Yamasaki.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/spi-sh-msiof.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index e1d18de1e55c50e7..6c1914a1cddeec17 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -912,11 +912,21 @@ static int sh_msiof_dma_once(struct sh_msiof_spi_priv *p, const void *tx,
 		goto stop_dma;
 	}
 
-	/* wait for tx fifo to be emptied / rx fifo to be filled */
+	/* wait for tx/rx DMA completion */
 	ret = sh_msiof_wait_for_completion(p);
 	if (ret)
 		goto stop_reset;
 
+	if (!rx) {
+		reinit_completion(&p->done);
+		sh_msiof_write(p, IER, IER_TEOFE);
+
+		/* wait for tx fifo to be emptied */
+		ret = sh_msiof_wait_for_completion(p);
+		if (ret)
+			goto stop_reset;
+	}
+
 	/* clear status bits */
 	sh_msiof_reset_str(p);
 
-- 
2.7.4
