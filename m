Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:57128 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbeI1PEj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 11:04:39 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.20 (take two)
Date: Fri, 28 Sep 2018 10:41:56 +0200
Message-Id: <20180928084156.20198-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Linus,

The following changes since commit 2ed03c835d6f4dbe9f0d093187825d1c0e2e9b39:

  pinctrl: sh-pfc: r8a77990: Add DU pins, groups and function (2018-08-30 14:17:20 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.20-tag2

for you to fetch changes up to a97f340c0a071bcb32ff68f3d19cf56a76887288:

  pinctrl: sh-pfc: rcar: Rename automotive-only arrays to automotive (2018-09-28 09:49:15 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.20 (take two)

  - Add MSIOF pin groups on R-Car E3 and D3,
  - Add support for the new RZ/G1N (R8A7744) and RZ/G2E (R8A774C0) SoCs,
  - Add I2C4, DU0, QSPI0, SDHI2, and USB pin groups on RZ/G1C,
  - Convert to SPDX license identifiers,
  - Small cleanups.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: pinctrl: sh-pfc: Document r8a7744 PFC support
      pinctrl: sh-pfc: r8a7791: Add r8a7744 support

Fabrizio Castro (7):
      dt-bindings: pinctrl: sh-pfc: Document r8a774c0 PFC support
      pinctrl: sh-pfc: r8a77990: Add R8A774C0 PFC support
      pinctrl: sh-pfc: r8a77470: Add I2C4 pin groups
      pinctrl: sh-pfc: r8a77470: Add DU0 pin groups
      pinctrl: sh-pfc: r8a77470: Add QSPI0 pin groups
      pinctrl: sh-pfc: r8a77470: Add SDHI2 pin groups
      pinctrl: sh-pfc: r8a77470: Add USB pin groups

Geert Uytterhoeven (1):
      pinctrl: sh-pfc: rcar: Rename automotive-only arrays to automotive

Kuninori Morimoto (2):
      pinctrl: sh-pfc: Convert to SPDX identifiers
      pinctrl: rza1: Convert to SPDX identifiers

Takeshi Kihara (2):
      pinctrl: sh-pfc: r8a77990: Add MSIOF pins, groups and functions
      pinctrl: sh-pfc: r8a77995: Add MSIOF pins, groups and functions

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   2 +
 drivers/pinctrl/pinctrl-rza1.c                     |   5 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |  11 +
 drivers/pinctrl/sh-pfc/Makefile                    |   2 +
 drivers/pinctrl/sh-pfc/core.c                      |  17 +-
 drivers/pinctrl/sh-pfc/core.h                      |   7 +-
 drivers/pinctrl/sh-pfc/gpio.c                      |   5 +-
 drivers/pinctrl/sh-pfc/pfc-emev2.c                 |   5 +-
 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c               |  15 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c               |  15 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c              | 275 +++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |  10 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c               |  14 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |  15 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |  43 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c               |   5 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               |   5 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |   5 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |   5 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  17 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c              |   5 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c              | 666 +++++++++++++++++----
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              | 370 +++++++++++-
 drivers/pinctrl/sh-pfc/pfc-sh7203.c                |   5 +-
 drivers/pinctrl/sh-pfc/pfc-sh7264.c                |   5 +-
 drivers/pinctrl/sh-pfc/pfc-sh7269.c                |   5 +-
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c                |  15 +-
 drivers/pinctrl/sh-pfc/pfc-sh7720.c                |   5 +-
 drivers/pinctrl/sh-pfc/pfc-sh7723.c                |   5 +-
 drivers/pinctrl/sh-pfc/pfc-sh7724.c                |   5 +-
 drivers/pinctrl/sh-pfc/pfc-sh7734.c                |   5 +-
 drivers/pinctrl/sh-pfc/pfc-sh7757.c                |   5 +-
 drivers/pinctrl/sh-pfc/pfc-sh7785.c                |   5 +-
 drivers/pinctrl/sh-pfc/pfc-sh7786.c                |   5 +-
 drivers/pinctrl/sh-pfc/pfc-shx3.c                  |   5 +-
 drivers/pinctrl/sh-pfc/pinctrl.c                   |   5 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   9 +-
 37 files changed, 1293 insertions(+), 310 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
