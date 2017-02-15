Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:56558 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750817AbdBOKVT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2017 05:21:19 -0500
From: DongCV <cv-dong@jinso.co.jp>
To: broonie@kernel.org, geert+renesas@glider.be,
        linux-spi@vger.kernel.org
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        ryusuke.sakato.bx@renesas.com, linux-renesas-soc@vger.kernel.org,
        nv-dung@jinso.co.jp, h-inayoshi@jinso.co.jp, cm-hiep@jinso.co.jp
Subject: [PATCH v4] spi: rspi: Fixes bogus received byte in qspi_transfer_in()
Date: Wed, 15 Feb 2017 19:20:53 +0900
Message-Id: <1487154054-11720-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In qspi_transfer_in(), when receiving the last n (or len) bytes of data,
1 bogus byte was written in the receive buffer.
This code leads to a buffer overflow.

"jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x03b40000: 0x1900 instead
 jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x03b40004: 0x000c instead"

The error message above happens when trying to mount, unmount, and remount a jffs2-formatted device.
This patch removed the bogus write to fixes: 3be09bec42a800d4
"spi: rspi: supports 32bytes buffer for DUAL and QUAD"

And here is Geert's comment:

"May I suggest the following:

    spi: rspi: Fix bogus received byte in qspi_transfer_in()

    When there are less than QSPI_BUFFER_SIZE remaining bytes to be received,
    qspi_transfer_in() writes one bogus byte in the receive buffer, possibly
    leading to a buffer overflow.

    This can be reproduced by mounting, unmounting, and remounting a
    jffs2-formatted device, causing lots of warnings like:

       jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
       at 0x03b40000: 0x1900 instead

    Remove the bogus write to fix this. "

Signed-off-by: DongCV <cv-dong@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/spi-rspi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index 9daf500..2ee1301 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -848,7 +848,6 @@ static int qspi_transfer_in(struct rspi_data *rspi, struct spi_transfer *xfer)
 			ret = rspi_pio_transfer(rspi, NULL, rx, n);
 			if (ret < 0)
 				return ret;
-			*rx++ = ret;
 		}
 		n -= len;
 	}
-- 
1.9.1
