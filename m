Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:35936 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbeLGMWK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 07:22:10 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.21 (take two)
Date: Fri,  7 Dec 2018 13:22:03 +0100
Message-Id: <20181207122203.32763-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit eb38c119dd91c61de26f67050671a84064554f7d:

  clk: renesas: r7s9210: Add USB clocks (2018-11-13 09:58:51 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.21-tag2

for you to fetch changes up to 36c4da4f552a126bb29a95dc5c9608795491e32a:

  clk: renesas: rcar-gen3: Add HS400 quirk for SD clock (2018-12-07 11:45:06 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v4.21 (take two)

  - Add support for CPEX (timer) clocks on various R-Car Gen3 and RZ/G2
    SoCs,
  - Add support for SDHI HS400 clocks on early revisions of R-Car H3 and
    M3-W,
  - Miscellaneous fixes based on the Hardware Manual Errata.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (12):
      dt-bindings: clock: r8a7795: Remove CSIREF clock
      dt-bindings: clock: r8a7796: Remove CSIREF clock
      clk: renesas: r8a774a1: Add CPEX clock
      clk: renesas: r8a7795: Add CPEX clock
      clk: renesas: r8a7796: Add CPEX clock
      clk: renesas: r8a77965: Add CPEX clock
      clk: renesas: r8a77970: Add CPEX clock
      clk: renesas: r8a77995: Correct parent clock of DU
      clk: renesas: r8a77995: Remove non-existent VIN5-7 module clocks
      clk: renesas: r8a77995: Remove non-existent SSP clocks
      clk: renesas: r8a77995: Add missing CPEX clock
      clk: renesas: r8a77995: Simplify PLL3 multiplier/divider

Niklas Söderlund (3):
      clk: renesas: rcar-gen3: Set state when registering SD clocks
      clk: renesas: rcar-gen3: Add documentation for SD clocks
      clk: renesas: rcar-gen3: Add HS400 quirk for SD clock

Takeshi Kihara (1):
      clk: renesas: r8a77990: Correct parent clock of DU

 drivers/clk/renesas/r8a774a1-cpg-mssr.c       |  1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c        |  1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c        |  1 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c       |  1 +
 drivers/clk/renesas/r8a77970-cpg-mssr.c       |  1 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c       |  4 +-
 drivers/clk/renesas/r8a77995-cpg-mssr.c       | 15 +++-----
 drivers/clk/renesas/rcar-gen3-cpg.c           | 55 ++++++++++++++++-----------
 include/dt-bindings/clock/r8a7795-cpg-mssr.h  |  2 +-
 include/dt-bindings/clock/r8a7796-cpg-mssr.h  |  2 +-
 include/dt-bindings/clock/r8a77995-cpg-mssr.h |  5 ++-
 11 files changed, 51 insertions(+), 37 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
