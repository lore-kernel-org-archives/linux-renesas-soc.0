Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDC0C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 06:05:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44113206DF
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 06:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554357900;
	bh=2OaI/mvznX5XrgTqNab4eNPo/Uu4D9oFbMPpzlEjgpU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=ReM1It6HIWjInFZbdBa5Tl8xHlLHT2O5H/elevvMmtsbPrtoyvHaz5h13iI2c9xbM
	 g3PzNBUIaNN+12pRyreRogSE3jn8oZtPJSVM4Kq0stE7OTLRAoXzJzNrCLjTztsryh
	 zBw49tGG6esAYoXakcn8gmylg4ZTB8hwIYg9x16E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfDDGE4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Apr 2019 02:04:56 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54942 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfDDGE4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Apr 2019 02:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=biysjBUvGzOcOL9WsezaDpwxW6Bl7uC8jWupqfaq3a8=; b=W14lQFv1sCqZ
        pK62L6qfVDN4FYEil0WLmtSHmBcjZLBppOjAL/lo9oEegoWhfVHd1HEQPBWJ/oGmUAeI1j9VUTXyy
        UqE5GCa6TcEtUWeL11pymxpydzyxsS/4nuyLJzOIltdnNhVtn2bDznlvPVx0/vg91OdDf9y4t3Yrk
        Qi+no=;
Received: from [147.50.13.10] (helo=finisterre.ee.mobilebroadband)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hBvUX-0004MY-QY; Thu, 04 Apr 2019 06:04:50 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
        id C5AE9441D3C; Thu,  4 Apr 2019 13:04:41 +0700 (+07)
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: Convert to use GPIO descriptors" to the spi tree
In-Reply-To:  <20190403150852.8002-1-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Message-Id: <20190404060441.C5AE9441D3C@finisterre.ee.mobilebroadband>
Date:   Thu,  4 Apr 2019 13:04:41 +0700 (+07)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   spi: sh-msiof: Convert to use GPIO descriptors

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 9fda6693335cd51b0a74cffaac266c83439f7efe Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Wed, 3 Apr 2019 17:08:52 +0200
Subject: [PATCH] spi: sh-msiof: Convert to use GPIO descriptors

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
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/sh/boards/mach-ecovec24/setup.c | 12 +++++++++---
 drivers/spi/spi-sh-msiof.c           | 20 ++++----------------
 2 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index 34e5414c5563..f402aa741bf3 100644
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
index d3794499915c..6aab7b2136db 100644
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
2.20.1

