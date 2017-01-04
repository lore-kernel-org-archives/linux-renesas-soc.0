Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38970 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936830AbdADShd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 13:37:33 -0500
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <1483524908-32497-2-git-send-email-geert+renesas@glider.be>
Message-Id: <E1cOqRA-00022Q-Kf@debutante>
Date: Wed, 04 Jan 2017 18:37:24 +0000
Subject: Applied "spi: sh-msiof: Remove useless memory allocation failure message" to the spi tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   spi: sh-msiof: Remove useless memory allocation failure message

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

>From e7ad4a73364c21f40963a35631b285b60fa3198c Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Wed, 4 Jan 2017 11:15:08 +0100
Subject: [PATCH] spi: sh-msiof: Remove useless memory allocation failure
 message

Printing an error on memory allocation failure is unnecessary.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-msiof.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 1f00eeb0b5a3..2ce15ca97782 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -1164,10 +1164,8 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
 	int ret;
 
 	master = spi_alloc_master(&pdev->dev, sizeof(struct sh_msiof_spi_priv));
-	if (master == NULL) {
-		dev_err(&pdev->dev, "failed to allocate spi master\n");
+	if (master == NULL)
 		return -ENOMEM;
-	}
 
 	p = spi_master_get_devdata(master);
 
-- 
2.11.0
