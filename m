Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42922 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032808AbeEXOUS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 10:20:18 -0400
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Renesas BSP team via Yoshihiro Shimoda
        <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: Fix setting SIRMDR1.SYNCAC to match SITMDR1.SYNCAC" to the spi tree
In-Reply-To: <1527066124-1541-1-git-send-email-geert+renesas@glider.be>
Message-Id: <E1fLr6B-000312-3Q@debutante>
Date: Thu, 24 May 2018 15:20:11 +0100
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   spi: sh-msiof: Fix setting SIRMDR1.SYNCAC to match SITMDR1.SYNCAC

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

>From 0921e11e1e12802ae0a3c19cb02e33354ca51967 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Wed, 23 May 2018 11:02:04 +0200
Subject: [PATCH] spi: sh-msiof: Fix setting SIRMDR1.SYNCAC to match
 SITMDR1.SYNCAC

According to section 59.2.4 MSIOF Receive Mode Register 1 (SIRMDR1) in
the R-Car Gen3 datasheet Rev.1.00, the value of the SIRMDR1.SYNCAC bit
must match the value of the SITMDR1.SYNCAC bit.  However,
sh_msiof_spi_setup() changes only the latter.

Fix this by updating the SIRMDR1 register like the SITMDR1 register,
taking into account register bits that exist in SITMDR1 only.

Reported-by: Renesas BSP team via Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Fixes: 7ff0b53c4051145d ("spi: sh-msiof: Avoid writing to registers from spi_master.setup()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-msiof.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 8171eedbfc90..c75641b9df79 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -564,14 +564,16 @@ static int sh_msiof_spi_setup(struct spi_device *spi)
 
 	/* Configure native chip select mode/polarity early */
 	clr = MDR1_SYNCMD_MASK;
-	set = MDR1_TRMD | TMDR1_PCON | MDR1_SYNCMD_SPI;
+	set = MDR1_SYNCMD_SPI;
 	if (spi->mode & SPI_CS_HIGH)
 		clr |= BIT(MDR1_SYNCAC_SHIFT);
 	else
 		set |= BIT(MDR1_SYNCAC_SHIFT);
 	pm_runtime_get_sync(&p->pdev->dev);
 	tmp = sh_msiof_read(p, TMDR1) & ~clr;
-	sh_msiof_write(p, TMDR1, tmp | set);
+	sh_msiof_write(p, TMDR1, tmp | set | MDR1_TRMD | TMDR1_PCON);
+	tmp = sh_msiof_read(p, RMDR1) & ~clr;
+	sh_msiof_write(p, RMDR1, tmp | set);
 	pm_runtime_put(&p->pdev->dev);
 	p->native_cs_high = spi->mode & SPI_CS_HIGH;
 	p->native_cs_inited = true;
-- 
2.17.0
