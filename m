Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52246 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752364AbcKGO05 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 09:26:57 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFC] spi: sh-msiof: Fix DMA transfer size check
Date: Mon,  7 Nov 2016 15:07:03 +0100
Message-Id: <1478527623-17960-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

DMA supports 32-bit words only,
even if BITLEN1 of SITMDR2 register is 16bit.

Fixes: b0d0ce8b6b91 ("spi: sh-msiof: Add DMA support")
Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Geert, this is a patch from the Gen3 BSP 3.3.2 kernel.
Please consider if it is appropriate for mainline.
---
 drivers/spi/spi-sh-msiof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 1de3a772eb7d..cbf02ebb30a2 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -862,7 +862,7 @@ static int sh_msiof_transfer_one(struct spi_master *master,
 				break;
 			copy32 = copy_bswap32;
 		} else if (bits <= 16) {
-			if (l & 1)
+			if (l & 3)
 				break;
 			copy32 = copy_wswap32;
 		} else {
-- 
2.7.0.rc3.207.g0ac5344
