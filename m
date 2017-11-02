Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:55964 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755532AbdKBNVc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Nov 2017 09:21:32 -0400
From: Mark Brown <broonie@kernel.org>
To: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: Fix DMA transfer size check" to the spi tree
In-Reply-To: <1478527623-17960-1-git-send-email-horms+renesas@verge.net.au>
Message-Id: <E1eAFQw-0005zD-If@debutante>
Date: Thu, 02 Nov 2017 13:21:22 +0000
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   spi: sh-msiof: Fix DMA transfer size check

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

>From 36735783fdb599c94b9c86824583df367c65900b Mon Sep 17 00:00:00 2001
From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Date: Thu, 2 Nov 2017 10:32:36 +0100
Subject: [PATCH] spi: sh-msiof: Fix DMA transfer size check

DMA supports 32-bit words only,
even if BITLEN1 of SITMDR2 register is 16bit.

Fixes: b0d0ce8b6b91 ("spi: sh-msiof: Add DMA support")
Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-msiof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 0eb1e9583485..837bb95eea62 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -900,7 +900,7 @@ static int sh_msiof_transfer_one(struct spi_master *master,
 				break;
 			copy32 = copy_bswap32;
 		} else if (bits <= 16) {
-			if (l & 1)
+			if (l & 3)
 				break;
 			copy32 = copy_wswap32;
 		} else {
-- 
2.15.0
