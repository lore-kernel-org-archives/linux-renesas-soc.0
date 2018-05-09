Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:43980 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965667AbeEIQ5h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 May 2018 12:57:37 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.18
Date: Wed,  9 May 2018 18:57:35 +0200
Message-Id: <1525885055-22068-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Linus,

(this time with the right subject line)

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.18-tag1

for you to fetch changes up to f18fab4bcb4f85db806048b2ee44c885b46b5a0f:

  pinctrl: sh-pfc: Add r8a77470 PFC support (2018-05-04 11:42:54 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.18

  - Add DU, MSIOF, PWM, and SDHI pin groups on R-Car M3-N,
  - Add support for the new RZ/G1C SoC,
  - Add support for I/O voltage control on R-Car V3M and V3H,
  - Small fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: pinctrl: sh-pfc: Document r8a77470 PFC support
      pinctrl: sh-pfc: Add r8a77470 PFC support

Geert Uytterhoeven (2):
      pinctrl: sh-pfc: r8a7795: Fix comment for MSIOF3 SS2_E pin
      pinctrl: sh-pfc: r8a7796: Fix comment for MSIOF3 SS2_E pin

Kieran Bingham (1):
      pinctrl: sh-pfc: r8a77965: Add DU RGB output pins, groups and functions

Sergei Shtylyov (2):
      pinctrl: sh-pfc: r8a77980: Add pin I/O voltage control support
      pinctrl: sh-pfc: r8a77970: Fix pin I/O voltage control support

Takeshi Kihara (3):
      pinctrl: sh-pfc: r8a77965: Add MSIOF pins, groups and functions
      pinctrl: sh-pfc: r8a77965: Add PWM pins, groups and functions
      pinctrl: sh-pfc: r8a77965: Add SDHI pins, groups and functions

Thomas Gleixner (1):
      pinctrl: sh-pfc: r8a77965: Fixup incorrect SPDX identifier

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c              | 2343 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |    2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              | 1509 ++++++++++++-
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c              |   32 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c              |   52 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    1 +
 11 files changed, 3940 insertions(+), 14 deletions(-)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77470.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
