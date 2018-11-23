Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:35192 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408748AbeKWTkC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 14:40:02 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.21
Date: Fri, 23 Nov 2018 09:56:35 +0100
Message-Id: <20181123085635.31067-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.21-tag1

for you to fetch changes up to eb38c119dd91c61de26f67050671a84064554f7d:

  clk: renesas: r7s9210: Add USB clocks (2018-11-13 09:58:51 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v4.21

  - Add support for SDHI and USB clocks on RZ/A2,
  - Add support for RPC (SPI Multi I/O Bus Controller) clocks on R-Car
    V3M.

Thanks for pulling!

----------------------------------------------------------------
Chris Brandt (2):
      clk: renesas: r7s9210: Add SDHI clocks
      clk: renesas: r7s9210: Add USB clocks

Sergei Shtylyov (1):
      clk: renesas: r8a77970: Add RPC clocks

 drivers/clk/renesas/r7s9210-cpg-mssr.c  | 7 +++++++
 drivers/clk/renesas/r8a77970-cpg-mssr.c | 4 ++++
 2 files changed, 11 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
