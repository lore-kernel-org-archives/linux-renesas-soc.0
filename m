Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:12646 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751780AbdBOKvX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2017 05:51:23 -0500
From: DongCV <cv-dong@jinso.co.jp>
To: broonie@kernel.org, geert+renesas@glider.be,
        linux-spi@vger.kernel.org
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        ryusuke.sakato.bx@renesas.com, linux-renesas-soc@vger.kernel.org,
        nv-dung@jinso.co.jp, h-inayoshi@jinso.co.jp, cm-hiep@jinso.co.jp
Subject: [PATCH 2/2] spi: rspi: Replaces "n" by "len" in qspi_transfer_*()
Date: Wed, 15 Feb 2017 19:50:52 +0900
Message-Id: <1487155852-12102-3-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1487155852-12102-1-git-send-email-cv-dong@jinso.co.jp>
References: <1487155852-12102-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch replaced "n" by "len" bytes of data in qspi_transfer_in() and
qspi_transfer_out() function. This will make improving readability.

Signed-off-by: DongCV <cv-dong@jinso.co.jp>
---
 drivers/spi/spi-rspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index 2ee1301..bc3c868 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -808,7 +808,7 @@ static int qspi_transfer_out(struct rspi_data *rspi, struct spi_transfer *xfer)
 			for (i = 0; i < len; i++)
 				rspi_write_data(rspi, *tx++);
 		} else {
-			ret = rspi_pio_transfer(rspi, tx, NULL, n);
+			ret = rspi_pio_transfer(rspi, tx, NULL, len);
 			if (ret < 0)
 				return ret;
 		}
@@ -845,7 +845,7 @@ static int qspi_transfer_in(struct rspi_data *rspi, struct spi_transfer *xfer)
 			for (i = 0; i < len; i++)
 				*rx++ = rspi_read_data(rspi);
 		} else {
-			ret = rspi_pio_transfer(rspi, NULL, rx, n);
+			ret = rspi_pio_transfer(rspi, NULL, rx, len);
 			if (ret < 0)
 				return ret;
 		}
-- 
1.9.1
