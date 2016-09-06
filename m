Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34525 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932286AbcIFMlX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 08:41:23 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: broonie@kernel.org, linux-spi@vger.kernel.org, wsa@the-dreams.de,
        magnus.damm@gmail.com, ulrich.hecht+renesas@gmail.com
Subject: [PATCH v2] spi: sh-msiof: request and set cs-gpio direction to output
Date: Tue,  6 Sep 2016 14:41:18 +0200
Message-Id: <20160906124118.13979-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Required for the CS signal to actually be visible to the device.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---

This revision uses devm_gpio_request_one() instead of gpio_request()/
gpio_direction_output(), as suggested by Geert.

CU
Uli


 drivers/spi/spi-sh-msiof.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 6852552a..ed01289 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -541,15 +541,32 @@ static int sh_msiof_spi_setup(struct spi_device *spi)
 				  !!(spi->mode & SPI_LSB_FIRST),
 				  !!(spi->mode & SPI_CS_HIGH));
 
-	if (spi->cs_gpio >= 0)
-		gpio_set_value(spi->cs_gpio, !(spi->mode & SPI_CS_HIGH));
+	if (spi->cs_gpio >= 0 && !spi_get_ctldata(spi)) {
+		int ret = devm_gpio_request_one(&p->pdev->dev, spi->cs_gpio,
+				spi->mode & SPI_CS_HIGH ? GPIOF_OUT_INIT_LOW :
+				GPIOF_OUT_INIT_HIGH, dev_name(&spi->dev));
+
+		if (ret < 0)
+			return ret;
 
+		spi_set_ctldata(spi, (void *)spi->cs_gpio);
+	}
 
 	pm_runtime_put(&p->pdev->dev);
 
 	return 0;
 }
 
+static void sh_msiof_spi_cleanup(struct spi_device *spi)
+{
+	struct sh_msiof_spi_priv *p = spi_master_get_devdata(spi->master);
+
+	if (spi->cs_gpio >= 0)
+		devm_gpio_free(&p->pdev->dev, spi->cs_gpio);
+
+	spi_set_ctldata(spi, NULL);
+}
+
 static int sh_msiof_prepare_message(struct spi_master *master,
 				    struct spi_message *msg)
 {
@@ -1263,6 +1280,7 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
 	master->dev.of_node = pdev->dev.of_node;
 	master->num_chipselect = p->info->num_chipselect;
 	master->setup = sh_msiof_spi_setup;
+	master->cleanup = sh_msiof_spi_cleanup;
 	master->prepare_message = sh_msiof_prepare_message;
 	master->bits_per_word_mask = SPI_BPW_RANGE_MASK(8, 32);
 	master->auto_runtime_pm = true;
-- 
2.9.3
