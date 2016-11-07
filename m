Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52243 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752364AbcKGO0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 09:26:55 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFC] spi: sh-msiof: Fix MSIOF address for DMAC
Date: Mon,  7 Nov 2016 15:07:15 +0100
Message-Id: <1478527635-18031-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Ryo Kataoka <ryo.kataoka.wt@renesas.com>

MSIOF Base Address H'E6xx can be accessed by CPU and DMAC.
MSIOF Base Address H'E7xx for DMAC was removed from H/W manual.

    Fixes: b0d0ce8b6b91 ("spi: sh-msiof: Add DMA support")
Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Geert, this is a patch from the Gen3 BSP 3.3.2 kernel.
Please consider if it is appropriate for mainline.
---
 drivers/spi/spi-sh-msiof.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index cbf02ebb30a2..b882e0a500f8 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -1076,10 +1076,7 @@ static int sh_msiof_request_dma(struct sh_msiof_spi_priv *p)
 		return 0;
 	}
 
-	/* The DMA engine uses the second register set, if present */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!res)
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	master = p->master;
 	master->dma_tx = sh_msiof_request_dma_chan(dev, DMA_MEM_TO_DEV,
-- 
2.7.0.rc3.207.g0ac5344
