Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:47258 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751595AbeCVRJf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Mar 2018 13:09:35 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.17 (take two)
Date: Thu, 22 Mar 2018 18:09:32 +0100
Message-Id: <1521738572-14877-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Linus,

The following changes since commit a8ab4f2bd8a5298679dabe16910322625a0df247:

  pinctrl: sh-pfc: r8a77965: Add support for INTC-EX IRQ pins (2018-02-28 09:17:54 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.17-tag2

for you to fetch changes up to a6fff41f410bf030d5cd178154b8397536e714f9:

  pinctrl: sh-pfc: r8a77995: Deduplicate VIN4 pin definitions (2018-03-21 18:25:48 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.17 (take two)

  - Add USB pin groups on R-Car M3-N,
  - Add support for the new R-Car V3H SoC,
  - Add EtherAVB pin groups on R-Car V3M,
  - Miscellaneous fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (7):
      pinctrl: sh-pfc: r8a7790: Add missing TX_ER pin to avb_mii group
      pinctrl: sh-pfc: Add SH_PFC_PIN_GROUP_ALIAS()
      pinctrl: sh-pfc: r8a7795: Rename EtherAVB "mdc" pin group to "mdio"
      pinctrl: sh-pfc: r8a7795-es1: Rename EtherAVB "mdc" pin group to "mdio"
      pinctrl: sh-pfc: r8a7796: Rename EtherAVB "mdc" pin group to "mdio"
      pinctrl: sh-pfc: r8a77965: Rename EtherAVB "mdc" pin group to "mdio"
      pinctrl: sh-pfc: r8a77995: Rename EtherAVB "mdc" pin group to "mdio"

Sergei Shtylyov (3):
      pinctrl: sh-pfc: Add PORT_GP_CFG_25() helper macro
      pinctrl: sh-pfc: Add R8A77980 PFC support
      pinctrl: sh-pfc: r8a77970: Add EtherAVB pin groups

Takeshi Kihara (2):
      pinctrl: sh-pfc: r8a77965: Add USB2.0 host pins, groups and functions
      pinctrl: sh-pfc: r8a77965: Add USB3.0 host pins, groups and functions

Ulrich Hecht (6):
      pinctrl: sh-pfc: r8a7795: Correct VIN4 18-bit pins
      pinctrl: sh-pfc: r8a7796: Correct VIN4 18-bit pins
      pinctrl: sh-pfc: r8a77995: Correct VIN4 18-bit pins
      pinctrl: sh-pfc: r8a7795: Deduplicate VIN4 pin definitions
      pinctrl: sh-pfc: r8a7796: Deduplicate VIN4 pin definitions
      pinctrl: sh-pfc: r8a77995: Deduplicate VIN4 pin definitions

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |    8 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |   10 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  332 +--
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  332 +--
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              |   58 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c              |   98 +
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c              | 2799 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              |  170 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   14 +-
 13 files changed, 3199 insertions(+), 635 deletions(-)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77980.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
