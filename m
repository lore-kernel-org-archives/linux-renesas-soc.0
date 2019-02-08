Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16724C282CC
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 13:11:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF4982177B
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549631502;
	bh=udNH8kikHLNumlo5SOOo5NtK/5fr/8HKMnwBRNTWiRA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=f2EvccO/MofBL0HRoDHm3kjfO72UqBTqFqlFAuPRz4ehMmEJz0+f826d98tZ8PGVc
	 ENnZdztZQFxNJOWyXwcqQYSkANeE/+LMWEsM8Gmj4qiFshvZ0/ZGZ7RjPLjE6qymLc
	 FLYLtQAfxB/b6fSQvtlPeevumTCfD6myFA0mVFDU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbfBHNLl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 08:11:41 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38780 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbfBHNLl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 08:11:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=CV2H9izSgfBY1U/GGSCbN9uyHoPZe1EfwO8mub1uyjo=; b=GvZXmMy+L3wc
        Q999625WCQmeB1hjPjtzYMkdhpZ1fBtk0XVIvbTKp49s87Ca+l1TPsPik42LpEPHkMLAeLEJG6Tgf
        EuVaNjoK5SGh+xZS0OueRY/iu/ODYZVDNgrrt5WphugVIaUnHE5t29NMgaCsKX9H3uUS6BvKZuXL7
        YLRsQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1gs5wP-0001Kh-QJ; Fri, 08 Feb 2019 13:11:37 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 64FF81127F30; Fri,  8 Feb 2019 13:11:37 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Applied "spi: sh-hspi: Replace spi_master by spi_controller" to the spi tree
In-Reply-To:  <20190208090909.739-3-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Message-Id: <20190208131137.64FF81127F30@debutante.sirena.org.uk>
Date:   Fri,  8 Feb 2019 13:11:37 +0000 (GMT)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   spi: sh-hspi: Replace spi_master by spi_controller

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

From 5a0e577fc9155fafc3bfc9fac025ebfad4f4bf14 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Fri, 8 Feb 2019 10:09:08 +0100
Subject: [PATCH] spi: sh-hspi: Replace spi_master by spi_controller

As of commit 8caab75fd2c2a926 ('spi: Generalize SPI "master" to
"controller"'), the old master-centric names are compatibility wrappers
for the new controller-centric names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-hspi.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-sh-hspi.c b/drivers/spi/spi-sh-hspi.c
index 7159cb99dbe9..7f73f91d412a 100644
--- a/drivers/spi/spi-sh-hspi.c
+++ b/drivers/spi/spi-sh-hspi.c
@@ -35,7 +35,7 @@
 
 struct hspi_priv {
 	void __iomem *addr;
-	struct spi_master *master;
+	struct spi_controller *ctlr;
 	struct device *dev;
 	struct clk *clk;
 };
@@ -140,10 +140,10 @@ static void hspi_hw_setup(struct hspi_priv *hspi,
 	hspi_write(hspi, SPSCR, 0x21);	/* master mode / CS control */
 }
 
-static int hspi_transfer_one_message(struct spi_master *master,
+static int hspi_transfer_one_message(struct spi_controller *ctlr,
 				     struct spi_message *msg)
 {
-	struct hspi_priv *hspi = spi_master_get_devdata(master);
+	struct hspi_priv *hspi = spi_controller_get_devdata(ctlr);
 	struct spi_transfer *t;
 	u32 tx;
 	u32 rx;
@@ -205,7 +205,7 @@ static int hspi_transfer_one_message(struct spi_master *master,
 		ndelay(nsecs);
 		hspi_hw_cs_disable(hspi);
 	}
-	spi_finalize_current_message(master);
+	spi_finalize_current_message(ctlr);
 
 	return ret;
 }
@@ -213,7 +213,7 @@ static int hspi_transfer_one_message(struct spi_master *master,
 static int hspi_probe(struct platform_device *pdev)
 {
 	struct resource *res;
-	struct spi_master *master;
+	struct spi_controller *ctlr;
 	struct hspi_priv *hspi;
 	struct clk *clk;
 	int ret;
@@ -225,8 +225,8 @@ static int hspi_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	master = spi_alloc_master(&pdev->dev, sizeof(*hspi));
-	if (!master)
+	ctlr = spi_alloc_master(&pdev->dev, sizeof(*hspi));
+	if (!ctlr)
 		return -ENOMEM;
 
 	clk = clk_get(&pdev->dev, NULL);
@@ -236,11 +236,11 @@ static int hspi_probe(struct platform_device *pdev)
 		goto error0;
 	}
 
-	hspi = spi_master_get_devdata(master);
+	hspi = spi_controller_get_devdata(ctlr);
 	platform_set_drvdata(pdev, hspi);
 
 	/* init hspi */
-	hspi->master	= master;
+	hspi->ctlr	= ctlr;
 	hspi->dev	= &pdev->dev;
 	hspi->clk	= clk;
 	hspi->addr	= devm_ioremap(hspi->dev,
@@ -252,16 +252,16 @@ static int hspi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	master->bus_num		= pdev->id;
-	master->mode_bits	= SPI_CPOL | SPI_CPHA;
-	master->dev.of_node	= pdev->dev.of_node;
-	master->auto_runtime_pm = true;
-	master->transfer_one_message		= hspi_transfer_one_message;
-	master->bits_per_word_mask = SPI_BPW_MASK(8);
+	ctlr->bus_num = pdev->id;
+	ctlr->mode_bits	= SPI_CPOL | SPI_CPHA;
+	ctlr->dev.of_node = pdev->dev.of_node;
+	ctlr->auto_runtime_pm = true;
+	ctlr->transfer_one_message = hspi_transfer_one_message;
+	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
 
-	ret = devm_spi_register_master(&pdev->dev, master);
+	ret = devm_spi_register_controller(&pdev->dev, ctlr);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "spi_register_master error.\n");
+		dev_err(&pdev->dev, "devm_spi_register_controller error.\n");
 		goto error2;
 	}
 
@@ -272,7 +272,7 @@ static int hspi_probe(struct platform_device *pdev)
  error1:
 	clk_put(clk);
  error0:
-	spi_master_put(master);
+	spi_controller_put(ctlr);
 
 	return ret;
 }
-- 
2.20.1

