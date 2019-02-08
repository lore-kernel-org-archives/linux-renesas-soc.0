Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C436C4151A
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 09:09:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 376DD2147C
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 09:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbfBHJJO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 04:09:14 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:46246 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbfBHJJN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 04:09:13 -0500
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id a99A1z00y3XaVaC0199Aur; Fri, 08 Feb 2019 10:09:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gs29m-0004Ix-Ry; Fri, 08 Feb 2019 10:09:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gs29m-0000Cx-Oe; Fri, 08 Feb 2019 10:09:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] spi: sh-hspi: Replace spi_master by spi_controller
Date:   Fri,  8 Feb 2019 10:09:08 +0100
Message-Id: <20190208090909.739-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190208090909.739-1-geert+renesas@glider.be>
References: <20190208090909.739-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As of commit 8caab75fd2c2a926 ('spi: Generalize SPI "master" to
"controller"'), the old master-centric names are compatibility wrappers
for the new controller-centric names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/spi-sh-hspi.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-sh-hspi.c b/drivers/spi/spi-sh-hspi.c
index 7159cb99dbe977ee..7f73f91d412a1e2c 100644
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
2.17.1

