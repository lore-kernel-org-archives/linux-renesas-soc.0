Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:36784 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751915AbdJDMT7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 08:19:59 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] spi: rspi: Use of_device_get_match_data() helper
Date: Wed,  4 Oct 2017 14:19:53 +0200
Message-Id: <1507119593-12789-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use the of_device_get_match_data() helper instead of open coding.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/spi-rspi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index a76e0cacc23b4dcb..c96eab723fd3fdb7 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -1221,7 +1221,6 @@ static int rspi_probe(struct platform_device *pdev)
 	struct spi_master *master;
 	struct rspi_data *rspi;
 	int ret;
-	const struct of_device_id *of_id;
 	const struct rspi_plat_data *rspi_pd;
 	const struct spi_ops *ops;
 
@@ -1229,9 +1228,8 @@ static int rspi_probe(struct platform_device *pdev)
 	if (master == NULL)
 		return -ENOMEM;
 
-	of_id = of_match_device(rspi_of_match, &pdev->dev);
-	if (of_id) {
-		ops = of_id->data;
+	ops = of_device_get_match_data(&pdev->dev);
+	if (ops) {
 		ret = rspi_parse_dt(&pdev->dev, master);
 		if (ret)
 			goto error1;
-- 
2.7.4
