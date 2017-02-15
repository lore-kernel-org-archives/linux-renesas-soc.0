Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:23906 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750711AbdBOHeV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2017 02:34:21 -0500
From: DongCV <cv-dong@jinso.co.jp>
To: broonie@kernel.org, geert+renesas@glider.be,
        linux-spi@vger.kernel.org
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        ryusuke.sakato.bx@renesas.com, linux-renesas-soc@vger.kernel.org,
        nv-dung@jinso.co.jp, h-inayoshi@jinso.co.jp, cm-hiep@jinso.co.jp
Subject: [PATCH v3] spi: rspi: Fix bogus received byte in qspi_transfer_in()
Date: Wed, 15 Feb 2017 16:33:55 +0900
Message-Id: <1487144035-9075-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In qspi_transfer_in(), when receiving the last n (or len) bytes of data,
n(or len) bogus bytes were written in the receive buffer,
This code leads to the following error that related to jffs2 format
when trying to mount, unmount, and remount a jffs2-formatted device.
Remove the bogus write to fix this.

"jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x03b40000: 0x1900 instead
 jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x03b40004: 0x000c instead"

Signed-off-by: DongCV <cv-dong@jinso.co.jp>
---
 drivers/spi/spi-rspi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index 9daf500..bc3c868 100644
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
@@ -845,10 +845,9 @@ static int qspi_transfer_in(struct rspi_data *rspi, struct spi_transfer *xfer)
 			for (i = 0; i < len; i++)
 				*rx++ = rspi_read_data(rspi);
 		} else {
-			ret = rspi_pio_transfer(rspi, NULL, rx, n);
+			ret = rspi_pio_transfer(rspi, NULL, rx, len);
 			if (ret < 0)
 				return ret;
-			*rx++ = ret;
 		}
 		n -= len;
 	}
-- 
1.9.1
