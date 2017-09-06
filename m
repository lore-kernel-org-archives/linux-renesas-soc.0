Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:55538 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751824AbdIFHFN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 03:05:13 -0400
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <linux-renesas-soc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: Ryo Kataoka <ryo.kataoka.wt@renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH 3/8] spi: sh-msiof: Fix MSIOF address for DMAC
Date: Wed, 6 Sep 2017 09:05:02 +0200
Message-ID: <20170906070507.26223-4-dirk.behme@de.bosch.com>
In-Reply-To: <20170906070507.26223-1-dirk.behme@de.bosch.com>
References: <20170906070507.26223-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Ryo Kataoka <ryo.kataoka.wt@renesas.com>

MSIOF Base Address H'E6xx can be accessed by CPU and DMAC.
MSIOF Base Address H'E7xx for DMAC was removed from H/W manual.

Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 drivers/spi/spi-sh-msiof.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index f9300fdf41e5..24b49d3ca9a8 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -1145,10 +1145,7 @@ static int sh_msiof_request_dma(struct sh_msiof_spi_priv *p)
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
2.14.1
