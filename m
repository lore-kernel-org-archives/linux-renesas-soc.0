Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:58936 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1426194AbeCBKSI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Mar 2018 05:18:08 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.17
Date: Fri,  2 Mar 2018 11:18:06 +0100
Message-Id: <1519985886-3889-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Linus,

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.17-tag1

for you to fetch changes up to a8ab4f2bd8a5298679dabe16910322625a0df247:

  pinctrl: sh-pfc: r8a77965: Add support for INTC-EX IRQ pins (2018-02-28 09:17:54 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.17

  - Add DU and VIN pin groups on R-Car D3,
  - Add HDMI, TMU, and VIN pin groups on R-Car H3 and M3-W,
  - Add support for the new R-Car M3-N SoC,
  - Small fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: pinctrl: sh-pfc: Correct SoC family name for R8A7778

Jacopo Mondi (3):
      pinctrl: sh-pfc: Initial R-Car M3-N support
      pinctrl: sh-pfc: r8a77965: Add SCIFs groups/functions
      pinctrl: sh-pfc: r8a77965: Add EtherAVB groups/functions

Markus Elfring (1):
      pinctrl: sh-pfc: Use seq_puts() in sh_pfc_pin_dbg_show()

Takeshi Kihara (10):
      pinctrl: sh-pfc: r8a7795: Fix MOD_SEL register pin assignment for SSI pins group
      pinctrl: sh-pfc: r8a7796: Fix MOD_SEL register pin assignment for SSI pins group
      pinctrl: sh-pfc: r8a7796: Fix IPSR and MOD_SEL register pin assignment for NDFC pins group
      pinctrl: sh-pfc: r8a7795: Add HDMI pins, groups and functions
      pinctrl: sh-pfc: r8a7795-es1: Add HDMI pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Add HDMI pins, groups and functions
      pinctrl: sh-pfc: r8a7795: Add TMU pins, groups and functions
      pinctrl: sh-pfc: r8a7795-es1: Add TMU pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Add TMU pins, groups and functions
      pinctrl: sh-pfc: r8a77965: Add support for INTC-EX IRQ pins

Ulrich Hecht (4):
      pinctrl: sh-pfc: r8a77995: Add DU pins, groups and function
      pinctrl: sh-pfc: r8a7796: Add VIN4, VIN5 pins, groups and functions
      pinctrl: sh-pfc: r8a7795: Add VIN4, VIN5 pins, groups and functions
      pinctrl: sh-pfc: r8a77995: Add VIN4 pins, groups and function

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    3 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |   72 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  564 +++-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  569 +++-
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              | 3193 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              |  293 ++
 drivers/pinctrl/sh-pfc/pinctrl.c                   |    2 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    1 +
 11 files changed, 4659 insertions(+), 50 deletions(-)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77965.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
