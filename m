Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6FEC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 15:08:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4AAB20700
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 15:08:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbfDCPI5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 11:08:57 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:51586 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfDCPI5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 11:08:57 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id vr8u1z00M3XaVaC01r8u9k; Wed, 03 Apr 2019 17:08:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBhVW-0003ga-5J; Wed, 03 Apr 2019 17:08:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBhVW-00025z-3G; Wed, 03 Apr 2019 17:08:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] spi: sh-msiof: Convert to use GPIO descriptors
Date:   Wed,  3 Apr 2019 17:08:52 +0200
Message-Id: <20190403150852.8002-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert GPIO chip selects in the Renesas MSIOF SPI driver from legacy
GPIO numbers to GPIO descriptors.

Notes:
  - The board file for the SH7724-based Ecovec24 development board now
    registers a GPIO descriptor lookup, instead of passing a GPIO number
    through controller_data,
  - sh_msiof_get_cs_gpios() must release all GPIOs, else
    spi_get_gpio_descs() cannot claim them during SPI controller
    registration.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
sh_msiof_get_cs_gpios() still duplicates some logic from
spi_get_gpio_descs().  Reusing spi_controller.cs_gpiods[] is not
trivial, as that becomes available only after calling
spi_register_controller(), when slave devices have already been set up.
Alternatively, the functionality to find an unused native chip select
(and assert that when talking to a GPIO-selected slave) could be moved
to the core, under control of a new flag in spi_controller.
To add complexity, some controllers may need unused_ss handling, but not
native_cs_high handling.

Tested on Ebisu-4D with R-Car E3 using a 25LC040 EEPROM connected to
CN41.

Compile-tested on SH (ecovec24_defconfig + CONFIG_MMC_SDHI=n).
Testing on Ecovec24 would be appreciated.
---
 arch/sh/boards/mach-ecovec24/setup.c | 12 +++++++++---
 drivers/spi/spi-sh-msiof.c           | 20 ++++----------------
 2 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index c4cdee5f4df413e2..acaa97459531c602 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -806,7 +806,6 @@ static struct spi_board_info spi_bus[] = {
 		.platform_data	= &mmc_spi_info,
 		.max_speed_hz	= 5000000,
 		.mode		= SPI_MODE_0,
-		.controller_data = (void *) GPIO_PTM4,
 	},
 };
 
@@ -838,6 +837,14 @@ static struct platform_device msiof0_device = {
 	.resource	= msiof0_resources,
 };
 
+static struct gpiod_lookup_table msiof_gpio_table = {
+	.dev_id = "spi_sh_msiof.0",
+	.table = {
+		GPIO_LOOKUP("sh7724_pfc", GPIO_PTM4, "cs", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 #endif
 
 /* FSI */
@@ -1296,12 +1303,11 @@ static int __init arch_setup(void)
 	gpio_request(GPIO_FN_MSIOF0_TXD, NULL);
 	gpio_request(GPIO_FN_MSIOF0_RXD, NULL);
 	gpio_request(GPIO_FN_MSIOF0_TSCK, NULL);
-	gpio_request(GPIO_PTM4, NULL); /* software CS control of TSYNC pin */
-	gpio_direction_output(GPIO_PTM4, 1); /* active low CS */
 	gpio_request(GPIO_PTB6, NULL); /* 3.3V power control */
 	gpio_direction_output(GPIO_PTB6, 0); /* disable power by default */
 
 	gpiod_add_lookup_table(&mmc_spi_gpio_table);
+	gpiod_add_lookup_table(&msiof_gpio_table);
 	spi_register_board_info(spi_bus, ARRAY_SIZE(spi_bus));
 #endif
 
diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index d3794499915c17cb..6aab7b2136dbcadc 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -549,25 +549,11 @@ static void sh_msiof_spi_read_fifo_s32u(struct sh_msiof_spi_priv *p,
 
 static int sh_msiof_spi_setup(struct spi_device *spi)
 {
-	struct device_node *np = spi->controller->dev.of_node;
 	struct sh_msiof_spi_priv *p =
 		spi_controller_get_devdata(spi->controller);
 	u32 clr, set, tmp;
 
-	if (!np) {
-		/*
-		 * Use spi->controller_data for CS (same strategy as spi_gpio),
-		 * if any. otherwise let HW control CS
-		 */
-		spi->cs_gpio = (uintptr_t)spi->controller_data;
-	}
-
-	if (gpio_is_valid(spi->cs_gpio)) {
-		gpio_direction_output(spi->cs_gpio, !(spi->mode & SPI_CS_HIGH));
-		return 0;
-	}
-
-	if (spi_controller_is_slave(p->ctlr))
+	if (spi->cs_gpiod || spi_controller_is_slave(p->ctlr))
 		return 0;
 
 	if (p->native_cs_inited &&
@@ -600,7 +586,7 @@ static int sh_msiof_prepare_message(struct spi_controller *ctlr,
 	u32 ss, cs_high;
 
 	/* Configure pins before asserting CS */
-	if (gpio_is_valid(spi->cs_gpio)) {
+	if (spi->cs_gpiod) {
 		ss = p->unused_ss;
 		cs_high = p->native_cs_high;
 	} else {
@@ -1156,6 +1142,7 @@ static int sh_msiof_get_cs_gpios(struct sh_msiof_spi_priv *p)
 
 		gpiod = devm_gpiod_get_index(dev, "cs", i, GPIOD_ASIS);
 		if (!IS_ERR(gpiod)) {
+			devm_gpiod_put(dev, gpiod);
 			cs_gpios++;
 			continue;
 		}
@@ -1407,6 +1394,7 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
 	ctlr->bits_per_word_mask = chipdata->bits_per_word_mask;
 	ctlr->auto_runtime_pm = true;
 	ctlr->transfer_one = sh_msiof_transfer_one;
+	ctlr->use_gpio_descriptors = true;
 
 	ret = sh_msiof_request_dma(p);
 	if (ret < 0)
-- 
2.17.1

