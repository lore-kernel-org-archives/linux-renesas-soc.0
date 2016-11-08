Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:52106 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751469AbcKHAgN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 19:36:13 -0500
From: Cao Minh Hiep <cm-hiep@jinso.co.jp>
To: broonie@kernel.org, geert+renesas@glider.be,
        linux-spi@vger.kernel.org
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        ryusuke.sakato.bx@renesas.com, linux-renesas-soc@vger.kernel.org,
        nv-dung@jinso.co.jp, h-inayoshi@jinso.co.jp, cm-hiep@jinso.co.jp
Subject: [PATCH v2] spi: rspi: rewrites the name of the function
Date: Tue,  8 Nov 2016 09:35:46 +0900
Message-Id: <1478565346-4320-1-git-send-email-cm-hiep@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiep Cao Minh <cm-hiep@jinso.co.jp>

This patch rewrites the name of rspi_pio_transfer_in_or_out
function.

Signed-off-by: Hiep Cao Minh <cm-hiep@jinso.co.jp>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/spi-rspi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index fb12bc5..7d3a825 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -515,7 +515,7 @@ static int rspi_pio_transfer(struct rspi_data *rspi, const u8 *tx, u8 *rx,
 	return 0;
 }
 
-static int rspi_pio_transfer_in_or_our(struct rspi_data *rspi, const u8 *tx, 
+static int rspi_pio_transfer_in_or_out(struct rspi_data *rspi, const u8 *tx, 
 				       u8 *rx, unsigned int n)
 {
 	unsigned int i, len;
@@ -839,7 +839,7 @@ static int qspi_transfer_out(struct rspi_data *rspi, struct spi_transfer *xfer)
 			return ret;
 	}
 
-	ret = rspi_pio_transfer_in_or_our(rspi, xfer->tx_buf, NULL, xfer->len);
+	ret = rspi_pio_transfer_in_or_out(rspi, xfer->tx_buf, NULL, xfer->len);
 	if (ret < 0)
 		return ret;
 
@@ -857,7 +857,7 @@ static int qspi_transfer_in(struct rspi_data *rspi, struct spi_transfer *xfer)
 			return ret;
 	}
 
-	return rspi_pio_transfer_in_or_our(rspi, NULL, xfer->rx_buf, xfer->len);
+	return rspi_pio_transfer_in_or_out(rspi, NULL, xfer->rx_buf, xfer->len);
 }
 
 static int qspi_transfer_one(struct spi_master *master, struct spi_device *spi,
-- 
1.9.1
