Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:65087 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754352AbeDMMod (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 08:44:33 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC: <linux-spi@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 1/2] spi: sh-msiof: Fix bit field overflow writes to TSCR/RSCR
Date: Fri, 13 Apr 2018 15:44:16 +0300
Message-ID: <1523623457-9682-2-git-send-email-vladimir_zapolskiy@mentor.com>
In-Reply-To: <1523623457-9682-1-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1523623457-9682-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

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
2.8.1
