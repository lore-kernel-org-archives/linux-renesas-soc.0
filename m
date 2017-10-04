Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:53010 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751696AbdJDMUf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 08:20:35 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] spi: sh-msiof: Use of_device_get_match_data() helper
Date: Wed,  4 Oct 2017 14:20:27 +0200
Message-Id: <1507119627-12865-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use the of_device_get_match_data() helper instead of open coding.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/spi-sh-msiof.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 00808448cf35b87c..2c5ea4c57508d2b5 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -1211,15 +1211,13 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
 	struct resource	*r;
 	struct spi_master *master;
 	const struct sh_msiof_chipdata *chipdata;
-	const struct of_device_id *of_id;
 	struct sh_msiof_spi_info *info;
 	struct sh_msiof_spi_priv *p;
 	int i;
 	int ret;
 
-	of_id = of_match_device(sh_msiof_match, &pdev->dev);
-	if (of_id) {
-		chipdata = of_id->data;
+	chipdata = of_device_get_match_data(&pdev->dev);
+	if (chipdata) {
 		info = sh_msiof_spi_parse_dt(&pdev->dev);
 	} else {
 		chipdata = (const void *)pdev->id_entry->driver_data;
-- 
2.7.4
