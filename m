Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:65080 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754047AbeDMMob (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 08:44:31 -0400
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC: <linux-spi@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 0/2] spi: sh-msiof: Fix bit field overflow writes to TSCR/RSCR
Date: Fri, 13 Apr 2018 15:44:15 +0300
Message-ID: <1523623457-9682-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The changeset fixes a bit field overflow which allows to write to higher
bits while calculating SPI transfer clock and setting BRPS and BRDV bit
fields, the problem is reproduced if 'parent_rate' to 'spi_hz' ratio is
greater than 1024.

I attach the second patch to the series, because actually the squashed
change is the sole fix as well, the split was done only to simplify
backporting of the most essential part.

The reorganization of sh_msiof_spi_set_clk_regs() function allows to
avoid min_t()/max_t(), break/continue in the loop etc., which hopefully
is seen as a beneficial update.

Geert, I'd appreciate if you can find time to review and test the changes.

Vladimir Zapolskiy (2):
  spi: sh-msiof: Fix bit field overflow writes to TSCR/RSCR
  spi: sh-msiof: Simplify calculation of divisors for transfer rate

 drivers/spi/spi-sh-msiof.c | 66 ++++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 31 deletions(-)

-- 
2.8.1
