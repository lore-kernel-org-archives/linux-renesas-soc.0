Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3825CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 00:07:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0951320830
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 00:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551658036;
	bh=jkltKiYRkI0gA7bSYgWM4TaRLX0zAVHSBP8gmNJUDqw=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=O6u4rNfRkd/6JZD+czHXkjlf8KGyKR6Xg9QTX1pIzIrW+J18pDHWpIUB4DlB70784
	 M226RYEz6oT1hIxK8/788Dzej6dQg2JErA6HD2VSabqOccXvSasdFL3BZwJSjK9g3H
	 cHTcG8CBgRUy9f/pyiz+b0uq+rlMVPzfvt2WO2Oo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfCDAHP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 3 Mar 2019 19:07:15 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:55116 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbfCDAHO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Mar 2019 19:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=lrYg9WNpGd/6o6G1ipPnR+1Uo8AcO5+h/aamZQyucy4=; b=Zxs6CVZt6UjY
        zvU9S1lCPujI/LcGwWorBDeW8kPktxm5vJWgA3GHhsYh7+4CmZpMYPzGoghsHuDGEqnp7glfrVPdf
        7dcKkBa9dO7AeZXQiAVxy/rHU6iZGlkoubmJCMsAM7lt+0thOpUQJejsylleNAvI5By16fzbgE0+1
        0RcMw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.ee.mobilebroadband)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1h0b8N-0007R8-OW; Mon, 04 Mar 2019 00:07:07 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
        id 1BE39440082; Mon,  4 Mar 2019 00:07:07 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: Restrict bits per word to 8/16/24/32 on R-Car Gen2/3" to the spi tree
In-Reply-To:  <20190228110513.1833-1-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Message-Id: <20190304000707.1BE39440082@finisterre.ee.mobilebroadband>
Date:   Mon,  4 Mar 2019 00:07:07 +0000 (GMT)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   spi: sh-msiof: Restrict bits per word to 8/16/24/32 on R-Car Gen2/3

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

From 0e836c3bea7da04cd4e2ed22d8c20654d5a09273 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Thu, 28 Feb 2019 12:05:13 +0100
Subject: [PATCH] spi: sh-msiof: Restrict bits per word to 8/16/24/32 on R-Car
 Gen2/3

While the MSIOF variants in older SuperH and SH/R-Mobile SoCs support
bits-per-word values in the full range 8..32, the variants present in
R-Car Gen2 and Gen3 SoCs are restricted to 8, 16, 24, or 32.

Obtain the value from family-specific sh_msiof_chipdata to fix this.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-msiof.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index b20e70a2bdd1..e2eb466db10a 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -32,6 +32,7 @@
 #include <asm/unaligned.h>
 
 struct sh_msiof_chipdata {
+	u32 bits_per_word_mask;
 	u16 tx_fifo_size;
 	u16 rx_fifo_size;
 	u16 ctlr_flags;
@@ -1048,6 +1049,7 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
 }
 
 static const struct sh_msiof_chipdata sh_data = {
+	.bits_per_word_mask = SPI_BPW_RANGE_MASK(8, 32),
 	.tx_fifo_size = 64,
 	.rx_fifo_size = 64,
 	.ctlr_flags = 0,
@@ -1055,6 +1057,8 @@ static const struct sh_msiof_chipdata sh_data = {
 };
 
 static const struct sh_msiof_chipdata rcar_gen2_data = {
+	.bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(16) |
+			      SPI_BPW_MASK(24) | SPI_BPW_MASK(32),
 	.tx_fifo_size = 64,
 	.rx_fifo_size = 64,
 	.ctlr_flags = SPI_CONTROLLER_MUST_TX,
@@ -1062,6 +1066,8 @@ static const struct sh_msiof_chipdata rcar_gen2_data = {
 };
 
 static const struct sh_msiof_chipdata rcar_gen3_data = {
+	.bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(16) |
+			      SPI_BPW_MASK(24) | SPI_BPW_MASK(32),
 	.tx_fifo_size = 64,
 	.rx_fifo_size = 64,
 	.ctlr_flags = SPI_CONTROLLER_MUST_TX,
@@ -1386,7 +1392,7 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
 	ctlr->setup = sh_msiof_spi_setup;
 	ctlr->prepare_message = sh_msiof_prepare_message;
 	ctlr->slave_abort = sh_msiof_slave_abort;
-	ctlr->bits_per_word_mask = SPI_BPW_RANGE_MASK(8, 32);
+	ctlr->bits_per_word_mask = chipdata->bits_per_word_mask;
 	ctlr->auto_runtime_pm = true;
 	ctlr->transfer_one = sh_msiof_transfer_one;
 
-- 
2.20.1

