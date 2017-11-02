Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45122 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932190AbdKBJcp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Nov 2017 05:32:45 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] spi: sh-msiof: Fix DMA transfer size check
Date: Thu,  2 Nov 2017 10:32:36 +0100
Message-Id: <20171102093236.26082-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

DMA supports 32-bit words only,
even if BITLEN1 of SITMDR2 register is 16bit.

Fixes: b0d0ce8b6b91 ("spi: sh-msiof: Add DMA support")
Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2
* Added Geert's Ack

Sorry for letting this slip through the cracks, it appears
to have been on my todo list for 1 year less 5 days.

---
 drivers/spi/spi-sh-msiof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 2c5ea4c57508..94d15ef0e4e6 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -900,7 +900,7 @@ static int sh_msiof_transfer_one(struct spi_master *master,
 				break;
 			copy32 = copy_bswap32;
 		} else if (bits <= 16) {
-			if (l & 1)
+			if (l & 3)
 				break;
 			copy32 = copy_wswap32;
 		} else {
-- 
2.11.0
