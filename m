Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:51499 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751648AbcJDJZe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 05:25:34 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Yangbo Lu <yangbo.lu@nxp.com>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/4] arm64: renesas: r8a7795: R-Car H3 ES2.0 Prototype
Date: Tue,  4 Oct 2016 11:25:23 +0200
Message-Id: <1475573127-30054-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

Some Renesas SoCs may exist in different revisions, providing slightly
different functionalities. This needs to be catered for by drivers
and/or platform code.  The recently proposed soc_device_match() API
seems like a good fit to handle this.

This patch series provides a prototype to handle the clock and pin
control differences between R-Car H3 ES1.x and ES2.0 SoCs:
  - The clock difference handling should be fully functional.
    It is implemented by keeping all clock tables up-to-date for the
    latest SoC (except for clocks removed in later revisions), and
    fixing up the tables at runtime for the actual SoC detected.
    I've also tried the alternative solution of keeping one set of clock
    tables for each SoC revision, but this increases kernel size by ca.
    3 KiB.
  - The pinctrl difference handling is just a skeleton for now,
    providing a Proof-of-Concept.

This patch series depends on "[PATCH 0/4] soc: renesas: Identify SoC and
register with the SoC bus".

This has been tested on r8a7795/salvator-x, which has an R-Car H3 ES1.0
SoC, and by faking the presence of an R-Car H3 ES1.1 or ES2.0 Soc.
This has not been tested on actual R-Car H3 ES1.1 or ES2.0 SoCs, due to
lack of hardware.

For your convenience, this series (and its dependencies) is also available in
the topic/r8a7795-es2-v1 branch of my renesas-drivers git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git

Thanks for your comments!

Geert Uytterhoeven (4):
  [RFC] clk: renesas: cpg-mssr: Add support for fixing up clock tables
  [RFC] clk: renesas: Add r8a7795 ES2.0 CPG Core Clock Definitions
  [RFC] clk: renesas: r8a7795: Add support for R-Car H3 ES2.0
  [RFC] pinctrl: sh-pfc: r8a7795: Add PoC support for R-Car H3 ES2.0

 drivers/clk/renesas/r8a7795-cpg-mssr.c       | 151 +++++++++++++++++++++------
 drivers/clk/renesas/renesas-cpg-mssr.c       |  50 +++++++++
 drivers/clk/renesas/renesas-cpg-mssr.h       |  22 ++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c         |  19 ++++
 include/dt-bindings/clock/r8a7795-cpg-mssr.h |   7 ++
 5 files changed, 216 insertions(+), 33 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
