Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:57470 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387605AbeKWTno (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 14:43:44 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.21
Date: Fri, 23 Nov 2018 10:00:15 +0100
Message-Id: <20181123090015.31373-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Linus,

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.21-tag1

for you to fetch changes up to b59d0e782706785b7042539e820e95df3be4d04c:

  pinctrl: Add RZ/A2 pin and gpio controller (2018-11-23 09:30:27 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.21

  - Fix VIN (Video IN) versioned groups on R-Car V2H, H3, and M3-W,
  - Add I2C[0-3], DU1, VIN, QSPI1, and SDHI pin groups on RZ/G1C,
  - Add audio, SDHI, VIN, HSCIF, and CAN(FD) support on R-Car E3,
  - Add QSPI pin groups on R-Car V3M and V3H,
  - Add VIN and CAN(FD) pin groups on R-Car M3-N,
  - Add I2C[035] pin groups on R-Car H3 and M3-W,
  - Add pinctrl and GPIO support for the new RZ/A2M (R7S9210) SoC,
  - Small cleanups,
  - Maintainership updates.

Thanks for pulling!

----------------------------------------------------------------
Chris Brandt (2):
      dt-bindings: pinctrl: Add RZ/A2 pinctrl and GPIO
      pinctrl: Add RZ/A2 pin and gpio controller

Dmitry Shifrin (2):
      pinctrl: sh-pfc: r8a77970: Add QSPI pins, groups, and functions
      pinctrl: sh-pfc: r8a77980: Add QSPI pins, groups, and functions

Fabrizio Castro (5):
      pinctrl: sh-pfc: r8a77470: Add remaining I2C pin groups
      pinctrl: sh-pfc: r8a77470: Add DU1 pin groups
      pinctrl: sh-pfc: r8a77470: Add VIN pin groups
      pinctrl: sh-pfc: r8a77470: Add QSPI1 pin groups
      pinctrl: sh-pfc: r8a77470: Add SDHI support

Geert Uytterhoeven (3):
      MAINTAINERS: Add Renesas RZ/A and RZ/N files to Renesas pinctrl section
      pinctrl: sh-pfc: Reduce kernel size for narrow VIN channels
      pinctrl: sh-pfc: r8a77995: Remove unused PINMUX_IPSR_{MSEL2,PHYS}()

Jacopo Mondi (6):
      pinctrl: sh-pfc: Add optional arg to VIN_DATA_PIN_GROUP
      pinctrl: sh-pfc: r8a7792: Fix VIN versioned groups
      pinctrl: sh-pfc: r8a7795: Fix VIN versioned groups
      pinctrl: sh-pfc: r8a7796: Fix VIN versioned groups
      pinctrl: sh-pfc: r8a77965: Add VIN[4|5] groups/functions
      pinctrl: sh-pfc: r8a77990: Add VIN[4|5] groups/functions

Laurent Pinchart (1):
      MAINTAINERS: Remove Laurent Pinchart as Renesas pinctrl maintainer

Takeshi Kihara (12):
      pinctrl: sh-pfc: r8a77990: Add Audio clock pins, groups and functions
      pinctrl: sh-pfc: r8a77990: Add Audio SSI pins, groups and functions
      pinctrl: sh-pfc: r8a77990: Add SDHI pins, groups and functions
      pinctrl: sh-pfc: r8a77990: Add voltage switch operations for SDHI
      pinctrl: sh-pfc: r8a77990: Add HSCIF pins, groups, and functions
      pinctrl: sh-pfc: r8a7795: Add I2C{0,3,5} pins, groups and functions
      pinctrl: sh-pfc: r8a7795-es1: Add I2C{0,3,5} pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Add I2C{0,3,5} pins, groups and functions
      pinctrl: sh-pfc: r8a77965: Add CAN pins, groups and functions
      pinctrl: sh-pfc: r8a77965: Add CAN FD pins, groups and functions
      pinctrl: sh-pfc: r8a77990: Add CAN pins, groups and functions
      pinctrl: sh-pfc: r8a77990: Add CAN FD pins, groups and functions

Ulrich Hecht (1):
      pinctrl: sh-pfc: Add physical pin multiplexing helper macros

 .../bindings/pinctrl/renesas,rza2-pinctrl.txt      |   87 +
 MAINTAINERS                                        |    2 +-
 drivers/pinctrl/Kconfig                            |   11 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-rza2.c                     |  519 ++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c              |  678 ++++++-
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c               |   22 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               |    4 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |   97 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  119 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  122 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              |  370 ++++
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c              |   70 +
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c              |   70 +
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c              | 1934 +++++++++++++++++---
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              |    6 -
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   54 +-
 include/dt-bindings/pinctrl/r7s9210-pinctrl.h      |   47 +
 18 files changed, 3841 insertions(+), 372 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-rza2.c
 create mode 100644 include/dt-bindings/pinctrl/r7s9210-pinctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
