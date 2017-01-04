Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:56816 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757176AbdADKPR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 05:15:17 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] spi: sh-msiof: Remove useless memory allocation failure message
Date: Wed,  4 Jan 2017 11:15:08 +0100
Message-Id: <1483524908-32497-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1483524908-32497-1-git-send-email-geert+renesas@glider.be>
References: <1483524908-32497-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Printing an error on memory allocation failure is unnecessary.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/spi-sh-msiof.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index ca2f2f8e4d1b45e2..44b484870220a96d 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -1214,10 +1214,8 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
 	int ret;
 
 	master = spi_alloc_master(&pdev->dev, sizeof(struct sh_msiof_spi_priv));
-	if (master == NULL) {
-		dev_err(&pdev->dev, "failed to allocate spi master\n");
+	if (master == NULL)
 		return -ENOMEM;
-	}
 
 	p = spi_master_get_devdata(master);
 
-- 
1.9.1
