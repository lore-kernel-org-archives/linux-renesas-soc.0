Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44426 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752085AbdJDOvs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 10:51:48 -0400
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Applied "spi: rspi: Use of_device_get_match_data() helper" to the spi tree
In-Reply-To: <1507119593-12789-1-git-send-email-geert+renesas@glider.be>
Message-Id: <E1dzl1W-0008Vl-PM@debutante>
Date: Wed, 04 Oct 2017 15:51:46 +0100
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   spi: rspi: Use of_device_get_match_data() helper

has been applied to the spi tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

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

>From 219a7bc577e6024cd6f84571d93d939b3517aafe Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Wed, 4 Oct 2017 14:19:53 +0200
Subject: [PATCH] spi: rspi: Use of_device_get_match_data() helper

Use the of_device_get_match_data() helper instead of open coding.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-rspi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index 2a10b3f94ff7..2ce875764ca6 100644
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
2.14.1
