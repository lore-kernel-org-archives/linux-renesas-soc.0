Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:57908 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752972AbeDPRQV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Apr 2018 13:16:21 -0400
From: Mark Brown <broonie@kernel.org>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: Fix bit field overflow writes to TSCR/RSCR" to the spi tree
In-Reply-To: <1523623457-9682-2-git-send-email-vladimir_zapolskiy@mentor.com>
Message-Id: <E1f87jl-0003A7-R8@debutante>
Date: Mon, 16 Apr 2018 18:16:17 +0100
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   spi: sh-msiof: Fix bit field overflow writes to TSCR/RSCR

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

>From 10b4640833e95eeacaef8060bc1b35e636df3218 Mon Sep 17 00:00:00 2001
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Date: Fri, 13 Apr 2018 15:44:16 +0300
Subject: [PATCH] spi: sh-msiof: Fix bit field overflow writes to TSCR/RSCR

The change fixes a bit field overflow which allows to write to higher
bits while calculating SPI transfer clock and setting BRPS and BRDV
bit fields, the problem is reproduced if 'parent_rate' to 'spi_hz'
ratio is greater than 1024, for instance

  p->min_div      = 2,
  MSO rate        = 33333333,
  SPI device rate = 10000

results in

  k          = 5, i.e. BRDV = 0b100 or 1/32 prescaler output,
  BRPS       = 105,
  TSCR value = 0x6804, thus MSSEL and MSIMM bit fields are non-zero.

Fixes: 65d5665bb260 ("spi: sh-msiof: Update calculation of frequency dividing")
Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-msiof.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index ae086aab57d5..8171eedbfc90 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -283,6 +283,7 @@ static void sh_msiof_spi_set_clk_regs(struct sh_msiof_spi_priv *p,
 	}
 
 	k = min_t(int, k, ARRAY_SIZE(sh_msiof_spi_div_table) - 1);
+	brps = min_t(int, brps, 32);
 
 	scr = sh_msiof_spi_div_table[k].brdv | SCR_BRPS(brps);
 	sh_msiof_write(p, TSCR, scr);
-- 
2.17.0
