Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38988 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936831AbdADShf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 13:37:35 -0500
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <1483524908-32497-1-git-send-email-geert+renesas@glider.be>
Message-Id: <E1cOqRD-00023C-NF@debutante>
Date: Wed, 04 Jan 2017 18:37:27 +0000
Subject: Applied "spi: rspi: Remove useless memory allocation failure message" to the spi tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   spi: rspi: Remove useless memory allocation failure message

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

>From ffcfae3823751c72b615b57f700e563667002d09 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Wed, 4 Jan 2017 11:15:07 +0100
Subject: [PATCH] spi: rspi: Remove useless memory allocation failure message

Printing an error on memory allocation failure is unnecessary.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-rspi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index 9daf50031737..58b7e68013f3 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -1227,10 +1227,8 @@ static int rspi_probe(struct platform_device *pdev)
 	const struct spi_ops *ops;
 
 	master = spi_alloc_master(&pdev->dev, sizeof(struct rspi_data));
-	if (master == NULL) {
-		dev_err(&pdev->dev, "spi_alloc_master error.\n");
+	if (master == NULL)
 		return -ENOMEM;
-	}
 
 	of_id = of_match_device(rspi_of_match, &pdev->dev);
 	if (of_id) {
-- 
2.11.0
