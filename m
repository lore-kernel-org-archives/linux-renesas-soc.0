Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:57116 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751913AbdIFHFO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 03:05:14 -0400
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <linux-renesas-soc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH 7/8] spi: sh-msiof: Fix gpio function
Date: Wed, 6 Sep 2017 09:05:06 +0200
Message-ID: <20170906070507.26223-8-dirk.behme@de.bosch.com>
In-Reply-To: <20170906070507.26223-1-dirk.behme@de.bosch.com>
References: <20170906070507.26223-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

This patch adds a function to control chip select by GPIO.
In order to use this patch, it is necessary to define it to
devicetree. <refer Documentation/devicetree/bindings/spi/spi-bus.txt>

<devicetree example>

&pfc {
        ...
        /* MSIOF_SYMC Pin delete. */
        msiof1_pins: spi2 {
                /* The definition of sync, ss1 and ss2 are
                   unnecessary because of using GPIO as chip
                   select. */
                groups = "msiof1_clk_c",
                                "msiof1_rxd_c",  "msiof1_txd_c";
                function = "msiof1";
        };
        ...
};

&msiof1 {
        pinctrl-0 = <&msiof1_pins>;
        pinctrl-names = "default";
        cs-gpios = <&gpio6 21 GPIO_ACTIVE_LOW>,
                    <&gpio6 27 GPIO_ACTIVE_LOW>;
        status = "okay";

        spidev@0 {
                ...
                reg = <0>;
		...
        };
        spidev@1 {
                ...
                reg = <1>;
		...
        };
};

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 drivers/spi/spi-sh-msiof.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 2c53fc3f73af..fdad8d852602 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -541,6 +541,7 @@ static int sh_msiof_spi_setup(struct spi_device *spi)
 {
 	struct device_node	*np = spi->master->dev.of_node;
 	struct sh_msiof_spi_priv *p = spi_master_get_devdata(spi->master);
+	int ret;
 
 	pm_runtime_get_sync(&p->pdev->dev);
 
@@ -559,8 +560,12 @@ static int sh_msiof_spi_setup(struct spi_device *spi)
 				  !!(spi->mode & SPI_LSB_FIRST),
 				  !!(spi->mode & SPI_CS_HIGH));
 
-	if (spi->cs_gpio >= 0)
-		gpio_set_value(spi->cs_gpio, !(spi->mode & SPI_CS_HIGH));
+	if (gpio_is_valid(spi->cs_gpio)) {
+		ret = gpio_request(spi->cs_gpio, dev_name(&spi->dev));
+		if (!ret)
+			gpio_direction_output(spi->cs_gpio,
+					!(spi->mode & SPI_CS_HIGH));
+	}
 
 
 	pm_runtime_put(&p->pdev->dev);
-- 
2.14.1
