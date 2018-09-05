Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:39250 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728170AbeIENwt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 09:52:49 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>
Cc: Gaku Inami <gaku.inami.xw@bp.renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] spi: renesas: Miscellaneous fixes
Date: Wed,  5 Sep 2018 10:49:35 +0200
Message-Id: <20180905084939.7401-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Mark,

This series contains a set of miscellaneous fixes for Renesas MSIOF and
RSPI SPI controllers:
  - The SPI queue must be stopped during s2idle/s2ram,
  - Interrupted DMA transfers must be terminated properly,
  - Read-only register bits must be written zero.

They have been tested on r8a7791/koelsch (RSPI, s2ram),
r8a77965/salvator-xs (MSIOF, s2idle/s2ram), and r8a77990/ebisu (MSIOF,
s2idle).

Thanks!

Gaku Inami (1):
  spi: sh-msiof: Fix invalid SPI use during system suspend

Geert Uytterhoeven (2):
  spi: rspi: Fix invalid SPI use during system suspend
  spi: rspi: Fix interrupted DMA transfers

Hiromitsu Yamasaki (1):
  spi: sh-msiof: Fix handling of write value for SISTR register

 drivers/spi/spi-rspi.c     | 34 ++++++++++++++++++++++++++++++----
 drivers/spi/spi-sh-msiof.c | 28 +++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 5 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
